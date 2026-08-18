import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/device_helpers.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../utils/constants/sizes.dart';
class InputFields extends StatefulWidget {
  const InputFields({
    super.key,
    this.controller,
    required this.hintText,
    this.validator,
    this.readOnly = false,
    this.showBackButon = false,
    this.obscureText = false,
    this.maxLength = 100,
    this.keyboardType = TextInputType.text,
  });
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool showBackButon;
  final bool obscureText;
  final int? maxLength;
  final TextInputType? keyboardType;
  @override
  State<InputFields> createState() => _InputFieldsState();
}
class _InputFieldsState extends State<InputFields> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            keyboardType: widget.keyboardType,
            maxLength: widget.maxLength,
            scrollPadding: EdgeInsets.zero,
            controller: widget.controller,
            validator: widget.validator,
            readOnly: widget.readOnly,
            obscureText: widget.obscureText ? hide : false,
            obscuringCharacter: '*',
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
                counterText: '',
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