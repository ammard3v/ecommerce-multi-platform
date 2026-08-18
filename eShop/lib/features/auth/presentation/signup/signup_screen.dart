import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/signin_signup/social_buttons.dart';
import '../../../../common/widgets/snackbar/toast.dart';
import '../../../../common/widgets/spinner/spinner.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../bloc/auth_bloc.dart';
import '../signin/widgets/auth_header.dart';
import 'widgets/signup_form.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthNeedsVerification) {
            ToastHelper.show(
              context,
              message: state.errorMessage ?? "Verify your email",
              type: ToastType.warning,
            );
            context.goNamed(RouteNames.verifyEmail, extra: state.email);
          }
          if (state is AuthFailure) {
            ToastHelper.show(context,
                message: state.errorMessage ?? "Sth is wrng",
                type: ToastType.error);
          }
        },
        builder: (context, state) {
          return Stack(children: [
            _buildSignUpBody(context),
            if (state is AuthLoading) Spinner(),
          ]);
        },
      ),
    );
  }
}
Widget _buildSignUpBody(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AuthHeader(
              title: AppTexts.signUp, subtitle: AppTexts.signupTitle),
          const SizedBox(height: AppSizes.spaceBtwSections),
          const SignupForm(),
          const SizedBox(height: AppSizes.spaceBtwSections),
          Row(
            children: [
              const Expanded(
                child: Divider(
                  height: 10,
                  thickness: 2,
                  indent: 0,
                  endIndent: 10,
                  color: AppColors.buttonDisabled,
                  radius: BorderRadius.horizontal(
                      left: Radius.circular(12), right: Radius.circular(12)),
                ),
              ),
              Text(AppTexts.orSignUpWith,
                  style: Theme.of(context).textTheme.bodySmall),
              const Expanded(
                child: Divider(
                  height: 10,
                  thickness: 2,
                  indent: 10,
                  endIndent: 0,
                  color: AppColors.buttonDisabled,
                  radius: BorderRadius.horizontal(
                      left: Radius.circular(12), right: Radius.circular(12)),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          const SocialButtons(),
          const SizedBox(height: AppSizes.spaceBtwSections),
          RichText(
            text:
                TextSpan(style: DefaultTextStyle.of(context).style, children: [
              TextSpan(text: "${AppTexts.alreadyHaveAnAcc} "),
              TextSpan(
                style: TextStyle(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => context.goNamed(RouteNames.signIn),
                text: AppTexts.signIn,
              )
            ]),
          )
        ],
      ),
    ),
  );
}