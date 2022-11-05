import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/guest_info_model.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/pages/list/widgets/slidebackground_widget.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';

Widget guestSelectList(ListController controller) {
  Widget listCard(dynamic item) {
    return listCardContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(item.roomnumber ?? "", style: headline5),
                    item.vipcode != null
                        ? textButton(item.vipcode!, Colors.red)
                        : Container(),
                    const SizedBox(height: 2),
                    item.repeatcount == 0
                        ? Container()
                        : Text("${"Repeat".tr} ${item.repeatcount!}",
                            style: bodyText1),
                    const SizedBox(height: 2),
                    item.hasbirthday == true
                        ? const Icon(FontAwesomeIcons.cakeCandles,
                            color: Colors.red, size: 20)
                        : Container()
                  ])),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              flex: 6,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      "${item.clientname ?? ''}",
                      style: headline5,
                      maxLines: 1,
                      minFontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    Text("${item.agency ?? ''}", style: bodyText1),
                    const SizedBox(height: 8),
                    Text(
                        "${formatDate(item.checkin)} - ${formatDate(item.checkout)}",
                        style: bodyText1),
                    const SizedBox(height: 8),
                    Row(children: <Widget>[
                      const Icon(Icons.supervised_user_circle),
                      const SizedBox(
                        width: 4,
                      ),
                      toInt(item.adult) > 0
                          ? Text(item.adult.toString(), style: bodyText1)
                          : Container(),
                      const SizedBox(
                        width: 4,
                      ),
                      toInt(item.chdN) > 0
                          ? const Icon(Icons.child_care_rounded)
                          : Container(),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(item.chdN.toString(), style: bodyText1),
                      const Icon(Icons.child_friendly),
                      toInt(item.chdN) > 0
                          ? const Icon(Icons.child_care_rounded, size: 14)
                          : Container(),
                      const SizedBox(width: 2),
                      toInt(item.chdN) > 0
                          ? Text(item.chdN.toString())
                          : Container(),
                      const SizedBox(width: 8),
                      toInt(item.infN) > 0
                          ? const Icon(Icons.child_friendly, size: 14)
                          : Container(),
                      const SizedBox(width: 2),
                      toInt(item.infN) > 0
                          ? Text(item.infN.toString())
                          : Container(),
                      const SizedBox(width: 8),
                      toInt(item.repeatcount) > 0
                          ? const Icon(
                              FontAwesomeIcons.recycle,
                              size: 12,
                              color: Colors.indigo,
                            )
                          : Container(),
                      toInt(item.repeatcount) > 0
                          ? Text(item.repeatcount.toString())
                          : Container(),
                      const Spacer(),
                      item.comment +
                                  item.lf +
                                  item.task +
                                  item.conversation +
                                  item.review +
                                  item.follow ==
                              0
                          ? Container()
                          : Icon(Icons.attachment_sharp, color: grey)
                    ])
                  ])),
        ],
      ),

      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       parseString(item.vipcode) == ""
      //           ? Container()
      //           : textButton(item.vipcode, Colors.red, onTap: () => {}),
      //       toInt(item.comment) == 0
      //           ? Container()
      //           : IconButton(
      //               icon: const Icon(FontAwesomeIcons.comments),
      //               iconSize: 24,
      //               color: Colors.grey[600],
      //               onPressed: () {}),
      //       toInt(item.task) == 0
      //           ? Container()
      //           : IconButton(
      //               icon: const Icon(FontAwesomeIcons.phone),
      //               iconSize: 24,
      //               color: Colors.grey[600],
      //               onPressed: () {}),
      //       toInt(item.lf) == 0
      //           ? Container()
      //           : IconButton(
      //               icon: const Icon(FontAwesomeIcons.tshirt),
      //               iconSize: 20,
      //               color: Colors.grey[600],
      //               onPressed: () {}),
      //       IconButton(
      //           icon: const Icon(Icons.menu),
      //           color: Colors.grey[600],
      //           iconSize: 24,
      //           onPressed: () {}),
      //     ],
      //   )
      // ],
    );
  }

  Widget listItem(item) {
    return Dismissible(
        key: Key(item.id.toString()),
        direction: DismissDirection.startToEnd,
        background: slideBackground(
            "left", "Select", FontAwesomeIcons.handPointer, appColors["guest"]),
        confirmDismiss: (direction) async {
          Get.back(
              result: GuestInfo(
                  id: item.id!,
                  room: item.roomnumber,
                  address: item.address,
                  country: item.country,
                  nation: item.nationality,
                  zipcode: item.zipcode,
                  city: item.city,
                  bdate: DateTime.parse(item.bdate),
                  clientid: item.clientid,
                  pension: item.pension,
                  reservationid: item.reservationid,
                  checkin: item.checkin,
                  checkout: item.checkout,
                  vipcode: item.vipcode,
                  agency: item.agency,
                  title: item.title,
                  gender: item.gender,
                  repeatcount: item.repeatcount,
                  age: item.age,
                  firstname: item.firstname,
                  lastname: item.lastname,
                  clientname: item.clientname,
                  phone: item.phone,
                  cell: item.cell,
                  email: item.email));
          //Get.toNamed(controller.page.editRoute, arguments: item.id);
          return false;
        },
        child: listCard(item));
  }

  return listBody(controller: controller, itemWidget: listItem);
}
