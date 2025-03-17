import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/functions/alert_log_out.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width / 2.85,
              color: AppColor.primarycolor,
            ),
            Positioned(
              top: MediaQuery.of(context).size.width / 4,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColor.backgroundcolor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: const AssetImage(AppImageAsset.avatar),
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 120),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text("Disable Notification"),
                  trailing: Switch(
                    activeColor: Colors.blue,
                    onChanged: (value) {},
                    value: true,
                  ),
                ),
                ListTile(
                  title: const Text("Orders"),
                  trailing: const Icon(Icons.card_travel),
                  onTap: () {
                    context.pushPage(route: AppRouter.pending);
                  },
                ),
                ListTile(
                  title: const Text("Archive"),
                  trailing: const Icon(Icons.archive),
                  onTap: () {
                    context.pushPage(route: AppRouter.archive);
                  },
                ),
                ListTile(
                  title: const Text("Address"),
                  trailing: const Icon(Icons.location_on_outlined),
                  onTap: () {
                    context.pushPage(route: AppRouter.addressesView);
                  },
                ),
                ListTile(
                  title: const Text("About us"),
                  trailing: const Icon(Icons.help_outline_rounded),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Contact us"),
                  trailing: const Icon(Icons.phone_callback_outlined),
                  onTap: () async {
                    await launchUrl(Uri.parse("tel:+201064084149"));
                  },
                ),
                ListTile(
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.exit_to_app),
                  onTap: () {
                    alertLogOut(context);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
