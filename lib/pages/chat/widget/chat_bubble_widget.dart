import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/chat_model.dart';
import 'package:opexq/pages/chat/widget/chat_widgets.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';

openMap(String? link) {
  if (link == null || link == "") return;
  String lat = link.substring(0, link.indexOf(",") - 1);
  String long = link.substring(link.indexOf(",") + 1);
  launchMap(lat, long);
}

Widget messageWidget(ChatMessage item) {
  switch (item.messageType) {
    case "text":
      return RichText(
          text: TextSpan(
        text: item.message == null ? "" : unEscapedString(item.message),
        style: subtitle2,
      ));
    case "image":
      return Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => openImage(item.url),
            child: Image.network(
              item.url!,
              fit: BoxFit.cover,
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(height: 8),
          RichText(text: TextSpan(text: item.message ?? ""))
        ],
      );
    case "file":
      return Column(
        children: <Widget>[
          templateIcon(FontAwesomeIcons.file, () => launchURL(item.url)),
          Text(item.message ?? "")
        ],
      );
    case "video":
      return Column(
        children: <Widget>[
          templateIcon(FontAwesomeIcons.video, () => openVideo(item.url)),
          Text(item.message ?? "")
        ],
      );
    case "audio":
      return Column(
        children: <Widget>[
          templateIcon(FontAwesomeIcons.microphone, () => openAudio(item.url)),
          Text(item.message ?? "")
        ],
      );
    case "hsm":
      return RichText(
          text: TextSpan(
        text: item.message ?? "",
        style: subtitle2,
      ));
    case "interactive":
      return RichText(
          text: TextSpan(
        text: item.message ?? "",
        style: subtitle2,
      ));
    case "location":
      return templateIcon(FontAwesomeIcons.mapPin, () => openMap(item.url));
    case "whatsappSticker":
      return Image.network(
        item.url!,
        fit: BoxFit.fill,
        width: 100,
        height: 100,
      );
    default:
      return Container();
  }
}

Widget chatBubble(ChatMessage item) {
  return Container(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
    child: Align(
      alignment:
          (item.direction == "sent" ? Alignment.topRight : Alignment.topLeft),
      child: Container(
          width: Get.width * 0.80,
          decoration: BoxDecoration(
            borderRadius: item.direction == "sent"
                ? const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16))
                : const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
            color:
                (item.direction == "sent" ? Colors.green[100] : Colors.white),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: item.direction == "sent"
                    ? Text('${item.groupUser} ',
                        style: const TextStyle(
                            fontSize: 14.00, fontWeight: FontWeight.w600))
                    : Text('${item.guestName} ',
                        style: const TextStyle(
                            fontSize: 14.00, fontWeight: FontWeight.w600))),
            Align(
                alignment: (item.direction == "sent"
                    ? Alignment.topRight
                    : Alignment.topLeft),
                child: messageWidget(item)),
            const SizedBox(height: 8),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(formatDateTime(item.updatedDateTime),
                      style: const TextStyle(fontSize: 10.00)),
                  const SizedBox(width: 8),
                  Icon(
                    item.messagestatus == "read"
                        ? FontAwesomeIcons.checkDouble
                        : item.messagestatus == "rejected"
                            ? FontAwesomeIcons.xmark
                            : item.messagestatus == "accepted"
                                ? FontAwesomeIcons.check
                                : item.messagestatus == "transmitted"
                                    ? FontAwesomeIcons.check
                                    : item.messagestatus == "delivered"
                                        ? FontAwesomeIcons.check
                                        : item.messagestatus == "received"
                                            ? FontAwesomeIcons.checkDouble
                                            : FontAwesomeIcons.check,
                    color: Colors.indigo,
                    size: 10,
                  )
                ])
          ])),
    ),
  );
}
