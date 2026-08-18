import '../../../../common/widgets/snackbar/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../common/widgets/spinner/spinner.dart';
import 'package:toastification/toastification.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../common/widgets/signin_signup/social_buttons.dart';
import '../../../order/presentation/pages/barel.dart';
import '../bloc/auth_bloc.dart';
import 'widgets/signin_form.dart';
import 'widgets/auth_header.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ToastHelper.show(context,
                message: state.errorMessage ?? "Sth is wrng",
                type: ToastType.error);
          }
          if (state is AuthSuccess) {
            ToastHelper.show(
              context,
              message: state.message,
              type: ToastType.success,
            );
          }
          if (state is AuthNeedsVerification) {
            ToastHelper.show(
              context,
              message: state.errorMessage ?? "Verify your email",
              type: ToastType.warning,
            );
            context.goNamed(RouteNames.verifyEmail, extra: state.email);
          }
          if (state is AuthVerificationSent) {
            ToastHelper.show(
              context,
              message: state.errorMessage ?? "Verify your email",
              type: ToastType.warning,
            );
            context.goNamed(RouteNames.resetPassword, extra: state.email);
          }
        },
        builder: (context, state) {
          return Stack(children: [
            _buildSignInBody(context),
          ]);
        },
      ),
    );
  }
}
Widget _buildSignInBody(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: AppSizes.md),
          AuthHeader(title: AppTexts.signIn, subtitle: AppTexts.loginSubTitle),
          SizedBox(height: AppSizes.spaceBtwSections),
          SignInForm(),
          SizedBox(height: AppSizes.spaceBtwSections),
          TextButton(
              onPressed: () {
                context.pushNamed(RouteNames.forgotPassword);
              },
              child: Text('Forgot the Password?')),
          SizedBox(height: AppSizes.spaceBtwSections),
          Row(
            children: [
              Expanded(
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
              Text(AppTexts.orSignInWith,
                  style: Theme.of(context).textTheme.bodySmall),
              Expanded(
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
          SizedBox(height: AppSizes.spaceBtwSections),
          SocialButtons(),
          SizedBox(height: AppSizes.spaceBtwSections),
          RichText(
            text:
                TextSpan(style: DefaultTextStyle.of(context).style, children: [
              TextSpan(text: "${AppTexts.dontHaveAnAcc} "),
              TextSpan(
                style: TextStyle(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => context.goNamed(RouteNames.signUp),
                text: AppTexts.signUp,
              )
            ]),
          )
        ],
      ),
    ),
  );
}