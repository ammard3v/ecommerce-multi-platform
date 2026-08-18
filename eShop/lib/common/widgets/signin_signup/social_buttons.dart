import '../snackbar/toast.dart';
import '../../../utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.lightBackground,
              border: Border.all(
                color: AppColors.grey,
              ),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => context.read<AuthBloc>().add(GoogleSignIn()),
              icon: Image.asset(
                Assets.logos.googleIcon.path,
                height: AppSizes.iconMd,
                width: AppSizes.iconMd,
              )),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              color: AppColors.lightBackground,
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () =>
                  ToastHelper.show(context, message: AppTexts.notSupportedNow),
              icon: Image.asset(
                Assets.logos.appleIcon.path,
                height: AppSizes.iconMd,
                width: AppSizes.iconMd,
              )),
        )
      ],
    );
  }
}