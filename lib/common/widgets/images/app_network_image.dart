import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: ValueKey(imageUrl),
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: width,
      height: height,
      errorWidget: (context, url, error) {
        return const Center(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Failed to load image',
              )),
        );
      },
    );
  }
}