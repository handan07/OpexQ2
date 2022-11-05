import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:opexq/pages/form/form_controller.dart';
import 'package:opexq/pages/form/widgets/form_widgets.dart';
import 'package:opexq/pages/form/widgets/form_image_widget.dart';

Widget taskEdit(FormController controller) {
  Widget master() {
    return Column(
      children: <Widget>[
        formCard([
          formLookup(
              "Place", "PLACEID", "PLACE", "PLACES", "ID", "PLACE", controller,
              isRequired: true),
          formLookup("Subject", "SUBJECTID", "SUBJECT", "CALL_SUBJECT", "ID",
              "SUBJECT", controller,
              isRequired: true),
          formText("Description", "TDESCRIPTION", maxLines: 3),
          formBuilderDateTimePicker(
              "Date", "TDATE", InputType.date, controller),
          formBuilderDateTimePicker(
              "Time", "TTIME", InputType.time, controller),
          formImage("DOCNAME", controller)
        ]),
        formCard([
          formLookup("Priority", "PRIORITYID", "PRIORITY", "CALL_PRIORITY",
              "ID", "PRIORITY", controller),
          formLookup("Type", "TYPEID", "TICKETTYPE", "CALL_TYPE", "ID",
              "TICKETTYPE", controller),
          formLookup("Notifier Name", "NOTIFIERNAME", "NOTIFIERNAME",
              "VW_STDSTAFF", "UserName", "UserName", controller),
        ]),
      ],
    );
  }

  Widget guest() {
    return Column(children: <Widget>[
      formCard([
        formGuestLookup("Guest", "CLIENTID", "CLIENTNAME", controller),
        formText("Client Name", "CLIENTNAME"),
        formText("Room", "ROOM"),
        formText("Phone", "PHONE"),
        formText("Cell", "CELL"),
        formText("Email", "EMAIL"),
        formText("Country", "COUNTRY"),
        formText("Gender", "GENDER", enabled: false),
        formText("Nation", "NATION", enabled: false),
      ]),
      if (controller.activeTab.value == 1)
        formCard([
          formBuilderDateTimePicker(
              "Check In", "CHECKIN", InputType.date, controller,
              enabled: false),
          formBuilderDateTimePicker(
              "Check Out", "CHECKOUT", InputType.date, controller,
              enabled: false),
          formText("Agency", "AGENCY", enabled: false),
          formText("Vip Code", "VIPCODE", enabled: false),
          formNumber("Repeat Count", "REPEATCOUNT", controller, enabled: false),
          formNumber("Age", "AGE", controller, enabled: false),
          formNumber("Reservation No", "RESERVATIONID", controller,
              enabled: false),
        ])
    ]);
  }

  Widget detail() {
    return Column(children: <Widget>[
      formCard([
        formLookup("Staff", "STAFFID", "STAFF", "VW_STDSTAFF", "ID", "UserName",
            controller),
        formNumber("Amount", "AMOUNT", controller),
        formLookup("Control Form", "CHECKID", "CHECKNAME", "CHECK_LIST", "ID",
            "CHECKNAME", controller),
        formLookup("Device", "DEVICEID", "DEVICE", "DEVICES", "ID", "CNAME",
            controller),
        formLookup("Service Company", "SCOMPANYID", "CNAME", "COMPANY", "ID",
            "CNAME", controller),
        formLookup("Source", "SOURCEID", "SOURCE", "CALL_SOURCES", "ID",
            "SOURCE", controller),
        formNumber("Repeat", "REPEAT", controller),
      ]),
      formCard([
        formLookup("State", "STATEID", "STATE", "CALL_STATE", "ID", "STATE",
            controller),
        formNumber("Grade", "GRADE", controller),
        formSwitch("Master Job", "MASTERJOB"),
        formBuilderDateTimePicker(
            "Record Date", "RDATE", InputType.both, controller,
            enabled: false),
        formText("Logon", "RUSER", enabled: false),
        formBuilderDateTimePicker(
            "Last Process Date", "LDATE", InputType.both, controller,
            enabled: false),
        formText("Last Process Staff", "LUSER", enabled: false)
      ])
    ]);
  }

  return IndexedStack(
    index: controller.activeTab.value,
    children: <Widget>[
      master(),
      guest(),
      detail(),
    ],
  );
}
