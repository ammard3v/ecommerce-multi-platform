import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../data/model/add_address_req.dart';
import '../../data/model/update_address_req.dart';
import '../../domain/entity/address_entity.dart';
import '../../domain/usecase/fetch_address_usecase.dart';
import '../../domain/usecase/fetch_single_address_usecase.dart';
import '../../domain/usecase/add_address_usecase.dart';
import '../../domain/usecase/update_address_usecase.dart';
import '../../domain/usecase/set_default_address_usecase.dart';
import '../../domain/usecase/delete_address_usecase.dart';
part 'address_event.dart';
part 'address_state.dart';
class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final FetchAddressUsecase _fetchAddressUsecase;
  final FetchSingleAddressUsecase _fetchSingleAddressUsecase;
  final AddAddressUsecase _addAddressUsecase;
  final UpdateAddressUsecase _updateAddressUsecase;
  final SetDefaultAddressUsecase _setDefaultAddressUsecase;
  final DeleteAddressUsecase _deleteAddressUsecase;
  AddressBloc({
    required FetchAddressUsecase fetchAddressUsecase,
    required FetchSingleAddressUsecase fetchSingleAddressUsecase,
    required AddAddressUsecase addAddressUsecase,
    required UpdateAddressUsecase updateAddressUsecase,
    required SetDefaultAddressUsecase setDefaultAddressUsecase,
    required DeleteAddressUsecase deleteAddressUsecase,
  })  : _fetchAddressUsecase = fetchAddressUsecase,
        _fetchSingleAddressUsecase = fetchSingleAddressUsecase,
        _addAddressUsecase = addAddressUsecase,
        _updateAddressUsecase = updateAddressUsecase,
        _setDefaultAddressUsecase = setDefaultAddressUsecase,
        _deleteAddressUsecase = deleteAddressUsecase,
        super(AddressInitialState()) {
    on<FetchAddressEvent>(_onFetchAllAddresses);
    on<FetchSingleAddressEvent>(_onFetchSingleAddress);
    on<AddAddressEvent>(_onAddAddress);
    on<UpdateAddressEvent>(_onUpdateAddress);
    on<SetDefaultAddressEvent>(_onSetDefaultAddress);
    on<DeleteAddressEvent>(_onDeleteAddress);
    on<AddressResetEvent>((event, emit) {
      emit(AddressInitialState());
    });
  }
  Future<void> _onFetchAllAddresses(
      FetchAddressEvent event, Emitter<AddressState> emit) async {
    emit(AddressLoadingState());
    final result = await _fetchAddressUsecase();
    result.fold(
      (failure) => emit(AddressFailureState(failure.message)),
      (response) => emit(AllAddressLoadedState(addressesDataEntity: response)),
    );
  }
  Future<void> _onFetchSingleAddress(
      FetchSingleAddressEvent event, Emitter<AddressState> emit) async {
    emit(AddressLoadingState());
    final result = await _fetchSingleAddressUsecase(event.id);
    result.fold((failure) => emit(AddressFailureState(failure.message)),
        (response) => emit(AddressLoadedState(response)));
  }
  Future<void> _onAddAddress(
      AddAddressEvent event, Emitter<AddressState> emit) async {
    final result = await _addAddressUsecase(event.addAddressReq);
    result.fold(
      (failure) => emit(AddressFailureState(failure.message)),
      (response) {
        List<AddressEntity> updatedList;
        if (state is AllAddressLoadedState) {
          final currentState = state as AllAddressLoadedState;
          updatedList = currentState.addressesDataEntity.map((address) {
            if (response.isDefault) {
              return address.copyWith(isDefault: false);
            }
            return address;
          }).toList();
          updatedList.add(response);
        } else {
          updatedList = [response];
        }
        emit(AllAddressLoadedState(addressesDataEntity: updatedList));
      },
    );
  }
  Future<void> _onUpdateAddress(
      UpdateAddressEvent event, Emitter<AddressState> emit) async {
    final result = await _updateAddressUsecase(event.updateAddressReq);
    result.fold(
      (failure) => emit(AddressFailureState(failure.message)),
      (response) => emit(AddressLoadedState(response)),
    );
  }
  Future<void> _onSetDefaultAddress(
      SetDefaultAddressEvent event, Emitter<AddressState> emit) async {
    final result = await _setDefaultAddressUsecase(event.id);
    result.fold(
      (failure) => emit(AddressFailureState(failure.message)),
      (updatedAddress) {
        if (state is AllAddressLoadedState) {
          final currentState = state as AllAddressLoadedState;
          final updatedList = currentState.addressesDataEntity.map((address) {
            if (address.id == updatedAddress.id) {
              return updatedAddress.copyWith(isDefault: true);
            }
            return address.copyWith(isDefault: false);
          }).toList();
          emit(AllAddressLoadedState(addressesDataEntity: updatedList));
        }
      },
    );
  }
  Future<void> _onDeleteAddress(
      DeleteAddressEvent event, Emitter<AddressState> emit) async {
    final result = await _deleteAddressUsecase(event.id);
    result.fold(
      (failure) => emit(AddressFailureState(failure.message)),
      (_) {
        if (state is AllAddressLoadedState) {
          final loadedState = state as AllAddressLoadedState;
          final updatedAddresses = List.of(loadedState.addressesDataEntity)
            ..removeWhere((e) => e.id == event.id);
          emit(AllAddressLoadedState(
              addressesDataEntity: updatedAddresses,
              message: "Deleted Successfully"));
        }
      },
    );
  }
}