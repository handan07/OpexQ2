import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/guest_model.dart';
import 'package:opexq/models/summary_model.dart';
import 'package:opexq/pages/comment/comment_list_widget.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/pages/list/widgets/slidebackground_widget.dart';
import 'package:opexq/pages/list/widgets/summary_widget.dart';
import 'package:opexq/pages/list/widgets/survey_list_widget.dart';
import 'package:opexq/pages/task/task_list.dart';
import 'package:opexq/services/api_service.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';
import 'package:opexq/widgets/new_menu_bottomsheet.dart';

Widget guestList(ListController controller) {
  String? filterValue;
  // Widget menuTile(String title, IconData icon, String action, Guest item) {
  //   return ListTile(
  //       contentPadding: const EdgeInsets.only(left: 16),
  //       tileColor: Colors.white,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(12.0),
  //       ),
  //       leading: Icon(icon, size: 30),
  //       title: Text(title.tr),
  //       onTap: () {
  //         Get.back();
  //         var clientParameters = {
  //           "CLIENTID": item.id,
  //           "ROOM": item.roomnumber,
  //           "ADDRESS": item.address,
  //           "COUNTRY": item.country,
  //           "NATION": item.nation,
  //           "ZIPCODE": item.zipcode,
  //           "CITY": item.city,
  //           "BDATE": item.bdate,
  //           "PENSION": item.pension,
  //           "RESERVATIONID": item.reservationid,
  //           "CHECKIN": item.checkin,
  //           "CHECKOUT": item.checkout,
  //           "VIPCODE": item.vipcode,
  //           "AGENCY": item.agency,
  //           "TITLE": item.title,
  //           "GENDER": item.gender,
  //           "REPEATCOUNT": item.repeatcount,
  //           "AGE": item.age,
  //           "FIRSTNAME": item.firstname,
  //           "LASTNAME": item.lastname,
  //           "CLIENTNAME": item.clientname,
  //           "PHONE": item.phone,
  //           "CELL": item.cell,
  //           "EMAIL": item.email
  //         };
  //         goToForm(action, parameters: clientParameters);
  //       });
  // }

  // actionMenu(Guest item) {
  //   // Get.bottomSheet(
  //   //     Container(
  //   //       margin: const EdgeInsets.all(30),
  //   //       decoration: BoxDecoration(
  //   //         color: Colors.white,
  //   //         borderRadius: BorderRadius.circular(15),
  //   //       ),
  //   //       child: Wrap(
  //   //         children: <Widget>[
  //   //           menuTile("New Task", appIcons["task"] ?? Icons.arrow_forward_ios,
  //   //               "task", item),
  //   //           greyline(),
  //   //           menuTile(
  //   //               "New Comment",
  //   //               appIcons["comment"] ?? Icons.arrow_forward_ios,
  //   //               "comment",
  //   //               item),
  //   //           greyline(),
  //   //           menuTile("New Lost", appIcons["lost"] ?? Icons.arrow_forward_ios,
  //   //               "lost", item),
  //   //           // greyline(),
  //   //           // menuTile(
  //   //           //     "Resource", FontAwesomeIcons.fileArchive, "resource", item),
  //   //         ],
  //   //       ),
  //   //     ),
  //   //     backgroundColor: Colors.transparent);
  // }

  handleMenuClick(int id) {
    switch (id) {
      case 1:
        Get.back();
        final ListController controller =
            Get.put<ListController>(ListController("task"), tag: "task");
        controller.listType.value = "sheet";
        controller.listFilterField.value = "CLIENTID";
        controller.listFilterValue.value = filterValue ?? "0";
        controller.refreshList();
        openBottomSheetMax(taskList(controller), "Requests",
            color: Colors.grey.shade200);
        break;
      case 2:
        Get.back();
        final ListController controller =
            Get.put<ListController>(ListController("comment"), tag: "comment");
        controller.listType.value = "sheet";
        controller.listFilterField.value = "CLIENTID";
        controller.listFilterValue.value = filterValue ?? "0";
        controller.refreshList();
        openBottomSheetMax(commentList(controller), "Comments",
            color: Colors.grey.shade200);

        break;
      case 3:
        Get.back();
        final ListController controller =
            Get.put<ListController>(ListController("survey"), tag: "survey");
        controller.listType.value = "sheet";
        controller.listFilterField.value = "CLIENTID";
        controller.listFilterValue.value = filterValue ?? "0";
        controller.refreshList();
        openBottomSheetMax(surveyList(controller), "Surveys",
            color: Colors.grey.shade200);

        break;
      default:
    }
  }

  Future summaryList(int id, String? clientname, String value) async {
    var isReady = false.obs;
    List<Summary> sumlist = <Summary>[].obs;
    List<Summary> sumlist1 = <Summary>[].obs;

    var list = await ApiService.get()
        .execApi("AppGUESTEditSum", "CLIENT_RESERVATION", {"ID": id});
    if (list.length > 0) {
      sumlist.assignAll(
          (list[0]).map((i) => Summary.fromMap(i)).toList().cast<Summary>());
    }
    if (list.length > 1 && (list[1].length > 0)) {
      sumlist1.assignAll(
          (list[1]).map((i) => Summary.fromMap(i)).toList().cast<Summary>());
    }

    isReady.value = true;

    filterValue = value;
    openBottomSheet(
        summaryScreen(sumlist, sumlist1, appColors["guest"]!, handleMenuClick),
        clientname ?? "Summary");
  }

  Widget listCard(Guest item) {
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
            flex: 8,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          item.clientname ?? "",
                          style: headline5,
                          maxLines: 1,
                          //overflow: TextOverflow.ellipsis,
                          minFontSize: 10,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                          onTap: () => openBottomSheet(
                              guestNewMenubottomSheet(item), item.clientname),
                          child: const Icon(Icons.more_vert))
                    ],
                  ),
                  const SizedBox(height: 8),
                  AutoSizeText(item.agency ?? "", style: bodyText1),
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
                    toInt(item.chdN) > 0
                        ? Text(item.chdN.toString(), style: bodyText1)
                        : Container(),
                    toInt(item.infN) > 0
                        ? const Icon(Icons.child_friendly)
                        : Container(),
                    const SizedBox(width: 2),
                    toInt(item.infN) > 0
                        ? Text(item.infN.toString())
                        : Container(),
                    const SizedBox(width: 8),
                    const Spacer(),
                    toInt(item.comment) +
                                toInt(item.lf) +
                                toInt(item.task) +
                                toInt(item.conversation) +
                                toInt(item.review) +
                                toInt(item.follow) ==
                            0
                        ? Container()
                        : GestureDetector(
                            onTap: () => summaryList(
                                item.clientid ?? 0,
                                item.clientname ?? "",
                                item.clientid.toString()),
                            child: Icon(Icons.attachment, color: grey))
                  ])
                ]),
          ),
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

  Widget listItem(Guest item) {
    return Dismissible(
        key: Key(item.id.toString()),
        direction: DismissDirection.startToEnd,
        background: slideBackground("left", "Read", FontAwesomeIcons.user,
            controller.page.color.withOpacity((6 + 2) / 10)),
        confirmDismiss: (direction) async {
          //controller.handleEditForm(item.clientid ?? 0);
          goToForm("guest", id: item.clientid, parameters: {
            "filterField": "RESERVATIONNAMEID",
            "filterValue": item.reservationnameid.toString()
          });
          return false;
        },
        child: listCard(item));
  }

  return listBody(controller: controller, itemWidget: listItem);
}
