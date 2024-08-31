part of 'address_cubit.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressSuccess extends AddressState {
  final String addressStatus;
  AddressSuccess(this.addressStatus);
}

class AddressServerFailure extends AddressState {
  final String errMessage;
  AddressServerFailure(this.errMessage);
}

class AddressNetworkFailure extends AddressState {
  final String errMessage;
  AddressNetworkFailure(this.errMessage);
}

class AddressFailure extends AddressState {
  final String errMessage;
  AddressFailure(this.errMessage);
}
