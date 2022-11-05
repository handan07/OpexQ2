import 'package:flutter/material.dart';
import 'package:opexq/utils/configuration.dart';

Widget mainBottomBar() {
  return Container(
    height: 90,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buildNavigationItems(),
    ),
  );
}

List<Widget> buildNavigationItems() {
  List<Widget> list = [];
  for (var navigationItem in getNavigationItemList()) {
    list.add(buildNavigationItem(navigationItem, null));
  }
  return list;
}

Widget buildNavigationItem(NavigationItem item, NavigationItem? selectedItem) {
  return GestureDetector(
    onTap: () {
      selectedItem = item;
    },
    child: SizedBox(
      width: 50,
      child: Stack(
        children: <Widget>[
          selectedItem == item
              ? Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColorShadow,
                    ),
                  ),
                )
              : Container(),
          Center(
            child: Icon(
              item.iconData,
              color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
              size: 24,
            ),
          )
        ],
      ),
    ),
  );
}

class NavigationItem {
  IconData iconData;

  NavigationItem(this.iconData);
}

List<NavigationItem> getNavigationItemList() {
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}
