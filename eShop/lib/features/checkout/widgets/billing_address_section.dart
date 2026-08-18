import '../../../utils/constants/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../address/data/repository/repository.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../common/widgets/icons/circular_icon.dart';
import '../../../core/routes/route_names.dart';
import '../../../utils/constants/colors.dart';
import '../../../common/widgets/texts/section_headings.dart';
import '../../address/presentation/bloc/address_bloc.dart';
import '../../../utils/constants/sizes.dart';
class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final isDark = DeviceHelpers.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeadings(
          title: 'Shipping Address',
          buttonTitle: '',
        ),
        SizedBox(height: AppSizes.spaceBtwItems / 2),
        BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            if (state is AllAddressLoadedState) {
              final addresses = state.addressesDataEntity;
              final hasDefault = addresses.any((e) => e.isDefault);
              if (addresses.isEmpty || !hasDefault) {
                return Row(
                  children: [
                    Text("Add Address"),
                    SizedBox(width: AppSizes.md),
                    IconButton(
                      onPressed: () => context.pushNamed(RouteNames.address),
                      icon: Icon(Iconsax.edit),
                    ),
                  ],
                );
              }
              final selectedAddress = addresses.firstWhere((e) => e.isDefault);
              return RoundedContainer(
                height: 80,
                radius: 24,
                backgroundColor:
                    isDark ? AppColors.darkerGrey : AppColors.white,
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
                showBorder: isDark ? false : true,
                borderColor: isDark ? AppColors.darkerGrey : AppColors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularIcon(
                          icon: Iconsax.location,
                          backgroundColor: AppColors.white,
                          color: AppColors.primary,
                          size: AppSizes.iconMd,
                        ),
                        SizedBox(width: AppSizes.spaceBtwItems),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${selectedAddress.addressLine1} ${selectedAddress.city}',
                              softWrap: true,
                            ),
                            Text(
                              '${selectedAddress.addressLine2} ${selectedAddress.city}',
                              softWrap: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => context.pushNamed(RouteNames.address),
                      icon: Icon(Iconsax.edit),
                    ),
                  ],
                ),
              );
            } else {
              return TextButton(
                onPressed: () => context.pushNamed(RouteNames.address),
                child: Text('Please select address'),
              );
            }
          },
        )
      ],
    );
  }
}