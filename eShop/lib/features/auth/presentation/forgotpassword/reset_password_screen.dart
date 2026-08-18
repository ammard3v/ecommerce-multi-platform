import 'package:eshop/common/widgets/snackbar/toast.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/button/main_button.dart';
import '../../../../common/widgets/loader/loader.dart';
import '../../../admin/admin_product/widgets/input_fields.dart';
import '../signin/widgets/auth_header.dart';
import '../signup/widgets/signup_form.dart';
import '../../../../utils/constants/texts.dart';
import '../../data/source/source.dart';
import '../../../../utils/constants/sizes.dart';
import '../bloc/auth_bloc.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}
class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController otpPIN = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  void dispose() {
    otpPIN.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter password";
    }
    if (value.length < 5) {
      return "Password should be 5 word long.";
    }
    return null;
  }
  String? validateConformPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter password";
    }
    if (value != newPassword.text) {
      return "Password dnt match";
    }
    if (value.length < 5) {
      return "Password should be 5 word long.";
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        resetStackRoute: '/signIn',
        title: Text(AppTexts.resetPassword),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthResetFailure) {
            ToastHelper.show(context,
                message: "Password Reset Failed", type: ToastType.error);
          }
          if (state is AuthSuccess) {
            ToastHelper.show(context, message: "Password Reset Succesfully");
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.primary));
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SignUpFormTextLabel(text: "OTP"),
                  SizedBox(height: AppSizes.spaceBtwInputFields / 3),
                  InputFields(
                    hintText: '******',
                    controller: otpPIN,
                  ),
                  SignUpFormTextLabel(text: AppTexts.password),
                  SizedBox(height: AppSizes.spaceBtwInputFields / 3),
                  InputFields(
                      hintText: '******',
                      controller: newPassword,
                      obscureText: true,
                      validator: validatePassword),
                  SizedBox(height: AppSizes.spaceBtwInputFields / 2),
                  SignUpFormTextLabel(text: AppTexts.conformpassword),
                  SizedBox(height: AppSizes.spaceBtwInputFields / 3),
                  InputFields(
                    hintText: '******',
                    controller: confirmPassword,
                    validator: validateConformPassword,
                    obscureText: true,
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  MainButton(
                      text: AppTexts.save,
                      onTap: () {
                        context.read<AuthBloc>().add(
                              ResetPassword(
                                  userResetPasswordReq: UserResetPasswordReq(
                                email: widget.email,
                                otp: otpPIN.text,
                                password: newPassword.text,
                                passwordConfirm: confirmPassword.text,
                              )),
                            );
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}