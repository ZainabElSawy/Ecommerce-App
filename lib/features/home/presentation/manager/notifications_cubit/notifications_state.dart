part of 'notifications_cubit.dart';

@immutable
sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}
class NotificationsLoading extends NotificationsState {}

class NotificationsSuccess extends NotificationsState {
  final List<NotificationsModel>? notifications;
  NotificationsSuccess(this.notifications);
}

class NotificationsServerFailure extends NotificationsState {
  final String errMessage;
  NotificationsServerFailure(this.errMessage);
}

class NotificationsNetworkFailure extends NotificationsState {
  final String errMessage;
  NotificationsNetworkFailure(this.errMessage);
}
