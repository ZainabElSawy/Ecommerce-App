part of 'update_rating_cubit.dart';

@immutable
sealed class UpdateRatingState {}

final class UpdateRatingInitial extends UpdateRatingState {}
class UpdateRatingLoading extends UpdateRatingState {}

class UpdateRatingSuccess extends UpdateRatingState {
  final String statusUpdateRating;
  UpdateRatingSuccess(this.statusUpdateRating);
}

class UpdateRatingServerFailure extends UpdateRatingState {
  final String errMessage;
  UpdateRatingServerFailure(this.errMessage);
}

class UpdateRatingNetworkFailure extends UpdateRatingState {
  final String errMessage;
  UpdateRatingNetworkFailure(this.errMessage);
}