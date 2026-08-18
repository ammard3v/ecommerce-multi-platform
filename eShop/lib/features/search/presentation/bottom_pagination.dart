import 'package:eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eshop/features/search/presentation/cubit/search_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
class BottomPagination extends StatelessWidget {
  const BottomPagination({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductCubit, SearchProductState>(
      builder: (context, state) {
        if (state is SearchProductLoaded) {
          final meta = state.productEntity.meta;
          return RoundedContainer(
            height: 40,
            backgroundColor: Colors.transparent,
            child: Text('Page ${meta.page} of ${meta.totalPages}'),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}