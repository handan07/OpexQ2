import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:opexq/models/roomrack_model.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/widgets.dart';

Widget roomrackList(ListController controller) {
  roomStatusUpdate(String newValue, int room) {}

  // Widget itemWidget(Roomrack item) {
  //   return listCardContainer(
  //     Column(
  //       children: <Widget>[
  //         Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: <Widget>[
  //               Text(
  //                   "${parseString(item.roomstate)} - ${parseString(item.extraroomstate)}",
  //                   style: subtitle1),
  //               IconButton(
  //                   icon: const Icon(Icons.menu_outlined),
  //                   onPressed: () => {print("menu")})
  //             ]),
  //         Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: <Widget>[
  //               Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: const <Widget>[
  //                     Icon(Icons.star),
  //                     Icon(Icons.phone),
  //                     Icon(Icons.handyman)
  //                   ]),
  //               Text(parseString(item.roomno), style: headline4),
  //               Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: const <Widget>[
  //                     Icon(Icons.star),
  //                     Icon(Icons.phone),
  //                     Icon(Icons.handyman)
  //                   ]),
  //             ]),
  //         const SizedBox(height: 8),
  //         Text(parseString(item.roomavailability),
  //             softWrap: true, style: bodyText1),

  //         // Row(children: <Widget>[
  //         //   Column(
  //         //       crossAxisAlignment: CrossAxisAlignment.center,
  //         //       mainAxisAlignment: MainAxisAlignment.start,
  //         //       children: <Widget>[
  //         //         Container(
  //         //             width: 50,
  //         //             height: 50,
  //         //             decoration: BoxDecoration(
  //         //               shape: BoxShape.circle,
  //         //               color: Color(0xffF3F3FE),
  //         //             ),
  //         //             child: item.arrivalviptype != null
  //         //                 ? Icon(Icons.thumb_up_sharp, color: Colors.green)
  //         //                 : Icon(Icons.comment, color: Colors.yellowAccent)),
  //         //         Text(parseString(item.arrivalviptype),
  //         //             style: TextStyle(
  //         //               color: Color(0xff464855),
  //         //             )),
  //         //       ]),
  //         // ]),

  //         const SizedBox(
  //           height: 4,
  //         ),
  //         greyLine(),
  //         const SizedBox(
  //           height: 4,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             const Icon(Icons.supervised_user_circle),
  //             const SizedBox(
  //               width: 4,
  //             ),
  //             Text(item.inhouseadult.toString(), style: bodyText1),
  //             const SizedBox(
  //               width: 4,
  //             ),
  //             const Icon(Icons.child_care_rounded),
  //             const SizedBox(
  //               width: 4,
  //             ),
  //             Text(item.inhousechd.toString(), style: bodyText1),
  //             const Icon(Icons.child_friendly),
  //             const SizedBox(
  //               width: 4,
  //             ),
  //             Text(item.inhouseinf.toString(), style: bodyText1)
  //           ],
  //         )
  //         // Row(
  //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         //   children: <Widget>[
  //         //     textButton(item.inhousehasbirthday.toString(), Colors.red,
  //         //         onTap: () => {}),
  //         //     IconButton(
  //         //         icon: Icon(FontAwesomeIcons.cameraRetro),
  //         //         iconSize: 24,
  //         //         color: Colors.grey[600],
  //         //         onPressed: () => showNetworkImage(item.arrivalviptype)),
  //         //     IconButton(
  //         //         icon: Icon(FontAwesomeIcons.cameraRetro),
  //         //         iconSize: 24,
  //         //         color: Colors.grey[600],
  //         //         onPressed: () {}),
  //         //     IconButton(
  //         //         icon: Icon(FontAwesomeIcons.cameraRetro),
  //         //         iconSize: 24,
  //         //         color: Colors.grey[600],
  //         //         onPressed: () {}),
  //         //     Container(
  //         //       width: 30,
  //         //       height: 30,
  //         //       child: Icon(
  //         //         Icons.menu,
  //         //         color: Colors.black54,
  //         //         size: 25,
  //         //       ),
  //         //     ),
  //         //   ],
  //         // )
  //       ],
  //     ),
  //   );
  // }

  //
  // final statusColors = <String, Color>{
  //   'clean': Colors.blue,
  //   'dirty': Colors.orange,
  //   'maintance': Colors.red,
  //   'confirmed': Colors.green,
  //   'touched': Colors.black,
  //   'closed': Colors.blueGrey,
  // };

  // emptyIcon() {
  //   return const Icon(
  //     Icons.star,
  //     color: Colors.white,
  //   );
  // }

  cardIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Icon(icon, color: grey),
    );
  }

  cardIconSmall(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Icon(icon, color: grey, size: 18),
    );
  }

  roomStateLookup(item) {
    return DropdownButton<String>(
      elevation: 2,
      isDense: true,
      value: "Clean", //item.roomstate,
      underline: Container(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          roomStatusUpdate(newValue, item.roomid);
        }
      },
      items: <String>['Clean', 'Dirty', "Touched", "Inspected", "OOO", "OOS"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: subtitle2,
          ),
        );
      }).toList(),
    );
  }

  roomExtraStateLookup(item) {
    return DropdownButton<String>(
      value: "None",
      underline: Container(),
      onChanged: (String? newValue) {},
      items: <String>["None", 'DND', 'NoService', "Touched"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: subtitle2,
          ),
        );
      }).toList(),
    );
  }

  paxRow(Roomrack item) {
    int adult = 0;
    int chd = 0;
    int inf = 0;

    if (toInt(item.arrivalresid) > 0) {
      adult = toInt(item.arrivaladult);
      chd = toInt(item.arrivalchd);
      inf = toInt(item.arrivalinf);
    } else {
      adult = toInt(item.inhouseadult);
      chd = toInt(item.inhousechd);
      inf = toInt(item.inhouseinf);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        toInt(adult) > 0
            ? cardIconSmall(Icons.supervised_user_circle)
            : Container(),
        const SizedBox(
          width: 4,
        ),
        toInt(adult) > 0
            ? Text(adult.toString(), style: bodyText1)
            : Container(),
        const SizedBox(
          width: 4,
        ),
        toInt(chd) > 0 ? cardIconSmall(Icons.child_care_rounded) : Container(),
        const SizedBox(
          width: 4,
        ),
        toInt(chd) > 0 ? Text(chd.toString(), style: bodyText1) : Container(),
        toInt(inf) > 0 ? cardIconSmall(Icons.child_friendly) : Container(),
        const SizedBox(width: 2),
        toInt(inf) > 0 ? Text(item.inhouseinf.toString()) : Container()
      ],
    );
  }

  Widget roomrackCardContainer(Widget child, {Color? color}) {
    return Container(
        padding: const EdgeInsets.all(12),
        // margin: const EdgeInsets.only(
        //   right: 8,
        //   top: 8,
        // ),
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: child);
  }

  Widget listCard(Roomrack item) {
    return roomrackCardContainer(Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                roomStateLookup(item),
                Text(item.arrivalresid != null
                    ? parseString(item.arrivalviptype)
                    : parseString(item.inhouseviptype))
              ]),
          const SizedBox(height: 8),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          cardIcon(Icons.phone),
                        ],
                      )),
                  Expanded(
                    flex: 6,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // item.inhouseviptype == null
                          //     ? emptyIcon()
                          //     : const Icon(Icons.star),

                          Text(item.roomno,
                              style: TextStyle(
                                  color: roomrackColors[item.roomstateid],
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold)),
                          // item.maintenance == 0
                          //     ? emptyIcon()
                          //     : const Icon(Icons.phone),
                          item.guestcomment == null
                              ? Text(item.roomavailability ?? "",
                                  style: subtitle2)
                              : Text("! ${item.roomavailability ?? ""}",
                                  style: subtitle2),

                          paxRow(item),
                        ]),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          cardIcon(Icons.abc_rounded),
                          cardIcon(Icons.phone)
                        ],
                      ))
                ]),
          ),
          const SizedBox(height: 8),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[roomExtraStateLookup(item), Text("10:30")])
        ]));
  }

  Widget listItem(item) {
    return listCard(item);
  }

  return RefreshIndicator(
    onRefresh: () => Future.sync(
      () => controller.pagingController.refresh(),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: PagedGridView<int, dynamic>(
        shrinkWrap: true,
        pagingController: controller.pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 100 / 110,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
        ),
        builderDelegate: PagedChildBuilderDelegate<dynamic>(
          animateTransitions: true,
          // [transitionDuration] has a default value of 250 milliseconds.
          transitionDuration: const Duration(milliseconds: 500),
          itemBuilder: (context, item, index) {
            return listItem(item);
          },
          firstPageErrorIndicatorBuilder: (_) => pageErrorIndicator(
            error: controller.pagingController.error,
            onTryAgain: () => controller.pagingController.refresh(),
          ),
          newPageErrorIndicatorBuilder: (_) => pageErrorIndicator(
            error: controller.pagingController.error,
            onTryAgain: () =>
                controller.pagingController.retryLastFailedRequest(),
          ),
          firstPageProgressIndicatorBuilder: (_) =>
              showBusyIndicator(), //FirstPageProgressIndicator(),
          newPageProgressIndicatorBuilder: (_) =>
              showBusyIndicator(), //NewPageProgressIndicator(),
          noItemsFoundIndicatorBuilder: (_) =>
              noData(), //NoItemsFoundIndicator(),
          noMoreItemsIndicatorBuilder: (_) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.center, child: Text("No more data".tr)),
          ), //NoMoreItemsIndicator(),
        ),
        //separatorBuilder: (context, index) => const Divider(height: 5),
      ),
    ),
  );

  //return listBody(controller: controller, itemWidget: listItem);
}

final roomrackColors = <int, Color>{
  1: Colors.blue.shade400, //clean
  2: Colors.red.shade400, //dirty
  3: Colors.green.shade600, //confirmed
  4: Colors.orange.shade200, // touched
  5: Colors.grey.shade200, //oos
  6: Colors.black54, //ooo
};
