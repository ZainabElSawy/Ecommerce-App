import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/home/data/models/notification_model.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repos/home_repo.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.homeRepo) : super(NotificationsInitial());
  HomeRepo homeRepo;

  fetchAllNotifications() async {
    emit(NotificationsLoading());
    var result = await homeRepo.fetchAllNotifications();
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(NotificationsServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(NotificationsNetworkFailure(failure.errorMessage));
      }
    }, (items) {
      emit(NotificationsSuccess(items));
    });
  }
}
