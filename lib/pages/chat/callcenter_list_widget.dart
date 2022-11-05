import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/callcenter_log_model.dart';
import 'package:opexq/pages/chat/chat_controller.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/pages/list/widgets/slidebackground_widget.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';

Widget callCenterList(ListController controller) {
  Widget circleButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 28,
      ),
    );
  }

  Widget messageIcon(String type) {
    switch (type) {
      case "file":
        return Icon(FontAwesomeIcons.file, size: 16, color: grey);
      case "image":
        return Icon(FontAwesomeIcons.image, size: 16, color: grey);
      case "video":
        return Icon(FontAwesomeIcons.video, size: 16, color: grey);
      case "audio":
        return Icon(FontAwesomeIcons.music, size: 16, color: grey);
      case "location":
        return Icon(FontAwesomeIcons.locationPin,size: 16, color: grey);
      case "whatsappSticker":
        return Icon(FontAwesomeIcons.stickerMule, size: 16, color: grey);
      default:
        return Icon(FontAwesomeIcons.newspaper, size: 16, color: grey);
    }
  }

  Widget listCard(CallCenter item) {
    return listCardContainer(Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  item.typeid == 1
                      ? circleButton(
                          FontAwesomeIcons.instagram, Colors.red.shade900)
                      : item.typeid == 2
                          ? circleButton(
                              FontAwesomeIcons.whatsapp, Colors.green.shade800)
                          : circleButton(
                              FontAwesomeIcons.telegram, Colors.blue.shade800),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(item.id.toString(), style: bodyText2)
                  // textButton(item.lastreceivedtime, lightgrey, textColor: grey),
                  // const SizedBox(
                  //   height: 8,
                  // ),
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
                    Text(
                      "${item.guestname}",
                      style: headline5,
                      //overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          messageIcon(item.messagetype),
                          const SizedBox(width: 8),
                          Expanded(
                            child: AutoSizeText(
                              item.messagetext ?? "",
                              style: bodyText1,
                              maxLines: 2,
                              minFontSize: 12,
                            ),
                          )
                        ]),
                    const SizedBox(height: 8),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              "${item.agentname ?? ""} ${formatDate(item.lastreceiveddate)} ${item.lastreceivedtime}",
                              softWrap: true,
                              style: bodyText2),
                          const SizedBox(width: 4),
                          const Icon(FontAwesomeIcons.checkDouble,
                              size: 14, color: Colors.blue),
                          const Spacer(),
                          item.hasbirthday
                              ? const Icon(Icons.cake)
                              : Container(),
                          const SizedBox(width: 4)
                        ])
                  ]))
        ]));
  }

  Widget listItem(item) {
    return Dismissible(
        key: Key(item.id.toString()),
        direction: DismissDirection.startToEnd,
        background: slideBackground(
            "left",
            "Read",
            FontAwesomeIcons.commentDots,
            controller.page.color.withOpacity((6 + 2) / 10)),
        //secondaryBackground: slideLeftBackground(),
        confirmDismiss: (direction) async {
          controller.stopTimer();
          final ChatController controllerChat =
              Get.put<ChatController>(ChatController());
          controllerChat.init(item);

          await Get.toNamed(AppRoutes.chat);

          // if (result ?? false) {
          //   controller.refreshList();
          // }
          controller.activeTab.value = 0;
          controller.refreshList();
          controller.startTimer();
          return false;
        },
        child: listCard(item));
  }

  return listBody(controller: controller, itemWidget: listItem);
}
