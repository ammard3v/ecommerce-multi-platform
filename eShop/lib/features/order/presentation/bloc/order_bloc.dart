import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../domain/usecase/fetch_paid_order_status_usecase.dart';
import '../../data/model/order_status_req.dart';
import '../../data/repository/repository.dart';
import '../../domain/entity/order_status_entity.dart';
import '../../domain/usecase/create_order_usecase.dart';
import '../../domain/usecase/fetch_order_status_usecase.dart';
import '../../domain/usecase/fetch_order_usecase.dart';
part 'order_event.dart';
part 'order_state.dart';
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final FetchOrderUsecase _fetchOrderUsecase;
  final FetchPaidOrderStatusUsecase _fetchPaidOrderStatusUsecase;
  final FetchOrderStatusUsecase _fetchOrderStatusUsecase;
  final CreateOrderUsecase _createOrderUsecase;
  OrderBloc({
    required FetchOrderUsecase fetchOrderUsecase,
    required FetchPaidOrderStatusUsecase fetchPaidOrderStatusUsecase,
    required FetchOrderStatusUsecase fetchOrderStatusUsecase,
    required CreateOrderUsecase createOrderUsecase,
  })  : _fetchOrderUsecase = fetchOrderUsecase,
        _fetchPaidOrderStatusUsecase = fetchPaidOrderStatusUsecase,
        _fetchOrderStatusUsecase = fetchOrderStatusUsecase,
        _createOrderUsecase = createOrderUsecase,
        super(OrderInitialState()) {
    on<FetchOrderEvent>(_onFetchOrder);
    on<FetchPaidOrderStatusEvent>(_onFetchPaidOrderStatus);
    on<FetchOrderStatusEvent>(_onFetchOrderStatus);
    on<CreateOrderEvent>(_onCreateOrder);
  }
  Future<void> _onFetchOrder(
      FetchOrderEvent event, Emitter<OrderState> emit) async {
    emit(OrderLoadingState());
    final result = await _fetchOrderUsecase.call();
    result.fold(
      (failure) => emit(OrderFailureState(failure.message)),
      (order) => emit(OrderLoadedState(order)),
    );
  }
  Future<void> _onCreateOrder(
      CreateOrderEvent event, Emitter<OrderState> emit) async {
    emit(OrderLoadingState());
    final result = await _createOrderUsecase.call();
    result.fold(
      (failure) => emit(OrderFailureState(failure.message)),
      (order) => emit(SingleOrderLoadedState(order)),
    );
  }
  Future<void> _onFetchOrderStatus(
    FetchOrderStatusEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoadingState());
    final result = await _fetchOrderStatusUsecase.call(event.id);
    result.fold(
      (failure) => emit(OrderStatusFailureState(failure.message)),
      (order) {
        emit(SingleOrderLoadedState(order));
      },
    );
  }
  Future<void> _onFetchPaidOrderStatus(
      FetchPaidOrderStatusEvent event, Emitter<OrderState> emit) async {
    final result = await _fetchPaidOrderStatusUsecase.call(event.id);
    result.fold(
      (failure) => emit(PaymentOrderFailureState(failure.message)),
      (order) => emit(SingleOrderLoadedState(order)),
    );
  }
}