import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/button/main_button.dart';
import '../../../../common/widgets/loader/loader.dart';
import '../../../../common/widgets/snackbar/toast.dart';
import '../../../../common/widgets/spinner/spinner.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../data/model/models.dart';
import '../../data/model/resend_otp_req.dart';
import '../bloc/auth_bloc.dart';
import '../signin/widgets/auth_header.dart';
import 'widgets/otp_form.dart';
class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    super.key,
    required this.email,
    required this.prefilledOtp,
  });
  final String email;
  final String prefilledOtp;
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}
class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController otpPIN = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.prefilledOtp.isNotEmpty) {
      otpPIN.text = widget.prefilledOtp;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<AuthBloc>().add(VerifyEmail(
            userVerifyAccountReq:
                UserVerifyAccountReq(email: widget.email, otp: otpPIN.text)));
      });
    }
  }
  @override
  void dispose() {
    otpPIN.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async => false,
      child: Scaffold(
        appBar: DAppBar(
            showBackArrow: true, leadingOnPressed: () => context.go("/signIn")),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthVerificationFailure) {
              ToastHelper.show(context,
                  message: state.message, type: ToastType.error);
            }
            if (state is AuthSuccess) {
              ToastHelper.show(context,
                  message: state.message, type: ToastType.success);
            }
            if (state is AuthVerificationSent) {
              ToastHelper.show(context,
                  message: state.message, type: ToastType.success);
            }
            if (state is AuthSuccess) {
              context.go('/navigationMenu');
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.defaultSpace),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthHeader(
                              title: AppTexts.verifyCode,
                              subtitle: AppTexts.verifyCodeSubTitle),
                          Text(
                            widget.email,
                            style: const TextStyle(color: AppColors.primary),
                          ),
                          const SizedBox(height: AppSizes.spaceBtwItems),
                          OtpInput(otpPIN: otpPIN),
                          const SizedBox(height: AppSizes.spaceBtwSections),
                          RichText(
                            text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: [
                                  TextSpan(
                                      text: "${AppTexts.didntReceiveCode} "),
                                  TextSpan(
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.primary,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => context
                                          .read<AuthBloc>()
                                          .add(ResendOtp(
                                              resendOtpReq: ResendOtpReq(
                                                  email: widget.email))),
                                    text: AppTexts.resendOTP,
                                  )
                                ]),
                          ),
                          const SizedBox(height: AppSizes.spaceBtwSections),
                          MainButton(
                              text: AppTexts.verify,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(VerifyEmail(
                                      userVerifyAccountReq:
                                          UserVerifyAccountReq(
                                              email: widget.email,
                                              otp: otpPIN.text)));
                                }
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                if (state is AuthLoading) Spinner()
              ],
            );
          },
        ),
      ),
    );
  }
}