import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/loader/loader.dart';
import '../../../gen/assets.gen.dart';
Widget productImage(String? imageUrl, {double size = 50}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8), 
    child: CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      width: size,
      height: size,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.grey[300],
        width: size,
        height: size,
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        Assets.defaults.defaultUser.path,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    ),
  );
}