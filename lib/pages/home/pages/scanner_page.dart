import 'dart:async';
import 'dart:io';

import 'package:c_royal/components/app_header.dart';
import 'package:c_royal/components/notification_drawer.dart';
import 'package:c_royal/settings/style.dart';
import 'package:c_royal/settings/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  //Qr scan process !!
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;
  bool isLigthing = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      if (scanData.code != null && scanData.code.isNotEmpty) {
        controller.pauseCamera();
        Xloading.showLottieLoading(context);
        Future.delayed(const Duration(seconds: 5), () {
          Xloading.dismiss();
          Navigator.pop(context);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                borderColor: secondaryColor,
                overlayColor: Colors.white.withOpacity(.5),
                borderRadius: 5,
                borderLength: 50,
                borderWidth: 5,
                cutOutSize: 250,
              ),
              onQRViewCreated: onQRViewCreated,
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              top: 0,
              child: AppHeader(
                onOpenNotificateDrawer: () {
                  scaffoldKey.currentState.openEndDrawer();
                },
                isSecondaryPage: true,
                title: "Scan Qr code",
                icon: CupertinoIcons.qrcode_viewfinder,
              ),
            ),
          ],
        ),
      ),
      endDrawer: const NotificationDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        elevation: 10.0,
        onPressed: () async {
          setState(() {
            isLigthing = !isLigthing;
          });
          await controller.toggleFlash();
        },
        child: Icon(
          (isLigthing) ? Icons.flash_off_rounded : Icons.flash_on_rounded,
          color: Colors.white,
          size: 18.0,
        ),
      ),
    );
  }
}
