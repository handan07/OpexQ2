import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/chat/callcenter_list_widget.dart';
import 'package:opexq/pages/comment/comment_list_widget.dart';
import 'package:opexq/pages/task/task_list.dart';
import 'package:opexq/utils/utils.dart';

List<Widget> taskActions() {
  return [
    PopupMenuButton<String>(
      icon: const Icon(FontAwesomeIcons.ellipsisVertical),
      padding: const EdgeInsets.all(0),
      onSelected: (value) {
        switch (value) {
          case "history":
            final ListController controller = Get.find(tag: "task");
            controller.listType.value = "sheet";

            openBottomSheetMax(taskList(controller), "Requests");
            break;
          case "subtasks":
            final ListController controller = Get.find(tag: "comment");
            controller.listType.value = "sheet";

            openBottomSheetMax(commentList(controller), "Comments");
            break;
          case "hardware":
            final ListController controller = Get.find(tag: "callcenter");
            controller.listType.value = "sheet";

            openBottomSheetMax(callCenterList(controller), "Conversations");
            break;
          default:
        }
      },
      itemBuilder: (BuildContext contesxt) {
        return [
          PopupMenuItem(
            value: "history",
            child: Text("History".tr),
          ),
          PopupMenuItem(
            value: "subtasks",
            child: Text("Sub Tasks".tr),
          ),
          PopupMenuItem(
            value: "hardware",
            child: Text("Hardware".tr),
          ),
        ];
      },
    ),
  ];
}
