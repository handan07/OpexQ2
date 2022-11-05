import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/lost_model.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/pages/list/widgets/slidebackground_widget.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';

Widget lostList(ListController controller) {
  Widget listCard(Lost item) {
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
                  textButton(toTime(item.lfdate), Colors.grey),
                  const SizedBox(
                    height: 8,
                  ),
                  AutoSizeText(
                    formatDate(item.lfdate),
                    maxLines: 1,
                    minFontSize: 8,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                      padding: const EdgeInsets.all(0),
                      //color: grey,
                      width: 70,
                      height: 70,
                      child: CircleAvatar(
                          //radius: 45,
                          backgroundColor: lightgrey, //Color(0xffFDCF09),
                          child: item.imagelink == null
                              ? item.lftype == "Lost"
                                  ? const Icon(FontAwesomeIcons.bagShopping,
                                      color: Colors.green)
                                  : const Icon(FontAwesomeIcons.shirt,
                                      color: Colors.red)
                              : GestureDetector(
                                  onTap: () => openImage(item.imagelink),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        item.imagelink!,
                                        fit: BoxFit.cover,
                                        width: 60.0,
                                        height: 60.0,
                                      )),
                                )

                          //ClipRRect(
                          //     borderRadius: BorderRadius.circular(50),
                          //     child: Image.network(item.imagelink)),
                          ))
                ]),
          ),
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
                      item.property == null
                          ? item.propertytype ?? ""
                          : "${item.property ?? ""} - ${item.propertytype ?? ""}",
                      maxLines: 1,
                      minFontSize: 12,
                      style: headline5),
                  const SizedBox(
                    height: 16,
                  ),
                  AutoSizeText(item.lfplace ?? "",
                      style: subtitle1, maxLines: 1),
                  const SizedBox(height: 8),
                  AutoSizeText(
                      item.place == null
                          ? item.clientname ?? ""
                          : "${item.place} - ${item.clientname}",
                      maxLines: 1,
                      minFontSize: 10,
                      style: subtitle1),
                  Container(
                    constraints: BoxConstraints(maxWidth: Get.width - 150),
                    child: Text(parseString(item.description),
                        softWrap: true, style: bodyText1),
                  )
                ]),
          ),
        ],
      ),

      // greyLine(),
      // const SizedBox(
      //   height: 4,
      // ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: <Widget>[
      //     textButton(item.status, Colors.blue, onTap: () => {}),
      //     Text(
      //       parseString(item.lftype),
      //       style: bodyText1,
      //     ),
      //   ],
      // )
      //],
    );
  }

  Widget listItem(item) {
    return Dismissible(
        key: Key(item.id.toString()),
        direction: DismissDirection.startToEnd,
        background: slideBackground("left", "Edit", FontAwesomeIcons.file,
            controller.page.color.withOpacity((6 + 2) / 10)),
        confirmDismiss: (direction) async {
          controller.handleEditForm(item.id);
          return false;
        },
        child: listCard(item));
  }

  return listBody(controller: controller, itemWidget: listItem);
}
