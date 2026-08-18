import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../signin/widgets/auth_header.dart';
import '../../../../utils/constants/texts.dart';
import 'widgets/forgot_password_form.dart';
import '../../../../utils/constants/sizes.dart';
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
          showBackArrow: true, title: Text(AppTexts.forgetPasswordTitle)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ForgotPasswordForm(),
                SizedBox(height: AppSizes.spaceBtwSections),
              ],
            ),
          ),
        ),
      ),
    );
  }
}