import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/services/storage_service.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/new_menu_bottomsheet.dart';
import 'package:opexq/widgets/widgets.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: lightgrey,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    logoImage,
                    width: 150,
                    height: 90,
                  ),
                  //const SizedBox(height: 5),
                  Text(
                    "Operation Management & CRM".tr,
                    style: subtitle2,
                  ),
                ]),
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 12),
            dense: true,
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            leading: const Icon(Icons.language),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Language".tr, style: subtitle2),
                DropdownButton<String>(
                  value: Get.find<StorageService>().lang.toUpperCase(),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    Get.find<StorageService>()
                        .writeStorage("lang", newValue!.toLowerCase());
                    // AppController controller = Get.find();
                    // controller.updateLocale(newValue ?? "tr");
                  },
                  items: <String>['EN', 'TR']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: subtitle2,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 5)
              ],
            ),
          ),
          greyline(),
          ListTile(
              contentPadding: const EdgeInsets.only(left: 12),
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const Icon(FontAwesomeIcons.floppyDisk),
              title: Text("Quick New".tr, style: subtitle2),
              onTap: () {
                Get.back();
                openBottomSheet(newMenubottomSheet(), "Quick New");
              }),
          greyline(),
          ListTile(
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: Icon(appIcons["reminder"]),
              title: Text("Reminders".tr, style: subtitle2),
              onTap: () {
                Get.back();
                goToList("reminder");
              }),
          greyline(),
          ListTile(
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: Icon(appIcons["message"]),
              title: Text("Messages".tr, style: subtitle2),
              onTap: () {
                Get.back();
                goToList("message");
              }),
          greyline(),
          ListTile(
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: Icon(appIcons["handbook"]),
              title: Text("Handbook".tr, style: subtitle2),
              onTap: () {
                Get.back();
                goToList("handbook");
              }),
          greyline(),
          ListTile(
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: Icon(appIcons["dashboard"]),
              title: Text("Dashboard".tr, style: subtitle2),
              onTap: () => Get.offAndToNamed("dashboard")),
          greyline(),
          ListTile(
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const Icon(FontAwesomeIcons.user),
              title: Text("Profile".tr, style: subtitle2),
              onTap: () => Get.offAndToNamed(AppRoutes.profile)),
          greyline(),
          ListTile(
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const Icon(FontAwesomeIcons.hand),
              title: Text("Sign Out".tr, style: subtitle2),
              onTap: () => Get.offAndToNamed(AppRoutes.logout)),
        ],
      ),
    );
  }
}
