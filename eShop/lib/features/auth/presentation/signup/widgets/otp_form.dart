import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
class OtpInput extends StatelessWidget {
  const OtpInput({
    super.key,
    required this.otpPIN,
  });
  final TextEditingController otpPIN;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      errorBuilder: (errorText, pin) => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: SizedBox(
          height: 20,
          child: Center(
            child: Text(errorText ?? "Sth wnt wrng"),
          ),
        ),
      ),
      defaultPinTheme: PinTheme(
        height: 50,
        width: 50,
        margin: EdgeInsets.zero,
        textStyle: TextStyle(
            fontSize: AppSizes.md,
            fontWeight: FontWeight.bold,
            color: AppColors.lightGrey),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        ),
      ),
      controller: otpPIN,
      length: 6,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'OTP cannot be empty';
        } else if (value.length != 6) {
          return 'Enter a 6-digit OTP';
        }
        return null;
      },
    );
  }
}