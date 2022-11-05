import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:opexq/pages/form/form_controller.dart';
import 'package:opexq/pages/form/widgets/form_widgets.dart';

import '../form/widgets/form_image_widget.dart';

Widget commentEdit(FormController controller) {
  //record
  Widget master() {
    return Column(children: <Widget>[
      formCard([
        formGuestLookup("Guest", "CLIENTID", "CLIENTNAME", controller),
        formText("Room", "PLACE")
      ]),
      formCard([
        formLookup("Comment Subject", "COMMENTITEMID", "COMMENTITEM",
            "COMMENT_ITEMS", "ID", "DESCRIPTION", controller),
        formText("Internal Comment", "COMMENT", maxLines: 5),
        formText("Guest Comment", "GUESTCOMMENT", maxLines: 5),
        formLookup(
            "Type", "TYPEID", "TYPE", "COMMENT_TYPE", "ID", "TYPE", controller),
        formStdLookup(
            "Source", "SOURCE", "COMMENTS-SOURCE", controller.formKey),
        formStdLookup(
            "Channel", "CHANNEL", "COMMENTS-CHANNEL", controller.formKey),
        formImage("DOCNAME", controller)
      ])
    ]);
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

  //reason
  Widget reason() {
    return Column(children: <Widget>[
      formCard([
        formLookup("State", "STATEID", "STATE", "COMMENT_STATE", "ID", "STATE",
            controller),
        formLookup("Priority", "PRIORITYID", "PRIORITY", "CALL_PRIORITY", "Id",
            "PRIORITY", controller),
        formLookup("Location", "LOCATIONID", "LOCATION", "PLACES", "ID",
            "PLACE", controller),
        formLookup("Department", "DEPARTMENTID", "DEPARTMENT", "STDDEPARTMENT",
            "ID", "DEPARTMENT", controller),
        formLookup("Staff", "STAFFNAME", "STAFFNAME", "VW_STDSTAFF", "UserName",
            "UserName", controller),
        formLookup("Reason Source", "REASONSOURCEID", "REASON_SOURCE",
            "COMMENT_REASON_SOURCE", "ID", "REASON_SOURCE", controller),
        formLookup("Reason Group", "REASONID", "COMMENTREASON",
            "COMMENT_REASON", "ID", "COMMENTREASON", controller),
        formLookup("Reason Sub Group", "REASONSUBID", "COMMENT_REASON_SUB",
            "COMMENT_REASON_SUB", "ID", "COMMENT_REASON_SUB", controller),
        formBuilderDateTimePicker("Date", "CDATE", InputType.both, controller),
        formBuilderDateTimePicker(
            "Record Date", "RDATE", InputType.both, controller,
            enabled: false),
        formText("Logon", "RUSER", enabled: false)
      ]),
    ]);
  }

  //reason
  Widget result() {
    return Column(children: <Widget>[
      formCard([
        formLookup("Result", "RESULTID", "ACTIONRESULT", "COMMENT_RESULT", "ID",
            "ACTIONRESULT", controller),
        formLookup("Result Type", "RESULTTYPEID", "RESULT_TYPE",
            "COMMENT_RESULT_TYPE", "ID", "RESULT_TYPE", controller),
        formLookup("Result Action", "RESULTACTIONID", "COMMENTRESULTACTION",
            "COMMENT_RESULT_ACTION", "ID", "COMMENTRESULTACTION", controller),
        formText("Result Comment", "RESULTS"),
        formText("Guest Reply", "GUESTREPLY"),
        formNumber("Cost", "PRICE", controller),
        formLookup("Currency", "CURRENCY", "CURRENCY", "STDCURCODES", "CURCODE",
            "CURCODE", controller),
        formBuilderDateTimePicker(
            "Result Date", "CRDATE", InputType.both, controller),
        formNumber("Score", "CSCORE", controller),
        formLookup("Result Staff", "CRSTAFFID", "CRSTAFF", "VW_STDSTAFF", "Id",
            "UserName", controller),
      ])
    ]);
  }

  return IndexedStack(
    index: controller.activeTab.value,
    children: <Widget>[
      master(),
      guest(),
      reason(),
      result(),
    ],
  );
}
