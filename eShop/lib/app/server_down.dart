import 'package:lottie/lottie.dart';
import '../common/cubits/internet_connection/internet_connection_cubit.dart';
import '../features/shop/home/home.dart';
class ServerDown extends StatelessWidget {
  const ServerDown({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? AppColors.black : AppColors.textWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: Lottie.asset(
                repeat: true,
                "assets/lottie/server_down.json",
              ),
            ),
            Center(child: Text(AppTexts.serverOnMaintain)),
            SizedBox(height: AppSizes.appBarHeight / 3),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: MainButton(
                onTap: () =>
                    context.read<InternetConnectionCubit>().checkStatus(),
                text: AppTexts.checkStatus,
              ),
            ),
          ],
        ),
      ),
    );
  }
}