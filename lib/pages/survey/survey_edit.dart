import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:opexq/pages/form/form_controller.dart';
import 'package:opexq/pages/form/widgets/form_widgets.dart';

Widget surveyEdit(FormController controller) {
  //record
  Widget master() {
    return Column(children: <Widget>[
      formCard([
        formLookup("Survey", "SURVEYD", "SURVEY", "SURVEY_DEFINITION", "ID",
            "SNAME", controller),
      ]),
      formCard([
        formBuilderDateTimePicker("Date", "CDATE", InputType.both, controller),
        formStdLookup(
            "Source", "SOURCE", "COMMENTS-SOURCE", controller.formKey),
        formStdLookup(
            "Channel", "CHANNEL", "COMMENTS-CHANNEL", controller.formKey),
        formLookup("Location", "LOCATIONID", "LOCATION", "PLACES", "ID",
            "PLACE", controller),
        formLookup("State", "STATEID", "STATE", "COMMENT_STATE", "ID", "STATE",
            controller),
      ]),
      formCard([
        formText("Internal Comment", "COMMENT", maxLines: 5),
        formText("Guest Comment", "GUESTCOMMENT", maxLines: 5),
        formNumber("Score", "CSCORE", controller),
      ]),
      formCard([
        formBuilderDateTimePicker(
            "Record Date", "RDATE", InputType.both, controller,
            enabled: false),
        formText("Logon", "RUSER", enabled: false),
        formStdLookup("Language", "LANG", "SURVEY-LANGUAGE", controller.formKey)
      ])
    ]);
  }

  //guest
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
  Widget answers() {
    return Container();
  }

  return IndexedStack(
    index: controller.activeTab.value,
    children: <Widget>[master(), guest(), answers()],
  );
}
