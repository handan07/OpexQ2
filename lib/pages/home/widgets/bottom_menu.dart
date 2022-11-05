import 'package:flutter/material.dart';
import 'package:opexq/models/navigation_model.dart';
import 'package:opexq/utils/configuration.dart';

Widget bottomNavigationBar(
    dynamic menuHandle, List<NavigationItem> navigationItems) {
  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () => menuHandle(item.id),
      child: SizedBox(
        width: 60,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              item.iconData,
              color: grey,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  return Container(
    height: 70,
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: buildNavigationItems()),
  );
}
