import 'package:eshop/common/widgets/button/main_button.dart';
import 'package:eshop/common/widgets/modalbottomsheet/custom_bottom_sheet.dart';
import 'package:eshop/core/routes/route_barel.dart';
import 'package:eshop/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:eshop/utils/helpers/global_user.dart';
class AdminLogout extends StatelessWidget {
  const AdminLogout({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainButton(
            text: 'lOGOUT',
            onTap: () => showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (context) => SafeArea(
                child: CustomBottomSheet(
                  title: "Are you sure you want to log out?",
                  confirmText: "Yes, log out",
                  onConfirm: () {
                    if (GlobalUser.isAuthenticated(context)) {
                      context.read<AuthBloc>().add(Logout());
                    }
                  },
                  cancelText: "Cancel",
                  onCancel: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}