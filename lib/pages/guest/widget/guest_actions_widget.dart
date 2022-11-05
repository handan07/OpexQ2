import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/chat/callcenter_list_widget.dart';
import 'package:opexq/pages/comment/comment_list_widget.dart';
import 'package:opexq/pages/task/task_list.dart';
import 'package:opexq/utils/utils.dart';

List<Widget> guestActions() {
  return [
    // IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
    // IconButton(icon: Icon(Icons.call), onPressed: () {}),
    PopupMenuButton<String>(
      icon: const Icon(FontAwesomeIcons.ellipsisVertical),
      padding: const EdgeInsets.all(0),
      onSelected: (value) {
        switch (value) {
          case "request":
            final ListController controller = Get.find(tag: "task");
            controller.listType.value = "sheet";

            openBottomSheetMax(taskList(controller), "Requests");
            break;
          case "comment":
            final ListController controller = Get.find(tag: "comment");
            controller.listType.value = "sheet";

            openBottomSheetMax(commentList(controller), "Comments");
            break;
          case "conversation":
            final ListController controller = Get.find(tag: "callcenter");
            controller.listType.value = "sheet";

            openBottomSheetMax(callCenterList(controller), "Conversations");
            break;
          default:
        }
      },
      itemBuilder: (BuildContext contesxt) {
        return [
          const PopupMenuItem(
            value: "request",
            child: Text("Requests"),
          ),
          const PopupMenuItem(
            value: "comment",
            child: Text("Comments"),
          ),
          const PopupMenuItem(
            value: "survey",
            child: Text("Surveys"),
          ),
          const PopupMenuItem(
            value: "conversation",
            child: Text("Conversations"),
          ),
          const PopupMenuItem(
            value: "reservation",
            child: Text("Reservations"),
          ),
          const PopupMenuItem(
            value: "action",
            child: Text("Actions"),
          ),
          const PopupMenuItem(
            value: "membership",
            child: Text("Membership"),
          ),
        ];
      },
    ),
  ];
}
