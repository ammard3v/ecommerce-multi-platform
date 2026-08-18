import 'package:carousel_slider/carousel_slider.dart';
import '../../../order/presentation/pages/barel.dart';
import '../../../../utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/snackbar/toast.dart';
import 'package:toastification/toastification.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/texts/section_headings.dart';
class SpecialOffersSection extends StatelessWidget {
  final List<String> imgs;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;
  const SpecialOffersSection({
    super.key,
    required this.imgs,
    required this.currentIndex,
    required this.onPageChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppSectionHeadings(
          title: 'Special Offers',
          onPressed: () => ToastHelper.show(context, message: "Coming Soon"),
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        SizedBox(
          width: DeviceUtility.screenWidth(context),
          height: DeviceUtility.screenWidth(context) / 2,
          child: CarouselSlider(
            items: imgs
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(e),
                        fit: BoxFit
                            .cover, 
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 607, 
              viewportFraction: 1, 
              disableCenter: true,
              padEnds: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) => onPageChanged(index),
            ),
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(imgs.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: RoundedContainer(
                height: 10,
                width: 10,
                radius: 100,
                backgroundColor: currentIndex == index
                    ? AppColors.primary
                    : AppColors.buttonDisabled,
              ),
            );
          }),
        ),
      ],
    );
  }
}