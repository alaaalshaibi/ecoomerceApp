import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/setting/setting_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller = Get.put(SettingControllerImp());
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.height / 4,
              decoration: BoxDecoration(color: AppColor.primaryColor),
            ),
            Positioned(
                top: Get.height / 6,
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    backgroundImage: AssetImage(AppImageAssets.avatar),
                  ),
                ))
          ],
        ),
        const SizedBox(height: 50),
        Card(
            child: Column(
          children: [
            ListTile(
              onTap: () {},
              trailing: Switch(
                activeColor: AppColor.primaryColor,
                value: true,
                onChanged: (bool value) {},
              ),
              title: const Text('Notifications '),
            ),
            const Divider(
              height: 0,
              indent: 40,
            ),
            ListTile(
              onTap: () {},
              trailing: const Icon(Icons.location_on_outlined),
              title: const Text('Address'),
            )
          ],
        )),
        const SizedBox(height: 20),
        Card(
            child: Column(
          children: [
            ListTile(
              onTap: () {},
              trailing: const Icon(Icons.info_outline),
              title: const Text('About us'),
            ),
            const Divider(
              height: 0,
              indent: 40,
            ),
            ListTile(
              onTap: () {},
              trailing: const Icon(Icons.contact_phone_outlined),
              title: const Text('contact us'),
            )
          ],
        )),
        const SizedBox(height: 40),
        Card(
            child: ListTile(
          onTap: () {
            controller.logout();
          },
          title: Text('Logout'),
          trailing: const Icon(Icons.logout),
        )),
      ],
    );
  }
}
