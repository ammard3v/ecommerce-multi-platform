import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../address/presentation/bloc/address_bloc.dart';
import '../../../auth/presentation/signin/widgets/signin_form.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/device_helpers.dart';
import '../../../../utils/constants/sizes.dart';
class DHomeAppBar extends StatelessWidget {
  const DHomeAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.xs),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Location",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: dark ? AppColors.white : AppColors.black),
                ),
                SizedBox(height: 3),
                GestureDetector(
                  onTap: () => context.pushNamed(RouteNames.address),
                  child: BlocBuilder<AddressBloc, AddressState>(
                    builder: (context, state) {
                      if (state is AllAddressLoadedState) {
                        final addressEntity = state.addressesDataEntity;
                        if (addressEntity.isNotEmpty) {
                          final selectedAddr = addressEntity.firstWhere(
                              (e) => e.isDefault,
                              orElse: () => addressEntity.first);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Iconsax.location, color: AppColors.primary),
                              SizedBox(width: AppSizes.xs),
                              Text(selectedAddr.addressLine1),
                              SizedBox(width: AppSizes.xs),
                              Icon(Iconsax.arrow_down_1, size: AppSizes.lg)
                            ],
                          );
                        }
                      }
                      return Text(
                        "Select an Address",
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? AppColors.white : AppColors.black),
                      );
                    },
                  ),
                )
              ],
            ),
            Spacer(),
            Stack(
              children: [
                GestureDetector(
                  onTap: () => context.pushNamed(RouteNames.notification),
                  child: RoundedContainer(
                      height: 50,
                      width: 50,
                      backgroundColor: dark
                          ? AppColors.white.withValues(alpha: 0.3)
                          : AppColors.lightBackground,
                      radius: AppSizes.borderRadiusLg,
                      child: Icon(
                        Iconsax.notification5,
                        size: AppSizes.iconLg,
                        color: AppColors.darkGrey,
                      )),
                ),
                Positioned(
                    right: 15,
                    top: 10,
                    child: Badge(
                        backgroundColor: AppColors.primary, smallSize: 10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}