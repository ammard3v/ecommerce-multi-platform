import 'package:flutter/material.dart';
import '../../../../../utils/constants/texts.dart';
class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppTexts.forgetPasswordSubTitle),
      ],
    );
  }
}