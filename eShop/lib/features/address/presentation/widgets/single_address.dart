import 'package:eshop/utils/device/device_utility.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:eshop/common/widgets/modalbottomsheet/custom_bottom_sheet.dart';
import 'package:eshop/features/address/domain/usecase/usecase.dart';
import 'package:eshop/features/shop/home/home.dart';
class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.isSelected,
    required this.addressesData,
    required this.onSelected,
  });
  final bool isSelected;
  final AddressEntity addressesData;
  final VoidCallback onSelected;
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(AppSizes.buttonRadius),
              topRight: Radius.circular(AppSizes.buttonRadius),
            ),
            onPressed: (_) {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) => SafeArea(
                  child: CustomBottomSheet(
                    title: "Remove Address?",
                    confirmText: "Yes, Remove",
                    onConfirm: () {
                      context.read<AddressBloc>().add(
                            DeleteAddressEvent(id: addressesData.id),
                          );
                      Navigator.pop(context);
                    },
                    cancelText: "Cancel",
                    onCancel: () => Navigator.pop(context),
                  ),
                ),
              );
            },
            backgroundColor: AppColors.error,
            foregroundColor: AppColors.white,
            icon: Iconsax.trash,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onSelected,
        child: RoundedContainer(
          showBoxShadow: true,
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.all(AppSizes.md),
          showBorder: true,
          radius: 20,
          borderColor:
              isSelected ? AppColors.primary : AppColors.buttonDisabled,
          backgroundColor: isSelected
              ? AppColors.primary.withValues(alpha: .5)
              : dark
                  ? AppColors.black
                  : AppColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Iconsax.location, size: AppSizes.iconLg),
              const SizedBox(width: AppSizes.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      addressesData.addressLine1,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        Text(
                          addressesData.state,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: AppSizes.md),
                        Text(
                          addressesData.country ?? "unknown",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: AppSizes.md),
              Radio<bool>(
                value: true,
                groupValue: isSelected,
                onChanged: (_) => onSelected(),
                activeColor: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}