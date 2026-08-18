import 'package:flutter/material.dart';
import '../../../../../utils/constants/texts.dart';
class SignupHeader extends StatelessWidget {
  const SignupHeader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.signupTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}