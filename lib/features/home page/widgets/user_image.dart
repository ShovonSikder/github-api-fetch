import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_paths.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    required this.imgURL,
    required this.width,
    required this.padding,
    required this.clipRadius,
  });

  final String imgURL;
  final double width;
  final double padding;
  final double clipRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.all(padding).copyWith(right: 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(clipRadius),
          child: CachedNetworkImage(
            imageUrl: imgURL,
            placeholder: (context, url) => const LinearProgressIndicator(),
            errorWidget: (context, url, error) =>
                Image.asset(AppPaths.personPlaceholder),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
