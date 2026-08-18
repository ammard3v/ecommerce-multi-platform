import 'package:eshop/features/admin/admin_product/widgets/dropdown_category.dart';
import 'package:eshop/features/shop/home/home.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/snackbar/toast.dart';
import 'package:iconsax/iconsax.dart';
import '../../data/source/source.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});
  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}
class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController addressLine1Controller = TextEditingController();
  final TextEditingController addressLine2Controller = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  bool isDefaultAddress = true;
  String? selectedCity;
  final addressData = [
    {"city": "Butwal", "state": "Lumbini Province", "postalCode": "32900"},
    {"city": "Kathmandu", "state": "Bagmati Province", "postalCode": "44600"},
    {"city": "Pokhara", "state": "Gandaki Province", "postalCode": "33700"},
  ];
  @override
  void dispose() {
    addressLine1Controller.dispose();
    addressLine2Controller.dispose();
    stateController.dispose();
    postalCodeController.dispose();
    remarksController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const DAppBar(title: Text('Add Address'), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: BlocConsumer<AddressBloc, AddressState>(
          listener: (context, state) {
            if (state is AddressLoadedState) {
              Navigator.pop(context);
            }
            if (state is AddressFailureState) {
              ToastHelper.show(context, message: state.message);
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    dropdownColor:
                        dark ? AppColors.darkerGrey : AppColors.white,
                    initialValue: selectedCity,
                    decoration: const InputDecoration(
                      labelText: 'Select Locations',
                    ),
                    items: addressData.map((item) {
                      return DropdownMenuItem<String>(
                        value: item["city"],
                        child: Text(item["city"]!),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                        final selected = addressData.firstWhere(
                          (e) => e["city"] == value,
                        );
                        addressLine1Controller.text = selected["city"]!;
                        stateController.text = selected["state"]!;
                        postalCodeController.text = selected["postalCode"]!;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'City is required' : null,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  TextFormField(
                    readOnly: true,
                    controller: addressLine1Controller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.location),
                      labelText: 'Address Line 1',
                    ),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Address line 1 is required'
                        : null,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  TextFormField(
                    controller: addressLine2Controller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.building),
                      labelText: 'Address Line 2',
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  TextFormField(
                    controller: postalCodeController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.code),
                      labelText: 'Postal Code',
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  TextFormField(
                    controller: stateController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.map),
                      labelText: 'State / Province',
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Checkbox(
                        value: isDefaultAddress,
                        onChanged: (value) {
                          setState(() {
                            isDefaultAddress = value ?? false;
                          });
                        },
                      ),
                      const Text('Set as default address'),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  TextFormField(
                    controller: remarksController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.note),
                      labelText: 'Optional Remarks',
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  MainButton(
                    onTap: () {
                      if (!_formKey.currentState!.validate()) return;
                      context.read<AddressBloc>().add(
                            AddAddressEvent(
                              AddAddressReq(
                                addressLine1:
                                    addressLine1Controller.text.trim(),
                                addressLine2:
                                    addressLine2Controller.text.trim(),
                                city: selectedCity ?? "",
                                state: stateController.text.trim(),
                                postalCode: postalCodeController.text.trim(),
                                country: "Nepal",
                                isDefault: isDefaultAddress,
                                optionalRemarks: remarksController.text.trim(),
                              ),
                            ),
                          );
                      context.pop(context);
                    },
                    text: AppTexts.save,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}