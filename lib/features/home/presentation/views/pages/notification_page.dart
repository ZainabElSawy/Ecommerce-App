import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/imageassets.dart';
import '../../manager/notifications_cubit/notifications_cubit.dart';
import '../widgets/notifications/notifications_listview.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    BlocProvider.of<NotificationsCubit>(context).fetchAllNotifications();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 50),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            if (state is NotificationsLoading) {
              return Center(
                child: Lottie.asset(
                  AppImageAsset.loading,
                  width: 300,
                  height: 300,
                ),
              );
            } else if (state is NotificationsServerFailure) {
              return Center(child: Lottie.asset(AppImageAsset.server));
            } else if (state is NotificationsSuccess) {
              if (state.notifications!.isNotEmpty) {
                return NotificationsListView(
                    notifications: state.notifications!);
              }
              return Center(child: Lottie.asset(AppImageAsset.noData));
            } else if (state is NotificationsNetworkFailure) {
              return Center(child: Lottie.asset(AppImageAsset.internet));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
