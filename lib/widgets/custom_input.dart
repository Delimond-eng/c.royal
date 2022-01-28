import 'package:c_royal/settings/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String prefix;
  final IconData icon;
  final TextInputType keyType;
  final int maxLgt;

  const CustomField({
    Key key,
    this.controller,
    this.hintText,
    this.icon,
    this.keyType,
    this.prefix,
    this.maxLgt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 12.0,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 14.0),
        keyboardType: keyType ?? TextInputType.text,
        maxLength: (maxLgt != null) ? maxLgt : null,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
          hintText: hintText,
          prefix: prefix != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    prefix,
                    style: GoogleFonts.lato(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              : const Text(""),
          hintStyle: const TextStyle(color: Colors.black54),
          icon: prefix == null
              ? Container(
                  width: 50.0,
                  height: 50.0,
                  child: Icon(
                    icon,
                    color: primaryColor.withOpacity(.7),
                    size: 20.0,
                  ),
                )
              : null,
          border: InputBorder.none,
          counterText: '',
        ),
      ),
    );
  }
}
