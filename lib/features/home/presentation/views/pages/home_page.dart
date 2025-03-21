// ignore_for_file: deprecated_member_use

import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/features/home/presentation/views/pages/setting_view.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/home/presentation/views/pages/home_view.dart';

import '../../../../../core/functions/fcmconfig.dart';
import '../../../../../core/functions/request_per_location.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/custom_app_bar_button_model.dart';
import '../widgets/home/custom_button_app_bar.dart';
import 'notification_page.dart';
import 'offers_view.dart';
import '../../../../../core/functions/alertexitapp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    requestPermissionNotification();
    checkNotificationPermission(context);
    fcmConfig(context);
    requestPerLocation(context);
    super.initState();
  }

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List<CustomAppBarButtonModel> buttons = [
      CustomAppBarButtonModel(text: S.of(context).home, icon: Icons.home),
      CustomAppBarButtonModel(
          text: S.of(context).notification,
          icon: Icons.notifications_active_outlined),
      CustomAppBarButtonModel(
          text: S.of(context).profile, icon: Icons.offline_bolt_outlined),
      CustomAppBarButtonModel(
          text: S.of(context).settings, icon: Icons.settings),
    ];
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: WillPopScope(
        onWillPop: () async => alertExitApp(context),
        child: pages[currentPage],
      ),
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          backgroundColor: AppColor.primarycolor,
          foregroundColor: AppColor.white,
          onPressed: () => context.pushPage(route: AppRouter.cart),
          shape: const CircleBorder(),
          elevation: 4.0,
          child: const Icon(Icons.shopping_basket_outlined),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 70,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(pages.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomButtonAppBar(
                      text: buttons[i].text,
                      icon: buttons[i].icon,
                      active: currentPage == (i),
                      onPressed: () => setState(() => currentPage = i),
                    );
            })
          ],
        ),
      ),
    );
  }
}

List<Widget> pages = [
  const Home(),
  const NotificationPage(),
  const OffersView(),
  const Settings(),
];
