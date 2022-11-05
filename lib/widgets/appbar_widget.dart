import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/utils/configuration.dart';

class AppBarApp extends StatelessWidget implements PreferredSizeWidget {
  final String header;
  final String? color;
  final List<String> tabs;
  final dynamic handleTabChange;
  final TabController? tabController;
  final List<Widget>? actions;

  Widget backButton() {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios, color: grey),
        onPressed: () {
          if (header == "Select") {
          } else {
            Get.back();
          }
        });
  }

  Widget appBarHeader(String? header) {
    return GestureDetector(
        onTap: () => Get.offNamed(AppRoutes.home),
        child: AutoSizeText(header == null ? "" : header.tr,
            maxLines: 1, style: Get.textTheme.headline1));
  }

  const AppBarApp(
      {required this.header,
      this.color,
      required this.tabs,
      this.handleTabChange,
      this.tabController,
      this.actions,
      Key? key})
      : super(key: key);

  @override
  Size get preferredSize => tabController == null
      ? const Size.fromHeight(60)
      : const Size.fromHeight(90);

  List<Widget> createTabs() {
    List<Widget> list = [];
    for (var i = 0; i < tabs.length; i++) {
      list.add(Tab(
        child: Text(
          tabs[i].tr,
          style: subtitle2,
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        //elevation: 1,
        leading: backButton(),
        title: appBarHeader(header),
        actions: actions, //chatActions(),
        bottom: tabs.isNotEmpty
            ? TabBar(
                onTap: handleTabChange,
                indicatorColor: appColors[color]?.withOpacity((6 + 2) / 10),
                indicatorWeight: 4.0,
                isScrollable: true,
                controller: tabController,
                tabs: createTabs())
            : null);
  }
}

// class AppBarTransparent extends StatelessWidget implements PreferredSizeWidget {
//   final String? header;

//   const AppBarTransparent(this.header, {Key? key}) : super(key: key);

//   @override
//   Size get preferredSize => const Size.fromHeight(60);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(leading: backButton(), title: appBarHeader(header));
//   }
// }
