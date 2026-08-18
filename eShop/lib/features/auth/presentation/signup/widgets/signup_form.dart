import 'package:eshop/common/widgets/snackbar/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/widgets/button/main_button.dart';
import '../../../../admin/admin_product/widgets/input_fields.dart';
import '../../../data/source/source.dart';
import '../../bloc/auth_bloc.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import 'package:email_validator/email_validator.dart';
class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });
  @override
  State<SignupForm> createState() => _SignupFormState();
}
class _SignupFormState extends State<SignupForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    passwordConfirm.dispose();
    super.dispose();
  }
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid email";
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your name";
    }
    return null;
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
    if (value != password.text) {
      return "Password dnt match";
    }
    if (value.length < 5) {
      return "Password should be 5 word long.";
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SignUpFormTextLabel(text: AppTexts.fullName),
          SizedBox(height: AppSizes.spaceBtwInputFields / 3),
          InputFields(
            hintText: 'Full Name',
            controller: name,
            validator: validateName,
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields / 2),
          SignUpFormTextLabel(text: AppTexts.email),
          SizedBox(height: AppSizes.spaceBtwInputFields / 3),
          InputFields(
            hintText: 'example@gmail.com',
            controller: email,
            validator: validateEmail,
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields / 2),
          SignUpFormTextLabel(text: AppTexts.password),
          SizedBox(height: AppSizes.spaceBtwInputFields / 3),
          InputFields(
              hintText: '******',
              controller: password,
              showBackButon: true,
              obscureText: true,
              validator: validatePassword),
          SizedBox(height: AppSizes.spaceBtwInputFields / 2),
          SignUpFormTextLabel(text: AppTexts.conformpassword),
          SizedBox(height: AppSizes.spaceBtwInputFields / 3),
          InputFields(
            hintText: '******',
            controller: passwordConfirm,
            showBackButon: true,
            obscureText: true,
            validator: validateConformPassword,
          ),
          SizedBox(height: AppSizes.spaceBtwSections),
          MainButton(
              text: AppTexts.signUp,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                        SignUp(
                          userSignupReq: UserSignupReq(
                            email: email.text,
                            password: password.text,
                            passwordConfirm: passwordConfirm.text,
                            name: name.text,
                          ),
                        ),
                      );
                }
              }),
        ],
      ),
    );
  }
}
class SignUpFormTextLabel extends StatelessWidget {
  const SignUpFormTextLabel({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsGeometry.only(left: AppSizes.xs),
        child: Text(text, style: Theme.of(context).textTheme.bodyLarge));
  }
}