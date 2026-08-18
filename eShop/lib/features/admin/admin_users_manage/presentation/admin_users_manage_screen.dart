import 'package:eshop/common/widgets/button/main_button.dart';
import 'package:eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eshop/features/admin/admin_users_manage/presentation/cubit/admin_user_cubit.dart';
import 'package:eshop/features/admin/admin_users_manage/presentation/cubit/admin_user_state.dart';
import 'package:eshop/features/order/presentation/pages/barel.dart';
import '../../../../core/routes/route_barel.dart';
class AdminUsersManageScreen extends StatefulWidget {
  const AdminUsersManageScreen({super.key});
  @override
  State<AdminUsersManageScreen> createState() => _AdminUsersManageScreenState();
}
class _AdminUsersManageScreenState extends State<AdminUsersManageScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdminUserCubit>().fetchAllUsers();
  }
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return RefreshIndicator(
      onRefresh: () async {
        context.read<AdminUserCubit>().fetchAllUsers();
      },
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<AdminUserCubit, AdminUserCubitState>(
                builder: (context, state) {
              if (state.error != null) {
                return Column(
                  children: [
                    Text(state.error!),
                    Center(
                      child: SizedBox(
                        height: 40,
                        width: 50,
                        child: MainButton(
                            text: "Call",
                            onTap: () {
                              context.read<AdminUserCubit>().fetchAllUsers();
                            }),
                      ),
                    )
                  ],
                );
              }
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final isActive = state.users[index].active;
                    return RoundedContainer(
                        height: 50,
                        backgroundColor:
                            dark ? AppColors.primary : AppColors.softGrey,
                        showBoxShadow: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 2, child: Text(state.users[index].name)),
                            state.users[index].email == "d@d.com"
                                ? Expanded(flex: 1, child: Text("Admin"))
                                : Expanded(
                                    flex: 1,
                                    child: Switch(
                                        activeThumbColor:
                                            AppColors.buttonPrimary,
                                        value: isActive,
                                        onChanged: (value) {
                                          if (value) {
                                            context
                                                .read<AdminUserCubit>()
                                                .fetchSingleUser(
                                                    state.users[index].id);
                                          } else {
                                            context
                                                .read<AdminUserCubit>()
                                                .disableUser(
                                                    (state.users[index].id));
                                          }
                                        }),
                                  )
                          ],
                        ));
                  },
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}