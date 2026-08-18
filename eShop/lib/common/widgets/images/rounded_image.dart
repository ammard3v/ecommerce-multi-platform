import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/constants/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.padding,
    this.onTap,
    this.borderRadius = AppSizes.md,
    bool isNetworkImage = false,
  });
  final double? height;
  final double? width;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final double borderRadius;
  bool get _isNetworkImage => imageUrl.startsWith('http');
  @override
  Widget build(BuildContext context) {
    final defaultAsset = Assets.defaults.defaultProduct.path;
    final imageWidget = _isNetworkImage
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            placeholder: (_, __) => Image.asset(
              defaultAsset,
              fit: fit,
            ),
            errorWidget: (_, __, ___) => Image.asset(
              defaultAsset,
              fit: fit,
            ),
          )
        : Image.asset(
            imageUrl,
            fit: fit,
          );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius:
              applyImageRadius ? BorderRadius.circular(borderRadius) : null,
        ),
        clipBehavior: applyImageRadius ? Clip.hardEdge : Clip.none,
        child: imageWidget,
      ),
    );
  }
}