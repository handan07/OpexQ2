import 'package:flutter/material.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:get/get.dart';
import 'package:opexq/widgets/button_widgets.dart';

Widget slideBackground(
    String side, String? caption, IconData icon, Color? color) {
  return Container(
    margin: side == "left"
        ? const EdgeInsets.only(left: 20)
        : const EdgeInsets.only(right: 20),
    width: 200,
    child: Align(
      alignment: side == "left" ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          circleButton(icon: icon, color: color, size: 36),
          const SizedBox(
            height: 8,
          ),
          Text(
            caption == null ? "" : caption.tr,
            style: subtitle2,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ),
  );
}

  // Widget slideRightBackground() {
  //   return Container(
  //     width: 200,
  //     margin: const EdgeInsets.only(right: 20),
  //     child: Align(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           circleButton(Icons.edit, Colors.green),
  //           const SizedBox(
  //             height: 8,
  //           ),
  //           Text(
  //             "Read".tr,
  //             style: subtitle2,
  //             textAlign: TextAlign.left,
  //           ),
  //         ],
  //       ),
  //       alignment: Alignment.centerRight,
  //     ),
  //   );
  // }