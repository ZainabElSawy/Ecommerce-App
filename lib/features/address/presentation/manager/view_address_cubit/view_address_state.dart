part of 'view_address_cubit.dart';

@immutable
sealed class ViewAddressState {}

final class ViewAddressInitial extends ViewAddressState {}
class ViewAddressLoading extends ViewAddressState {}

class ViewAddressSuccess extends ViewAddressState {
  final List<AddressModel> addresses;
  ViewAddressSuccess(this.addresses);
}

class ViewAddressServerFailure extends ViewAddressState {
  final String errMessage;
  ViewAddressServerFailure(this.errMessage);
}

class ViewAddressNetworkFailure extends ViewAddressState {
  final String errMessage;
  ViewAddressNetworkFailure(this.errMessage);
}

class ViewAddressFailure extends ViewAddressState {
  final String errMessage;
  ViewAddressFailure(this.errMessage);
}
