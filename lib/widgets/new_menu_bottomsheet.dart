import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/guest_model.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';

Widget iconCreation(IconData icons, Color color, String text, String pageName) {
  return Column(
    children: [
      ElevatedButton(
        onPressed: () {
          goToForm(pageName);
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(75.00, 75.00),
            primary: lightgrey,
            onPrimary: lightgrey, //Colors.white,
            shape: const CircleBorder()
            //RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
        child: Icon(
          icons,
          // semanticLabel: "Help",
          size: 36,
          color: color,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          // fontWeight: FontWeight.w100,
        ),
      )
    ],
  );
}

Widget newMenubottomSheet() {
  listItem(IconData? icon, String title, String route, int i) {
    return InkWell(
        hoverColor: Colors.red,
        child: Container(
          padding: const EdgeInsets.all(8),
          //Center(child: ),
          color: kPrimaryColor.withOpacity((i + 2) / 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon ?? FontAwesomeIcons.plus,
                size: 40.0,
              ),
              const SizedBox(height: 8),
              Text(title.tr, style: subtitle1)
            ],
          ),
        ), //i == 0 ? [50] : color[i * 100]),
        onTap: () => goToForm(route));
  }

  return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(12),
      crossAxisCount: 3,
      children: <Widget>[
        listItem(appIcons["task"], "Task", "task", 0),
        listItem(appIcons["comment"], "Comment", "comment", 1),
        listItem(appIcons["survey"], "Survey", "survey", 2),
        listItem(appIcons["lost"], "Lost&Found", "lost", 3),
        listItem(appIcons["checklist"], "Checklist", "checklist", 4),
        listItem(appIcons["reminder"], "Reminder", "reminder", 5),
      ]);
}

Widget guestNewMenubottomSheet(Guest item) {
  listItem(IconData? icon, String title, String route, int i) {
    return InkWell(
        hoverColor: Colors.red,
        child: Container(
          padding: const EdgeInsets.all(8),
          //Center(child: ),
          color: kPrimaryColor.withOpacity((i + 2) / 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon ?? FontAwesomeIcons.plus,
                size: 40.0,
              ),
              const SizedBox(height: 8),
              Text(title.tr, style: subtitle1)
            ],
          ),
        ), //i == 0 ? [50] : color[i * 100]),
        onTap: () {
          Get.back();
          var clientParameters = {
            "CLIENTID": item.id,
            "ROOM": item.roomnumber,
            "ADDRESS": item.address,
            "COUNTRY": item.country,
            "NATION": item.nation,
            "ZIPCODE": item.zipcode,
            "CITY": item.city,
            "BDATE": item.bdate,
            "PENSION": item.pension,
            "RESERVATIONID": item.reservationid,
            "CHECKIN": item.checkin,
            "CHECKOUT": item.checkout,
            "VIPCODE": item.vipcode,
            "AGENCY": item.agency,
            "TITLE": item.title,
            "GENDER": item.gender,
            "REPEATCOUNT": item.repeatcount,
            "AGE": item.age,
            "FIRSTNAME": item.firstname,
            "LASTNAME": item.lastname,
            "CLIENTNAME": item.clientname,
            "PHONE": item.phone,
            "CELL": item.cell,
            "EMAIL": item.email
          };
          goToForm(route, parameters: clientParameters);
        });
  }

  return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(12),
      crossAxisCount: 3,
      children: <Widget>[
        listItem(appIcons["task"], "Task", "task", 0),
        listItem(appIcons["comment"], "Comment", "comment", 1),
        listItem(appIcons["lost"], "Lost&Found", "lost", 3)
      ]);
}


  // return Container(
  //     height: 300,
  //     decoration: const BoxDecoration(
  //         color: lightgrey, //Colors.white,
  //         borderRadius: BorderRadius.only(
  //             topRight: Radius.circular(20), topLeft: Radius.circular(20))),
  //     child: SizedBox(
  //       //padding: const EdgeInsets.symmetric(horizontal: 12),
  //       width: Get.size.width,

  //       child: Column(
  //         children: [
  //           const SizedBox(height: 16),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               iconCreation(
  //                   FontAwesomeIcons.list,
  //                   appColors["task"] ?? kPrimaryColor,
  //                   "Task",
  //                   AppRoutes.taskEdit),
  //               const SizedBox(
  //                 width: 40,
  //               ),
  //               iconCreation(
  //                   FontAwesomeIcons.comment,
  //                   appColors["comment"] ?? kPrimaryColor,
  //                   "Comment",
  //                   AppRoutes.commentEdit),
  //               const SizedBox(
  //                 width: 40,
  //               ),
  //               iconCreation(
  //                   FontAwesomeIcons.star,
  //                   appColors["comment"] ?? kPrimaryColor,
  //                   "Survey",
  //                   AppRoutes.surveyEdit),
  //             ],
  //           ),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               iconCreation(
  //                   FontAwesomeIcons.eye,
  //                   appColors["lost"] ?? kPrimaryColor,
  //                   "Lost Found",
  //                   AppRoutes.lostEdit),
  //               const SizedBox(
  //                 width: 40,
  //               ),
  //               iconCreation(
  //                   FontAwesomeIcons.checkCircle,
  //                   appColors["checklist"] ?? kPrimaryColor,
  //                   "Check List",
  //                   AppRoutes.checkListEdit),
  //               const SizedBox(
  //                 width: 40,
  //               ),
  //               iconCreation(
  //                   FontAwesomeIcons.bell,
  //                   appColors["reminder"] ?? kPrimaryColor,
  //                   "Reminder",
  //                   AppRoutes.home),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ));

