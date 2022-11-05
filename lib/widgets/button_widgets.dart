import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:get/get.dart';

Widget circleButton(
    {IconData? icon,
    dynamic onTap,
    Color? color,
    Color? iconColor,
    double? size}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? kPrimaryColor,
      ),
      child: Icon(
        icon,
        color: iconColor ?? Colors.black87,
        size: size ?? 40,
      ),
    ),
  );
}

Widget circleSaveButton(dynamic onTap, Color? color) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? kPrimaryColor,
      ),
      child: const Icon(
        FontAwesomeIcons.check,
        color: Colors.black87,
        size: 40,
      ),
    ),
  );
}

Widget textButton(String? text, Color? color,
    {dynamic onTap, Color? textColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        width: 70,
        padding: const EdgeInsets.all(8),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Align(
          alignment: Alignment.center,
          child: AutoSizeText(
            text == null ? "" : text.tr,
            maxLines: 1,
            minFontSize: 8,
            style: bodyText2?.copyWith(color: textColor ?? Colors.white),
          ),
        )),
  );
}
