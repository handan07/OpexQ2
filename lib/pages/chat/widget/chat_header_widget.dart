import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/callcenter_log_model.dart';
import 'package:opexq/pages/chat/chat_controller.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';

Widget storyButton(String imgUrl, String userName) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0),
    child: Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
          radius: 26.0,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          userName,
          //style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

Widget chatTitle(CallCenter conversation) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(40),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () => goToForm("guest", id: conversation.crmid, parameters: {
              "filterField": "CRM",
              "filterValue": conversation.clientid.toString()
            }),
            child: Text(
              conversation.guestname ?? "",
              style: headline6,
            ),
          ),
          const SizedBox(height: 4),
          Row(children: <Widget>[
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: conversation.isActive == true
                      ? Colors.green
                      : Colors.red),
            ),
            const SizedBox(width: 4),
            Text(
              formatDate(conversation.lastreceiveddate),
              style: bodyText2,
            ),
            const SizedBox(width: 8),
            Text(
              conversation.lastreceivedtime ?? "",
              style: bodyText2,
            ),
            const SizedBox(width: 8),
            Text(
              conversation.status.toUpperCase(),
              style: bodyText2,
            ),
          ]),
        ]),
  );
}

List<Widget> chatActions() {
  return [
    // IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
    // IconButton(icon: Icon(Icons.call), onPressed: () {}),
    PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      padding: const EdgeInsets.all(0),
      onSelected: (value) {
        ChatController controller = Get.find();
        switch (value) {
          case "Accepted":
            controller.handleConversationStatus(value);
            break;
          case "Resolve":
            controller.handleConversationStatus(value);
            break;
          case "Return":
            controller.handleConversationStatus(value);
            break;
          case "AddUser":
            goToList("whatsappuser");
            break;
          // case "AddGuest":
          //   goToList("whatsappguest");
          //   break;
          // case "SendImage":
          //   //controller.sendImage();
          //   break;
          default:
        }
      },
      itemBuilder: (BuildContext contesxt) {
        return [
          PopupMenuItem(
            value: "Accepted",
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text("Accept"),
                  Icon(
                    FontAwesomeIcons.userLock,
                    size: 18,
                  )
                ]),
          ),
          PopupMenuItem(
            value: "Resolve",
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text("Resolve"),
                  Icon(
                    FontAwesomeIcons.userCheck,
                    size: 18,
                  )
                ]),
          ),
          PopupMenuItem(
            value: "Return",
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text("Release"),
                  Icon(
                    FontAwesomeIcons.userGroup,
                    size: 18,
                  )
                ]),
          ),
          PopupMenuItem(
            value: "AddUser",
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text("Add Assistant"),
                  Icon(
                    FontAwesomeIcons.userPlus,
                    size: 18,
                  )
                ]),
          ),
        ];
      },
    ),
  ];
}
