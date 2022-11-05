import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/pages/list/widgets/slidebackground_widget.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';

Widget messageList(ListController controller) {
  Widget listCard(item) {
    return listCardContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              item.jobtype == 'EMAIL'
                  ? const Icon(FontAwesomeIcons.envelope)
                  : item.jobtype == 'NOTIFICATION'
                      ? const Icon(FontAwesomeIcons.bell)
                      : item.jobtype == 'REPORT'
                          ? const Icon(FontAwesomeIcons.fileContract)
                          : item.jobtype == 'WHATSAPP'
                              ? const Icon(FontAwesomeIcons.paperPlane)
                              : item.jobtype == 'SMS'
                                  ? const Icon(FontAwesomeIcons.commentSms)
                                  : const Icon(FontAwesomeIcons.message),
              textButton(toTime(item.sendtime), lightgrey),
              const SizedBox(
                height: 8,
              ),
              Text(formatDate(item.senddate)),
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
                  Text("${item.jobsubject ?? ""}",
                      softWrap: true, style: subtitle1),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("${item.jobbody ?? ""}",
                      softWrap: true, style: subtitle2),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(formatDate(item.rdate), style: bodyText2),
                  ),
                ]),
          ),
          const SizedBox(width: 8),
          item.success == true
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
        return false;
      },
      child: listCard(item),
    );
  }

  return listBody(controller: controller, itemWidget: listItem);
}
