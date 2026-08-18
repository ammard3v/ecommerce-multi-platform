import 'package:eshop/features/products/domain/entity/single_product_entity.dart';
import 'package:eshop/features/shop/home/home.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/snackbar/toast.dart';
import '../bloc/product_bloc.dart';
import '../../../../core/routes/route_names.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import 'product_swiper.dart';
import 'single_product_bottom.dart';
class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({
    super.key,
    this.singleProductEntity,
    this.id,
  });
  final SingleProductEntity? singleProductEntity;
  final String? id;
  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}
class _SingleProductScreenState extends State<SingleProductScreen> {
  SingleProductEntity? product;
  @override
  void initState() {
    super.initState();
    if (widget.singleProductEntity != null) {
      product = widget.singleProductEntity;
    } else if (widget.id != null) {
      context.read<ProductBloc>().add(FetchSingleProductEvent(id: widget.id!));
    }
  }
  @override
  Widget build(BuildContext context) {
    if (product != null) {
      return _buildScaffold(product!);
    }
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Scaffold(
              body: Center(
                  child: CircularProgressIndicator(color: AppColors.primary)));
        }
        if (state is SingleProductLoadedState) {
          return _buildScaffold(state.productEntity);
        }
        if (state is ProductFailureState) {
          return const Scaffold(
            body: Center(child: Text("Product not found")),
          );
        }
        return const Scaffold(
            body: Center(
                child: CircularProgressIndicator(color: AppColors.primary)));
      },
    );
  }
  Widget _buildScaffold(SingleProductEntity product) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Scaffold(
      backgroundColor:
          dark ? AppColors.darkBackground : AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _buildBody(product)),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottom(product),
    );
  }
  Widget _buildBody(SingleProductEntity product) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(product),
          const SizedBox(height: 10),
          _buildInfoCard(product),
        ],
      ),
    );
  }
  Widget _buildImage(SingleProductEntity product) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ProductImageCarousel(
          images: product.images,
          id: product.id,
        ),
      ),
    );
  }
  Widget _buildInfoCard(SingleProductEntity product) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RoundedContainer(
        showBoxShadow: true,
        backgroundColor: dark ? AppColors.darkGrey : AppColors.lightGrey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleRow(product),
              const SizedBox(height: 20),
              _buildDetailsRow(product),
              const SizedBox(height: 10),
              Text(
                product.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildTitleRow(SingleProductEntity product) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            product.title,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        Expanded(
          child: SizedBox(
            height: 40,
            child: MainButton(
              onTap: () => context.pushNamed(RouteNames.productByCategory,
                  queryParameters: {
                    "id": product.category.id,
                    "title": product.category.title
                  }),
              text: product.category.title,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildDetailsRow(SingleProductEntity product) {
    return Row(
      children: [
        Text(
          'Product Details',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => context.pushNamed(
            RouteNames.review,
            extra: product.id,
          ),
          child: Row(
            children: [
              RatingBarIndicator(
                rating: product.ratings.average,
                itemCount: 5,
                itemSize: 18,
                itemBuilder: (context, _) => const Icon(
                  Iconsax.star1,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(width: 6),
              Text(product.ratings.average.toString()),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildBottom(SingleProductEntity product) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartStockFailureState) {
          ToastHelper.show(
            context,
            message: state.message,
            type: ToastType.error,
          );
        }
      },
      child: SingleProductBottom(
        id: product.id,
        price: double.parse(product.price.toString()),
      ),
    );
  }
}