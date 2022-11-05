import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:opexq/pages/form/form_controller.dart';
import 'package:opexq/pages/form/widgets/form_widgets.dart';

Widget guestEdit(FormController controller) {
  Widget master() {
    return Column(children: <Widget>[
      formCard([
        formText("Guest Name", "CLIENTNAME"),
        formText("Phone", "PHONE"),
        formText("Cell", "CELL"),
        formText("Email", "EMAIL"),
        formText("Country", "COUNTRY"),
        formText("Gender", "GENDER"),
        formText("Nation", "NATION"),
        formNumber("Age", "AGE", controller)
      ])
    ]);
  }

  //reservation
  Widget reservation() {
    return Column(children: <Widget>[
      formCard([
        formText("Room", "ROOM"),
        formBuilderDateTimePicker(
            "Checkin", "CHECKIN", InputType.date, controller,
            enabled: false),
        formBuilderDateTimePicker(
            "Check Out", "CHECKOUT", InputType.date, controller,
            enabled: false),
        formText("Agency", "AGENCY"),
        formText("Vip code", "VIPCODE"),
        formNumber("Repeat", "REPEATCOUNT", controller),
        formNumber("Reservation No", "RESERVATIONID", controller),
        formNumber("State", "RESERVATIONSTATE", controller)
      ]),
    ]);
  }

  Widget notes() {
    return Column(children: <Widget>[Container()]);
  }
  // FormFieldConfig clientid = FormFieldConfig(
  //   icon: FontAwesomeIcons.periscope,
  //   label: "CLIENTID",
  //   valueField: "CLIENTID",
  //   type: editorType.int,
  // );

  //final ListController _controller = Get.find(tag: "task");
  // _controller.listType.value = "sheet";

  // List<Widget> tab2 = [taskList(_controller)];

  return IndexedStack(
    index: controller.activeTab.value,
    children: <Widget>[
      master(),
      reservation(),
      notes(),
    ],
  );
}
