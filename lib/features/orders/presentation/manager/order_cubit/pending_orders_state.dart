part of 'pending_orders_cubit.dart';

@immutable
sealed class PendingOrdersState {}

final class PendingOrdersInitial extends PendingOrdersState {}
class PendingOrdersLoading extends PendingOrdersState {}

class PendingOrdersSuccess extends PendingOrdersState {
  final List<OrderModel>? orders;
  PendingOrdersSuccess(this.orders);
}

class PendingOrdersServerFailure extends PendingOrdersState {
  final String errMessage;
  PendingOrdersServerFailure(this.errMessage);
}

class PendingOrdersNetworkFailure extends PendingOrdersState {
  final String errMessage;
  PendingOrdersNetworkFailure(this.errMessage);
}

// class PendingOrdersFailure extends PendingOrdersState {
//   final String errMessage;
//   PendingOrdersFailure(this.errMessage);
// }