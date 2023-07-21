import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class XExtendedImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment alignment;
  const XExtendedImage({
    required this.url,
    this.width,
    this.fit,
    this.alignment = Alignment.center,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      cache: true,
      cacheKey: url,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return const Center(child: CircularProgressIndicator());
          case LoadState.completed:
            return ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              fit: BoxFit.cover,
            );
          case LoadState.failed:
            return const Center(child: Icon(Icons.error));
        }
      },
    );
  }
}
