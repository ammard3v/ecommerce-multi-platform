import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../spinner/spinner.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
class CacheImage extends StatelessWidget {
  const CacheImage(
    this.imageUrl, {
    this.height = 40,
    this.width = 40,
    this.showbgColor = false,
    super.key,
  });
  final String imageUrl;
  final double height;
  final double width;
  final bool showbgColor;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) =>
          SizedBox(height: height, width: width, child: Spinner(size: 30)),
      errorWidget: (context, url, error) => const Icon(
        Icons.broken_image,
        size: AppSizes.iconMd,
        color: AppColors.primary,
      ),
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      color: showbgColor ? AppColors.primary : null,
    );
  }
}