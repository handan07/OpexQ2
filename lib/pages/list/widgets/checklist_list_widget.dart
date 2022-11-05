import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/pages/list/widgets/slidebackground_widget.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';

Widget checklistList(ListController controller) {
  Widget listCard(dynamic item) {
    return listCardContainer(
      Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  textButton(toTime(item.mdate), Colors.grey.shade400),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(formatDate(item.mdate))
                ]),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 8,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${item.checkname}",
                    style: headline5,
                    //overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(item.belongto ?? "", style: subtitle1),
                  const SizedBox(height: 8),
                  Container(
                    constraints: BoxConstraints(maxWidth: Get.width - 150),
                    child: Text(item.ruser, style: bodyText1),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Widget listItem(item) {
    return Dismissible(
        key: Key(item.id.toString()),
        direction: DismissDirection.startToEnd,
        background: slideBackground(
            "left",
            "Edit",
            FontAwesomeIcons.commentDots,
            controller.page.color.withOpacity((6 + 2) / 10)),
        confirmDismiss: (direction) async {
          controller.handleEditForm(item.id);
          return false;
        },
        child: listCard(item));
  }

  return listBody(controller: controller, itemWidget: listItem);
}
