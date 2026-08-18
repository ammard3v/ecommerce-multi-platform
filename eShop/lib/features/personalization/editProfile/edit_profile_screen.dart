import '../../../common/cubits/app_user/app_user_cubit.dart';
import '../../shop/home/home.dart';
import '../../user/data/model/user_detail_update_req.dart';
import '../../../utils/helpers/global_user.dart';
import '../../../common/widgets/button/elevated_button.dart';
import '../../admin/admin_product/widgets/input_fields.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import 'widgets/user_profile_with_edit_icon.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}
class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phoneNumber.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final userData = GlobalUser.userData(context);
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        leadingOnPressed: () => Navigator.pop(context),
        title: Text(
          'Your Profile',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                RoundedContainer(
                  height: 80,
                  width: 80,
                  radius: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(100),
                    child: CacheImage(
                        height: double.infinity,
                        width: double.infinity,
                        userData?.photo ?? ""),
                  ),
                ),
                SizedBox(height: AppSizes.spaceBtwSections),
                BlocBuilder<AppUserCubit, AppUserState>(
                  builder: (context, state) {
                    if (state is AppUserLoaded) {
                      if (name.text != state.user.name) {
                        name.text = state.user.name;
                      }
                      final phone = state.user.phoneNumber;
                      if (phone == null || phone.isEmpty) {
                        phoneNumber.text = "";
                      } else {
                        phoneNumber.text = phone;
                      }
                      if (state.user.phoneNumber == "null") {
                        phoneNumber.text = "";
                      }
                      phoneNumber.text = (state.user.phoneNumber ?? "");
                      String? email = state.user.email;
                      return Column(children: [
                        InputFields(
                          hintText: 'Name',
                          controller: name,
                          showBackButon: true,
                        ),
                        SizedBox(height: AppSizes.spaceBtwInputFields / 2),
                        InputFields(
                          hintText:
                              email.isNotEmpty ? email : 'example@gmail.com',
                          readOnly: true,
                        ),
                        SizedBox(height: AppSizes.spaceBtwInputFields / 2),
                        InputFields(
                          hintText: 'Phone Number',
                          controller: phoneNumber,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone number is required';
                            }
                            final regex = RegExp(r'^\d{10}$');
                            if (!regex.hasMatch(value)) {
                              return 'Enter a valid 10-digit';
                            }
                            return null;
                          },
                        ),
                      ]);
                    }
                    return SizedBox.shrink();
                  },
                ),
                SizedBox(height: AppSizes.spaceBtwSections),
                MainButton(
                    text: "Update",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        UserDetailUpdateReq user = UserDetailUpdateReq(
                            name: name.text, phoneNumber: phoneNumber.text);
                        context.read<AppUserCubit>().updateUser(user);
                        Navigator.pop(context);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}