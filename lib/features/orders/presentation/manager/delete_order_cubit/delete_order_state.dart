part of 'delete_order_cubit.dart';

@immutable
sealed class DeleteOrderState {}

final class DeleteOrderInitial extends DeleteOrderState {}
class DeleteOrderLoading extends DeleteOrderState {}

class DeleteOrderSuccess extends DeleteOrderState {
  final String statusDeleteOrder;
  DeleteOrderSuccess(this.statusDeleteOrder);
}

class DeleteOrderServerFailure extends DeleteOrderState {
  final String errMessage;
  DeleteOrderServerFailure(this.errMessage);
}

class DeleteOrderNetworkFailure extends DeleteOrderState {
  final String errMessage;
  DeleteOrderNetworkFailure(this.errMessage);
}