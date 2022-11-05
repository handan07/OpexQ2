import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/appbar_widget.dart';
import 'package:opexq/widgets/button_widgets.dart';
import 'package:opexq/widgets/drawer_widget.dart';

class ListMasterScreen extends StatelessWidget {
  final ListController controller;
  final Widget child;

  const ListMasterScreen(
      {Key? key, required this.controller, required this.child})
      : super(key: key);

  Widget bottomSortWidget() {
    return Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Obx(() => controller.listSort.value == ""
              ? Container()
              : DropdownButton<String>(
                  value: controller.listSort.value,
                  underline: Container(),
                  onChanged: (String? newValue) {
                    controller.handleSort(newValue!);
                  },
                  items: controller.page.sort
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: subtitle2,
                      ),
                    );
                  }).toList(),
                )),
        ));
  }

  Widget twoFabWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          controller.page.homeRoute == ""
              ? circleButton(
                  icon: FontAwesomeIcons.borderAll,
                  iconColor: Colors.transparent,
                  // Get.toNamed(controller.page.editRoute!),
                  color: Colors.transparent)
              : circleButton(
                  icon: FontAwesomeIcons.borderAll,
                  onTap: () => controller.summaryList(),
                  // Get.toNamed(controller.page.editRoute!),
                  color: appColors[controller.page.name]
                      ?.withOpacity((6 + 2) / 10)),
          controller.page.editRoute == ""
              ? circleButton(
                  icon: FontAwesomeIcons.borderAll,
                  iconColor: Colors.transparent,
                  // Get.toNamed(controller.page.editRoute!),
                  color: Colors.transparent)
              : circleButton(
                  icon: FontAwesomeIcons.plus,
                  onTap: () => goToForm(controller
                      .page.name), //Get.toNamed(controller.page.editRoute),
                  color: appColors[controller.page.name]
                      ?.withOpacity((6 + 2) / 10)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return controller.listType.value == "list"
        ? Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBarApp(
                header: controller.header.value,
                color: controller.page.name,
                tabs: controller.page.tabs,
                handleTabChange: controller.handleTabChange,
                tabController: controller.tabController),
            endDrawer: const DrawerWidget(),
            body: Column(children: <Widget>[
              searchBox(controller),
              Expanded(child: child)
            ]),

            // floatingActionButton: controller.page!.editRoute == null
            //     ? null
            //     : circleButton(
            //         icon: FontAwesomeIcons.plus,
            //         onTap: () => Get.toNamed(controller.page!.editRoute!),
            //         color: appColors[controller.page!.name]
            //             ?.withOpacity((6 + 2) / 10)),
            // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            // bottomNavigationBar: controller.page!.homeRoute != null
            //     ? bottomNavigationBar(
            //         controller.handleNavigationItemTap, navigationItems)
            //     : null,

            bottomNavigationBar: bottomSortWidget(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: twoFabWidget())
        : Column(
            children: <Widget>[searchBox(controller), Expanded(child: child)]);
  }
}
