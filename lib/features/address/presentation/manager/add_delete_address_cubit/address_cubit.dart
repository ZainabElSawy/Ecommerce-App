import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repositories/address_repo.dart';

part 'address_state.dart';


class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this.addressRepo) : super(AddressInitial());
  AddressRepo addressRepo;
  addAddress({
    required String name,
    required String city,
    required String street,
    required double lat,
    required double long,
  }) async {
    emit(AddressLoading());
    var result = await addressRepo.addAddress(
      name: name,
      city: city,
      street: street,
      lat: lat,
      long: long,
    );
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(AddressServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(AddressNetworkFailure(failure.errorMessage));
      }
    }, (addressStatus) {
      emit(AddressSuccess(addressStatus));
    });
  }

  deleteAddress({required int addressId}) async {
    emit(AddressLoading());
    var result = await addressRepo.deleteAddress(addressId: addressId);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(AddressServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(AddressNetworkFailure(failure.errorMessage));
      }
    }, (addressStatus) {
      emit(AddressSuccess(addressStatus));
    });
  }
}
