import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/state_manager.dart';
import 'package:opexq/pages/form/form_controller.dart';
import 'package:opexq/pages/form/widgets/form_widgets.dart';
import 'package:opexq/pages/form/widgets/form_image_widget.dart';

Widget taskLogEdit(FormController controller) {
  RxBool plan = false.obs;

  void onStateChanged() {
    if (controller.formData['STATEID'].toString() == "3") {
      debugPrint("3");
      plan.value = true;
    } else {
      plan.value = false;
    }
  }

  return Column(children: <Widget>[
    formCard([
      formLookup(
          "State", "STATEID", "STATE", "CALL_STATE", "ID", "STATE", controller,
          onChanged: onStateChanged),
      Obx(() => plan.value == false
          ? Container()
          : formBuilderDateTimePicker(
              "Date", "PDATE", InputType.date, controller)),
      Obx(() => plan.value == false
          ? Container()
          : formBuilderDateTimePicker(
              "Time", "PTIME", InputType.time, controller)),
      formLookup("Subject", "SUBJECTID", "SUBJECT", "CALL_SUBJECT", "ID",
          "SUBJECT", controller),
      formLookup("Staff", "STAFFID", "STAFF", "VW_STDSTAFF", "Id", "UserName",
          controller),
      formLookup("Description Tag", "TAGID", "DESCRIPTION", "CALL_TAG", "ID",
          "TAG", controller),
      formText("Description", "TDESCRIPTION", maxLines: 5),
      formImage("FILENAME", controller)
    ])
  ]);
}
