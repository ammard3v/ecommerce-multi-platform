import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import '../../products/data/model/fetch_products_req.dart';
import '../../products/domain/entity/product_entity.dart';
import '../../products/domain/usecase/fetch_top_budget_products_usecase.dart';
abstract class BudgetProductState {}
class BudgetProductInitial extends BudgetProductState {}
class BudgetProductLoading extends BudgetProductState {}
class BudgetProductLoaded extends BudgetProductState {
  final ProductEntity productEntity;
  BudgetProductLoaded({required this.productEntity});
}
class BudgetProductFailure extends BudgetProductState {
  final String message;
  BudgetProductFailure(this.message);
}
class BudgetProductCubit extends Cubit<BudgetProductState> {
  final FetchTopBudgetProductsUsecase fetchTopBudgetProductsUsecase;
  BudgetProductCubit({
    required this.fetchTopBudgetProductsUsecase,
  }) : super(BudgetProductInitial());
  Future<void> fetchBudgetProducts(FetchProductsReq req) async {
    emit(BudgetProductLoading());
    final result = await fetchTopBudgetProductsUsecase.call(req);
    result.fold(
      (failure) {
        debugPrint('BUDGET FAILURE: ${failure.message}');
        emit(BudgetProductFailure(failure.message));
      },
      (entity) => emit(BudgetProductLoaded(productEntity: entity)),
    );
  }
}