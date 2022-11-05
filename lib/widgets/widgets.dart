import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:get/get.dart';

Widget customListTile() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 70,
        color: Colors.grey[200],
        child: Row(
          children: <Widget>[
            Container(
              color: Colors.red,
              width: 70,
              height: 70,
              child: const Icon(Icons.cake, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text('Test Title'),
                  Text('Test Video', style: TextStyle(color: Colors.grey))
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.blue),
          ],
        ),
      ),
    ),
  );
}

ListTile simpleListTile(
    String title, String subtitle, IconData icon, Color color) {
  return ListTile(
    onTap: () {},
    //contentPadding: EdgeInsets.symmetric(vertical: 4),
    leading: Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white),
    ),
    title: Text(title.tr),
    //subtitle: Text(subtitle.tr),
    trailing: IconButton(
      icon: const Icon(Icons.chevron_right),
      onPressed: () {},
    ),
  );
}

Widget smallColoredButton(IconData icon, {Color? color}) {
  return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: color ?? kPrimaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 24,
      ));
}

Widget noData() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Lottie.asset('assets/lottie/noData.json', height: 250),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: Text("No data".tr, style: subtitle1),
        )
      ]);
}

Widget greyline() {
  return Divider(
    color: Colors.grey[500],
  );
}

Widget pageHeader(String title) {
  return AutoSizeText(title.tr,
      maxLines: 1,
      style: const TextStyle(
          fontSize: 24, color: Colors.black54, fontWeight: FontWeight.w300));
}

Widget textLabel(String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(title.tr, style: subtitle1),
  );
}

Widget text(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(text.tr, style: subtitle2),
  );
}

Widget historyCircleButton(String image) {
  return Container(
    padding: const EdgeInsets.all(2.3),
    decoration:
        const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
    child: CircleAvatar(
      maxRadius: 35.0,
      backgroundImage: NetworkImage(
        image,
      ),
    ),
  );
}

//uslu ıcon
Widget notificatonIcon() {
  return Stack(children: <Widget>[
    Icon(
      Icons.notifications_none,
      color: Colors.grey[400],
    ),
    const Positioned(
      top: 0.0,
      right: 0.0,
      child: Icon(
        Icons.brightness_1,
        size: 8.0,
        color: Color(0xFFFF5A5F),
      ),
    ),
  ]);
}
