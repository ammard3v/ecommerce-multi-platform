import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/device_helpers.dart';
import '../../../../../utils/constants/sizes.dart';
class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.validator,
    this.readOnly = false,
    this.showBackButon = false,
    this.obscureText = false,
    this.icon,
  });
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool showBackButon;
  final bool obscureText;
  final IconData? icon;
  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}
class _AuthTextFieldState extends State<AuthTextField> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Positioned(left: 12, child: Icon(widget.icon)),
          TextFormField(
            scrollPadding: EdgeInsets.zero,
            controller: widget.controller,
            validator: widget.validator,
            readOnly: widget.readOnly,
            obscureText: widget.obscureText ? hide : false,
            obscuringCharacter: '*',
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 40),
                errorStyle: TextStyle(color: AppColors.warning),
                hintText: widget.hintText),
          ),
          if (widget.obscureText)
            Positioned(
              right: 0,
              top: 4,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    setState(() => hide = !hide);
                  },
                  icon: Icon(
                    hide ? Iconsax.eye : Iconsax.eye_slash,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}