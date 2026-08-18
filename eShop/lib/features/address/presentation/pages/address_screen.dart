import 'package:eshop/common/widgets/snackbar/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eshop/utils/constants/colors.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/floating_action/custom_float.dart';
import '../../../../common/widgets/spinner/spinner.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../utils/constants/sizes.dart';
import '../bloc/address_bloc.dart';
import '../widgets/single_address.dart';
class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}
class _AddressScreenState extends State<AddressScreen> {
  late final AddressBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = context.read<AddressBloc>();
    if (bloc.state is! AllAddressLoadedState) {
      bloc.add(FetchAddressEvent());
    }
  }
  Future<void> _refresh() async {
    bloc.add(FetchAddressEvent());
  }
  Widget _emptyView() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: const [
        SizedBox(height: 300),
        Center(child: Text('No address available')),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        leadingOnPressed: () => Navigator.pop(context),
        title: const Text('Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            if (state is AddressLoadingState) {
              return const Center(child: Spinner());
            }
            if (state is AllAddressLoadedState) {
              final addresses = state.addressesDataEntity;
              return RefreshIndicator(
                color: AppColors.primary,
                backgroundColor: AppColors.white,
                onRefresh: _refresh,
                child: addresses.isEmpty
                    ? _emptyView()
                    : ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: addresses.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: AppSizes.spaceBtwItems),
                        itemBuilder: (context, index) {
                          final address = addresses[index];
                          return SingleAddress(
                            isSelected: address.isDefault,
                            addressesData: address,
                            onSelected: () {
                              if (!address.isDefault) {
                                bloc.add(
                                  SetDefaultAddressEvent(id: address.id),
                                );
                              }
                            },
                          );
                        },
                      ),
              );
            }
            return RefreshIndicator(
              color: AppColors.primary,
              backgroundColor: AppColors.white,
              onRefresh: _refresh,
              child: _emptyView(),
            );
          },
        ),
      ),
      floatingActionButton: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state is AllAddressLoadedState &&
              state.addressesDataEntity.length < 5) {
            return CustomFloatAction(
              onPressed: () => context.pushNamed(RouteNames.addNewAddress),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}