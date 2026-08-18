import '../../data/model/resend_otp_req.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/widgets/loader/loader.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/button/elevated_button.dart';
import '../bloc/auth_bloc.dart';
import 'widgets/otp_form.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
class GoogleSetupScreen extends StatefulWidget {
  const GoogleSetupScreen({super.key, required this.userDetail});
  final Map<String, dynamic> userDetail;
  @override
  State<GoogleSetupScreen> createState() => _GoogleSetupScreenState();
}
class _GoogleSetupScreenState extends State<GoogleSetupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController otpPIN = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController =
        TextEditingController(text: widget.userDetail['name'] ?? '');
    emailController =
        TextEditingController(text: widget.userDetail['email'] ?? '');
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    otpPIN.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        title: Text(
          'Verify & Register',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthVerificationSent) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
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
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Enter your name'
                          : null,
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value == null || !value.contains('@')
                              ? 'Enter valid email'
                              : null,
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) => value == null || value.length < 6
                          ? 'Password too short'
                          : null,
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) => value != passwordController.text
                          ? 'Passwords do not match'
                          : null,
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    OtpInput(otpPIN: otpPIN),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    ResendText(
                      onTap: () {
                        context.read<AuthBloc>().add(ResendOtp(
                            resendOtpReq:
                                ResendOtpReq(email: emailController.text)));
                      },
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    DElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                        }
                      },
                      child: const Text(AppTexts.verify),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
class ResendText extends StatelessWidget {
  const ResendText({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(text: '${AppTexts.didntReceiveCode} '),
          TextSpan(
            text: AppTexts.resendOTP,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.darkGrey,
                ),
          ),
        ],
      ),
    );
  }
}