import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/pages/list/widgets/slidebackground_widget.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';

Widget reminderList(ListController controller) {
  Widget listCard(item) {
    return listCardContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              textButton(toTime(item.remindertime), lightgrey),
              const SizedBox(
                height: 8,
              ),
              Text(formatDate(item.reminderdate)),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          const SizedBox(
            width: 12,
          ),
          Flexible(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("${item.explanation ?? ""}",
                      softWrap: true, style: headline5),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("${formatDate(item.rdate)} ${item.ruser}",
                        style: bodyText2),
                  ),
                ]),
          ),
          const SizedBox(width: 8),
          item.checked == null
              ? const Icon(
                  FontAwesomeIcons.squareCheck,
                  color: Colors.black54,
                )
              : const Icon(
                  FontAwesomeIcons.square,
                  color: Colors.black54,
                ),
        ],
      ),
    );
  }

  Widget listItem(item) {
    return Dismissible(
      key: Key(item.id.toString()),
      direction: DismissDirection.startToEnd,
      background: slideBackground("left", "Edit", FontAwesomeIcons.file,
          controller.page.color.withOpacity((6 + 2) / 10)),
      confirmDismiss: (direction) async {
        Get.toNamed(controller.page.editRoute, arguments: item.id);
        return null;
      },
      child: listCard(item),
    );
  }

  return listBody(controller: controller, itemWidget: listItem);
}
