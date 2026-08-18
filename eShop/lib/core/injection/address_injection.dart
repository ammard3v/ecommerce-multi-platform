import '../../features/address/data/repository/address_repository_impl.dart';
import '../../features/address/data/source/address_remote_data_source.dart';
import '../../features/address/domain/repository/address_repository.dart';
import '../../features/address/domain/usecase/add_address_usecase.dart';
import '../../features/address/domain/usecase/delete_address_usecase.dart';
import '../../features/address/domain/usecase/fetch_address_usecase.dart';
import '../../features/address/domain/usecase/fetch_single_address_usecase.dart';
import '../../features/address/domain/usecase/set_default_address_usecase.dart';
import '../../features/address/domain/usecase/update_address_usecase.dart';
import '../../features/address/presentation/bloc/address_bloc.dart';
import '../network/dio_client.dart';
import 'service_locater.dart';
Future addressInjection() async {
  sl.registerLazySingleton<AddressRemoteDataSource>(
    () => AddressRemoteDataSource(sl<DioClient>().dio),
  );
  sl.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(
      addressRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<FetchAddressUsecase>(
    () => FetchAddressUsecase(sl()),
  );
  sl.registerLazySingleton<FetchSingleAddressUsecase>(
    () => FetchSingleAddressUsecase(sl()),
  );
  sl.registerLazySingleton<AddAddressUsecase>(
    () => AddAddressUsecase(sl()),
  );
  sl.registerLazySingleton<UpdateAddressUsecase>(
    () => UpdateAddressUsecase(sl()),
  );
  sl.registerLazySingleton<SetDefaultAddressUsecase>(
    () => SetDefaultAddressUsecase(sl()),
  );
  sl.registerLazySingleton<DeleteAddressUsecase>(
    () => DeleteAddressUsecase(sl()),
  );
  sl.registerLazySingleton<AddressBloc>(
    () => AddressBloc(
      fetchAddressUsecase: sl(),
      fetchSingleAddressUsecase: sl(),
      addAddressUsecase: sl(),
      updateAddressUsecase: sl(),
      setDefaultAddressUsecase: sl(),
      deleteAddressUsecase: sl(),
    ),
  );
}