import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/approval_list_widget.dart';
import 'package:opexq/pages/chat/callcenter_list_widget.dart';
import 'package:opexq/pages/list/widgets/checklist_list_widget.dart';
import 'package:opexq/pages/comment/comment_list_widget.dart';
import 'package:opexq/pages/guest/guest_list_widget.dart';
import 'package:opexq/pages/list/widgets/guestselect_list_widget.dart';
import 'package:opexq/pages/list/widgets/handbook_list_widget.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/pages/lost/lost_list_widget.dart';
import 'package:opexq/pages/list/widgets/message_list_widget.dart';
import 'package:opexq/pages/list/widgets/reminder_list_widget.dart';
import 'package:opexq/pages/roomrack/roomrack_list_widget.dart';
import 'package:opexq/pages/list/widgets/select_list_widget.dart';
import 'package:opexq/pages/list/widgets/survey_list_widget.dart';
import 'package:opexq/pages/task/task_list.dart';
import 'package:opexq/pages/list/widgets/whatsapp_template_list_widget.dart';
import 'package:opexq/pages/list/widgets/whatsapp_user_list.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/widgets/appbar_widget.dart';
import 'package:opexq/widgets/button_widgets.dart';
import 'package:opexq/widgets/drawer_widget.dart';

class ListPageView extends StatelessWidget {
  final ListController controller = Get.put<ListController>(
      ListController(Get.parameters["page"] ?? "xx"),
      tag: Get.parameters["page"]);

  ListPageView({Key? key}) : super(key: key);

  Widget body(var controller) {
    switch (controller.page!.name) {
      case "task":
        return taskList(controller);
      case "lost":
        return lostList(controller);
      case "comment":
        return commentList(controller);
      case "survey":
        return surveyList(controller);
      case "approval":
        return approvalList(controller);
      case "checklist":
        return checklistList(controller);
      case "guest":
        return guestList(controller);
      case "guestselect":
        return guestSelectList(controller);
      case "callcenter":
        return callCenterList(controller);
      case "roomrack":
        return roomrackList(controller);
      case "reminder":
        return reminderList(controller);
      case "message":
        return messageList(controller);
      case "handbook":
        return handbookList(controller);
      case "select":
        return selectList(controller);
      case "whatsapptemplate":
        return whatsAppTemplateList(controller);
      case "whatsappuser":
        return whatsAppUserList(controller);
      default:
        return Center(
          child: Text(
            "List item not found".tr,
            style: subtitle2,
          ),
        );
    }
  }

  Widget bottomSortWidget() {
    return Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: lightgrey)),
        child: Align(
          alignment: Alignment.topCenter,
          child: Obx(() => controller.listSort.value == ""
              ? Container()
              : DropdownButton<String>(
                  value: controller.listSort.value,
                  underline: Container(),
                  onChanged: (String? newValue) {
                    controller.handleSort(newValue!);
                  },
                  items: controller.page.sort
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: subtitle2,
                      ),
                    );
                  }).toList(),
                )),
        ));
  }

  Widget twoFabWidget() {
    return controller.page.name == "select" &&
            controller.singleSelect.value == false
        ? circleButton(
            icon: FontAwesomeIcons.handPointUp,
            onTap: () {
              Get.back(result: controller.selectedItemList);
            },
            color: appColors[controller.page.name]?.withOpacity((6 + 2) / 10))
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                controller.page.homeRoute == ""
                    ? circleButton(
                        icon: FontAwesomeIcons.borderAll,
                        iconColor: Colors.transparent,
                        color: Colors.transparent)
                    : circleButton(
                        icon: FontAwesomeIcons.borderAll,
                        onTap: () => controller.summaryList(),
                        color: appColors[controller.page.name]
                            ?.withOpacity((6 + 2) / 10)),
                controller.page.editRoute == ""
                    ? circleButton(
                        icon: FontAwesomeIcons.borderAll,
                        iconColor: Colors.transparent,
                        color: Colors.transparent)
                    : circleButton(
                        icon: FontAwesomeIcons.plus,
                        onTap: () async => controller.handleEditForm(0),
                        color: appColors[controller.page.name]
                            ?.withOpacity((6 + 2) / 10)),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return controller.listType.value == "list"
        ? Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBarApp(
              header: controller.header.value,
              color: controller.page.name,
              tabs: controller.page.tabs,
              handleTabChange: controller.handleTabChange,
              tabController: controller.tabController,
              // actions: listBarAction(),
            ),
            endDrawer: const DrawerWidget(),
            body: Column(children: <Widget>[
              searchBox(controller),
              Expanded(child: body(controller))
            ]),
            bottomNavigationBar:
                controller.page.name == "select" ? null : bottomSortWidget(),
            floatingActionButtonLocation: controller.page.name == "select"
                ? FloatingActionButtonLocation.miniEndDocked
                : FloatingActionButtonLocation.centerDocked,
            floatingActionButton: twoFabWidget())
        : SizedBox(
            height: Get.height,
            child: Column(children: <Widget>[
              searchBox(controller),
              Obx(() => Expanded(child: body(controller)))
            ]),
          );
  }
}
