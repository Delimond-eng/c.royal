import 'package:c_royal/models/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    Key key,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    @required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
    this.galleryTitle,
  })  : pageController = PageController(initialPage: 0),
        super(key: key);

  final LoadingBuilder loadingBuilder;
  final BoxDecoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final PageController pageController;
  final List<Medias> galleryItems;
  final Axis scrollDirection;
  final String galleryTitle;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: widget.backgroundDecoration,
              constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height,
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (context, index) {
                      var data = widget.galleryItems[index];
                      return PhotoViewGalleryPageOptions(
                        imageProvider: NetworkImage(data.media),
                        initialScale: PhotoViewComputedScale.contained,
                        minScale: PhotoViewComputedScale.contained *
                            (0.5 + index / 10),
                        maxScale: PhotoViewComputedScale.covered * 4.1,
                        heroAttributes:
                            PhotoViewHeroAttributes(tag: data.mediaId),
                      );
                    },
                    itemCount: widget.galleryItems.length,
                    loadingBuilder: widget.loadingBuilder,
                    backgroundDecoration: widget.backgroundDecoration,
                    pageController: widget.pageController,
                    onPageChanged: onPageChanged,
                    scrollDirection: widget.scrollDirection,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      widget.galleryTitle,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 15.0,
              left: 10.0,
              child: Container(
                height: 40.0,
                width: 60.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/svg/back-svgrepo-com.svg",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
