import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import 'circular_image.dart';
class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppCircularImage(
      image: Assets.defaults.defaultUser.path,
      height: 100,
      width: 100,
      padding: 0,
    );
  }
}