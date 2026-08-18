import '../../../shop/home/home.dart';
import '../../../../common/widgets/images/user_profile_logo.dart';
class ProfilePrimaryHeader extends StatelessWidget {
  const ProfilePrimaryHeader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppSizes.profileHeaderHeight + 20,
        ),
        Container(
          height: AppSizes.profileHeaderHeight,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Center(
            child: RoundedContainer(
              height: 80,
              width: 80,
              radius: 80,
            ),
          ),
        ),
      ],
    );
  }
}