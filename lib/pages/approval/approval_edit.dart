import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:opexq/pages/form/form_controller.dart';
import 'package:opexq/pages/form/widgets/form_widgets.dart';
import 'package:opexq/widgets/widgets.dart';

List<Widget> approvalEdit(FormController controller) {
  List<List<Widget>> tabs = [];

  //record
  List<Widget> tab0 = [
    formCard([
      formText("Process", "PROCESSNAME"),
      formText("Requested By", "REQUESTEDBY"),
      formBuilderDateTimePicker(
          "Date", "REQUESTDATE", InputType.date, controller),
      formText("Explanation", "EXPLANATION")
    ]),
    formCard([
      formText("State", "DESCRIPTION"),
      formText("Desciption", "DESCRIPTION")
    ])
  ];

  tabs = [tab0];

  if (controller.activeTab.value + 1 > tabs.length) {
    return [noData()];
  } else {
    return tabs[controller.activeTab.value];
  }
}
