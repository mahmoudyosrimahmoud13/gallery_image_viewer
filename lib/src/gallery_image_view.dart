import 'package:flutter/material.dart';

import '../gallery_image_viewer.dart';

class GalleryImageView extends StatelessWidget {
  /// The image to display
  final List<ImageProvider> listImage;

  /// The gallery width
  final double width;

  /// The gallery height
  final double height;

  /// The image BoxDecoration
  final BoxDecoration? imageDecoration;

  /// The image BoxFit
  final BoxFit boxFit;

  /// The Gallery type
  final int galleryType;

  /// The Gallery short image is maximum 4 images.
  final bool shortImage;

  /// Font size
  final double fontSize;

  /// Text color
  final Color textColor;

  /// Text shadow
  final List<Shadow>? textShadow;

   GalleryImageView(
      {Key? key,
      required this.listImage,
      this.boxFit = BoxFit.cover,
      this.imageDecoration,
      this.width = 100,
      this.height = 100,
      this.galleryType = 0,
      this.shortImage = true,
      this.fontSize = 32,
      this.textColor = Colors.white,  this.textShadow}){
        
      }

  @override
  Widget build(BuildContext context) {
    debugPrint("listImage length ::: ${listImage.length}");

    /// The gallery type was not sent, check listImage.length to call _uiImage.
    /// The gallery type was sent, call _uiImage on the gallery type sent.
    if (galleryType == 0) {
      if (listImage.length >= 2 && listImage.length < 5) {
        return SizedBox(width: width, height: height, child: _uiImage2(context));
      } else if (listImage.length >= 5) {
        return SizedBox(width: width, height: height, child: _uiImage3(context));
      } else {
        return SizedBox(width: width, height: height, child: _uiImage1(context));
      }
    } else if (galleryType == 2) {
      return SizedBox(width: width, height: height, child: _uiImage2(context));
    } else if (galleryType == 3) {
      return SizedBox(width: width, height: height, child: _uiImage3(context));
    } else {
      return SizedBox(width: width, height: height, child: _uiImage1(context));
    }
  }

  /// Left - Right
  Widget _uiImage1(BuildContext context) {
    if (shortImage && listImage.length >= 5) {
      int imgMore = listImage.length - 4;
      return Row(
        children: [
          for (int i = 0; i < 4; i++)
            Expanded(
              child: Container(
                decoration: imageDecoration,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: listImage[i],
                      fit: boxFit,
                    ),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        MultiImageProvider multiImageProvider = MultiImageProvider(listImage, initialIndex: i);
                        showImageViewerPager(context, multiImageProvider,
                            backgroundColor: Colors.black.withOpacity(0.3));
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          i == 3 ? "+$imgMore" : "",
                          style: TextStyle(color: textColor, fontSize: fontSize, shadows: textShadow),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      );
    }

    return Row(
      children: [
        for (int i = 0; i < listImage.length; i++)
          Expanded(
            child: Container(
              decoration: imageDecoration,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: listImage[i],
                    fit: boxFit,
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      MultiImageProvider multiImageProvider = MultiImageProvider(listImage, initialIndex: i);
                      showImageViewerPager(context, multiImageProvider, backgroundColor: Colors.black.withOpacity(0.3));
                    },
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// Left - Right(Top - Bottom)
  Widget _uiImage2(BuildContext context) {
    if (shortImage && listImage.length >= 5) {
      int imgMore = listImage.length - 4;
      return Row(
        children: [
          Expanded(
            child: Container(
              decoration: imageDecoration,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: listImage[0],
                    fit: boxFit,
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      MultiImageProvider multiImageProvider = MultiImageProvider(listImage, initialIndex: 0);
                      showImageViewerPager(context, multiImageProvider, backgroundColor: Colors.black.withOpacity(0.3));
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                for (int i = 1; i < 4; i++)
                  Expanded(
                    child: Container(
                      decoration: imageDecoration,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: listImage[i],
                            fit: boxFit,
                          ),
                        ),
                        width: double.infinity,
                        height: double.infinity,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              MultiImageProvider multiImageProvider = MultiImageProvider(listImage, initialIndex: i);
                              showImageViewerPager(context, multiImageProvider,
                                  backgroundColor: Colors.black.withOpacity(0.3));
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                i == 3 ? "+$imgMore" : "",
                                style: TextStyle(color: textColor, fontSize: fontSize, shadows: textShadow),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: imageDecoration,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: listImage[0],
                  fit: boxFit,
                ),
              ),
              width: double.infinity,
              height: double.infinity,
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      MultiImageProvider multiImageProvider = MultiImageProvider(listImage, initialIndex: 0);
                      showImageViewerPager(context, multiImageProvider, backgroundColor: Colors.black.withOpacity(0.3));
                    },
                  )),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              for (var i = 1; i < listImage.length; i++)
                Expanded(
                  child: Container(
                    decoration: imageDecoration,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: listImage[i],
                          fit: boxFit,
                        ),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            MultiImageProvider multiImageProvider = MultiImageProvider(listImage, initialIndex: i);
                            showImageViewerPager(context, multiImageProvider,
                                backgroundColor: Colors.black.withOpacity(0.3));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }

  /// Left - Right(Top - Bottom)
  Widget _uiImage3(BuildContext context) {
    if (shortImage && listImage.length >= 5) {
      int imgMore = listImage.length - 4;
      return Column(
        children: [
          Expanded(
            child: Container(
              decoration: imageDecoration,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: listImage[0],
                    fit: boxFit,
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      MultiImageProvider multiImageProvider = MultiImageProvider(listImage, initialIndex: 0);
                      showImageViewerPager(context, multiImageProvider, backgroundColor: Colors.black.withOpacity(0.3));
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                for (int i = 1; i < 4; i++)
                  Expanded(
                    child: Container(
                      decoration: imageDecoration,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: listImage[i], fit: boxFit),
                        ),
                        width: double.infinity,
                        height: double.infinity,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              MultiImageProvider multiImageProvider = MultiImageProvider(listImage, initialIndex: i);
                              showImageViewerPager(context, multiImageProvider,
                                  backgroundColor: Colors.black.withOpacity(0.3));
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                i == 3 ? "+$imgMore" : "",
                                style: TextStyle(color: textColor, fontSize: fontSize, shadows: textShadow),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      );
    }

    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: imageDecoration,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: listImage[0],
                  fit: boxFit,
                ),
              ),
              width: double.infinity,
              height: double.infinity,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    MultiImageProvider multiImageProvider = MultiImageProvider(listImage, initialIndex: 0);
                    showImageViewerPager(context, multiImageProvider, backgroundColor: Colors.black.withOpacity(0.3));
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              for (var i = 1; i < listImage.length; i++)
                Expanded(
                  child: Container(
                    decoration: imageDecoration,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: listImage[i],
                          fit: boxFit,
                        ),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            MultiImageProvider multiImageProvider = MultiImageProvider(listImage, initialIndex: i);
                            showImageViewerPager(context, multiImageProvider,
                                backgroundColor: Colors.black.withOpacity(0.3));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
