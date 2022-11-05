import 'package:flutter/material.dart';
import 'package:opexq/utils/configuration.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

Widget listTab(tabs, selectedIndex) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) =>
            buildTabs(tabs[index], index, selectedIndex),
      ),
    ),
  );
}

Widget buildTabs(String caption, int index, selectedIndex) {
  return GestureDetector(
    onTap: () {
      selectedIndex.value = index;
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            caption,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color:
                  selectedIndex.value == index ? kTextColor : kTextLightColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20 / 4), //top padding 5
            height: 2,
            width: 30,
            color: selectedIndex.value == index
                ? kPrimaryColor
                : Colors.transparent,
          )
        ],
      ),
    ),
  );
}
