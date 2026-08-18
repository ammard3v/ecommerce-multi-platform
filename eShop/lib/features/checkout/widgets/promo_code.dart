import '../../order/presentation/pages/barel.dart';
import '../../../utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../common/widgets/texts/section_headings.dart';
import '../../admin/admin_product/widgets/input_fields.dart';
class PromoCodeHelper extends StatefulWidget {
  const PromoCodeHelper({super.key});
  @override
  State<PromoCodeHelper> createState() => _PromoCodeHelperState();
}
class _PromoCodeHelperState extends State<PromoCodeHelper> {
  TextEditingController userInput = TextEditingController();
  bool value = false;
  @override
  void dispose() {
    super.dispose();
    userInput.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final isDark = DeviceHelpers.isDarkMode(context);
    return Column(
      children: [
        AppSectionHeadings(title: 'Promo Code', buttonTitle: ''),
        SizedBox(height: AppSizes.spaceBtwInputFields),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (value)
              Expanded(
                  child: InputFields(
                      controller: userInput, hintText: "Enter Promo Code")),
            if (!value)
              RoundedContainer(
                height: 50,
                backgroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
                radius: 30,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discount 30% off",
                        style: TextStyle(
                            color: isDark ? AppColors.black : AppColors.white)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            value = true;
                          });
                        },
                        icon: Text("x"))
                  ],
                ),
              ),
            SizedBox(width: AppSizes.md),
            RoundedContainer(
                radius: 30,
                backgroundColor: AppColors.buttonDisabled,
                child: IconButton(
                    onPressed: () => setState(() {
                          value = false;
                        }),
                    icon: Icon(Icons.add, color: AppColors.darkBackground)))
          ],
        ),
        SizedBox(height: AppSizes.spaceBtwSections),
      ],
    );
  }
}