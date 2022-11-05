import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/widgets/appbar_widget.dart';
import 'package:opexq/widgets/button_widgets.dart';

class ListSimpleMasterScreen extends StatelessWidget {
  final Widget child;
  final ListController controller;
  // final ListPage page;
  // final TextEditingController searchTextController;
  // final Function handleSearch;
  // final Function handleClearSearch;
  // final ScrollController scrollController;
  // final String header;

  const ListSimpleMasterScreen(
      {Key? key, required this.controller, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarApp(
          header: controller.header.value,
          tabs: const [],
        ),
        body: Column(
            children: <Widget>[searchBox(controller), Expanded(child: child)]),
        floatingActionButton: circleButton(
            icon: FontAwesomeIcons.plus,
            onTap: () => Get.toNamed(controller.page.editRoute),
            color: appColors[controller.page.name]?.withOpacity((6 + 2) / 10)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
