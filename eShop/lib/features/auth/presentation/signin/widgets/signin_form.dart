import 'package:eshop/common/widgets/button/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/user_signin_req.dart';
import '../../bloc/auth_bloc.dart';
import 'auth_text_field.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
class SignInForm extends StatefulWidget {
  const SignInForm({super.key});
  @override
  State<SignInForm> createState() => _SignInFormState();
}
class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.email != null && state.email != email.text) {
          email.text = state.email!;
        }
        if (state.password != null && state.password != password.text) {
          password.text = state.password!;
        }
        return Form(
          key: formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SignInFormTextLabel(text: AppTexts.email),
            SizedBox(height: AppSizes.spaceBtwInputFields / 3),
            AuthTextField(
              icon: Icons.email_outlined,
              hintText: 'example@gmail.com',
              controller: email,
              validator: (value) => null,
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields / 3),
            SignInFormTextLabel(text: AppTexts.password),
            SizedBox(height: AppSizes.spaceBtwInputFields / 3),
            AuthTextField(
              icon: Icons.lock_outline,
              hintText: '******',
              controller: password,
              showBackButon: true,
              obscureText: true,
              validator: (value) => null,
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return MainButton(
                    showText: false,
                    onTap: null,
                  );
                }
                return MainButton(
                  showText: state is! AuthLoading &&
                      (email.text.isNotEmpty || password.text.isEmpty),
                  text: AppTexts.signIn,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            SignIn(
                              userSigninReq: UserSigninReq(
                                email: email.text,
                                password: password.text,
                              ),
                            ),
                          );
                    }
                  },
                );
              },
            )
          ]),
        );
      },
    );
  }
}
class SignInFormTextLabel extends StatelessWidget {
  const SignInFormTextLabel({
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