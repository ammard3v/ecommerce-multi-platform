import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/route_names.dart';
import '../../../../../common/widgets/button/main_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../admin/admin_product/widgets/input_fields.dart';
import '../../bloc/auth_bloc.dart';
import '../../signup/widgets/signup_form.dart';
class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    super.key,
  });
  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}
class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) => {
        if (state is AuthVerificationSent)
          {
            context.go(RouteNames.resetPassword, extra: email.text)
          }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SignUpFormTextLabel(text: AppTexts.email),
            SizedBox(height: AppSizes.spaceBtwInputFields / 3),
            InputFields(
              hintText: 'example@gmail.com',
              controller: email,
            ),
            SizedBox(height: AppSizes.spaceBtwSections),
            MainButton(
              text: AppTexts.submit,
              onTap: () {
                context.read<AuthBloc>().add(ForgotPassword(email: email.text));
              },
            )
          ],
        );
      },
    );
  }
}