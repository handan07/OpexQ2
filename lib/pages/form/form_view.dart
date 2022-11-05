import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/chat/callcenter_edit.dart';
import 'package:opexq/pages/comment/comment_edit.dart';
import 'package:opexq/pages/form/form_controller.dart';
import 'package:opexq/pages/guest/guest_edit.dart';
import 'package:opexq/pages/lost/lost_edit.dart';
import 'package:opexq/pages/survey/survey_edit.dart';
import 'package:opexq/pages/task/task_edit.dart';
import 'package:opexq/pages/task/task_edit_action.dart';
import 'package:opexq/pages/task/task_log_edit.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/appbar_widget.dart';
import 'package:opexq/widgets/button_widgets.dart';
import 'package:opexq/widgets/drawer_widget.dart';

// ignore: must_be_immutable
class FormView extends StatelessWidget {
  final FormController controller =
      Get.put<FormController>(FormController(), tag: Get.parameters["page"]);

  FormView({Key? key}) : super(key: key);

  Widget body() {
    switch (controller.page.name) {
      case "task":
        return taskEdit(controller);
      case "tasklog":
        return taskLogEdit(controller);
      case "lost":
        return lostEdit(controller);
      case "comment":
        return commentEdit(controller);
      case "survey":
        return surveyEdit(controller);
      // case "approval":
      //   return approvalEdit(controller);
      // case "checklist":
      //   return checklistEdit(controller);
      case "guest":
        return guestEdit(controller);
      case "callcenter":
         return callCenterEdit(controller);
      // case "roomrack":
      //   return roomrackList(controller);
      // case "reminder":
      //   return reminderList(controller);
      // case "message":
      //   return messageList(controller);
      // case "handbook":
      //   return handbookList(controller);
      default:
        return Container();
    }
  }

  List<Widget> appBarAction() {
    switch (controller.page.name) {
      case "task":
        return taskActions();
      // case "lost":
      //   return guestActions();
      // case "comment":
      //   return guestActions();
      // case "survey":
      //   return guestActions();
      // case "approval":
      //   return guestActions();
      // case "checklist":
      //   return guestActions();
      // case "guest":
      //   return guestActions();
      // case "callcenter":
      //   return callCenterList(controller);
      // case "roomrack":
      //   return roomrackList(controller);
      // case "reminder":
      //   return reminderList(controller);
      // case "message":
      //   return messageList(controller);
      // case "handbook":
      //   return handbookList(controller);
      default:
        return [Container()];
    }
  }

  Widget floatingButton() {
    return controller.page.name == "guest"
        ? circleButton(
            icon: FontAwesomeIcons.borderAll,
            onTap: () => controller.summaryList(),
            color: controller.page.color.withOpacity((6 + 2) / 10))
        : circleSaveButton(controller.handleSave,
            controller.page.color.withOpacity((6 + 2) / 10));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isReady.value == false
        ? showBusyIndicator()
        : Scaffold(
            appBar: AppBarApp(
              header: controller.page.headerEdit,
              color: controller.page.name,
              tabController: controller.tabController,
              tabs: controller.page.editTabs,
              handleTabChange: controller.handleTabChange,
              //actions: appBarAction(),
            ),
            endDrawer: const DrawerWidget(),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 12.0,
                ),
                child: FormBuilder(
                  initialValue: controller.formData,
                  key: controller.formKey,
                  child: body(),
                )),
            floatingActionButton: floatingButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            // bottomNavigationBar: controller.page.editMenu == null
            //     ? null
            //     : controller.page.editMenu!.isNotEmpty
            //         ? bottomNavigationBar(
            //             controller.navigationItemTap, controller.page.editMenu!)
            //         : null
          ));
  }
}
