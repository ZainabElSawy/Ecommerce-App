part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}

class OrderDetailsLoading extends OrderDetailsState {}

class OrderDetailsSuccess extends OrderDetailsState {
  final List<OrderDetailsModel> orderDetails;
  OrderDetailsSuccess(this.orderDetails);
}

class OrderDetailsServerFailure extends OrderDetailsState {
  final String errMessage;
  OrderDetailsServerFailure(this.errMessage);
}

class OrderDetailsNetworkFailure extends OrderDetailsState {
  final String errMessage;
  OrderDetailsNetworkFailure(this.errMessage);
}
