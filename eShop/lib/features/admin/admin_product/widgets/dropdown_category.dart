import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../category/data/repository/repository.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/device_helpers.dart';
import '../../../../utils/constants/sizes.dart';
class DropDownCategory extends StatelessWidget {
  final String? selectedCategory;
  final List<CategoryEntity> categories;
  final ValueChanged<String?> onChanged;
  const DropDownCategory({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.xs,
      ),
      child: DropdownButtonFormField<String>(
        dropdownColor: dark ? AppColors.darkerGrey : AppColors.lightGrey,
        initialValue: selectedCategory,
        hint: const Text('Select Category'),
        items: categories.map((category) {
          return DropdownMenuItem<String>(
            value: category.id,
            child: Text(category.title),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}