import 'package:ecommerce_app/features/address/data/models/address_model.dart';
import 'package:ecommerce_app/features/address/domain/repositories/address_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';

part 'view_address_state.dart';

class ViewAddressCubit extends Cubit<ViewAddressState> {
  ViewAddressCubit(this.addressRepo) : super(ViewAddressInitial());
  AddressRepo addressRepo;
  fetchAddress() async {
    emit(ViewAddressLoading());
    var result = await addressRepo.fetchAddress();
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(ViewAddressServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(ViewAddressNetworkFailure(failure.errorMessage));
      }
    }, (addresses) {
      emit(ViewAddressSuccess(addresses));
    });
  }
}
