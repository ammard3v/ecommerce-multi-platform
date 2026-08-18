import '../../features/payment/cubit/payment_cubit.dart';
import '../../features/payment/data/repository/payment_repository_impl.dart';
import '../../features/payment/data/source/payment_remote_data_source.dart';
import '../../features/payment/domain/repository/payment_repository.dart';
import '../../features/payment/domain/usecase/create_payment_usecase.dart';
import '../network/dio_client.dart';
import 'service_locater.dart';
Future paymentInjection() async {
  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<MakePaymentUseCase>(
    () => MakePaymentUseCase(sl()),
  );
  sl.registerFactory<PaymentCubit>(
    () => PaymentCubit(makePaymentUseCase: sl()),
  );
  sl.registerLazySingleton<PaymentRemoteDataSource>(
    () => PaymentRemoteDataSource(sl<DioClient>().dio),
  );
}