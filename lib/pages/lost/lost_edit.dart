import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:opexq/pages/form/form_controller.dart';
import 'package:opexq/pages/form/widgets/form_image_widget.dart';
import 'package:opexq/pages/form/widgets/form_widgets.dart';
import 'package:opexq/utils/configuration.dart';

Widget lostEdit(FormController controller) {
  //property
  Widget master() {
    return Column(children: <Widget>[
      formCard([
       formStdLookup("Type", "LFTYPE",
            "LOSTANDFOUND-LFTYPE", controller.formKey),
        formLookup("Finder", "LFPERSON", "STAFF", "VW_STDSTAFF", "Username",
            "UserName", controller),
        formText("Place", "LFPLACE"),
      ]),
      formCard([
        formStdLookup("Property Type", "PROPERTYTYPE",
            "LOSTANDFOUND-PROPERTYTYPE", controller.formKey),
        formStdLookup("Property Color", "PROPERTYCOLOR",
            "LOSTANDFOUND-PROPERTYCOLOR", controller.formKey),
        formStdLookup("Property Model", "PROPERTYMODEL",
            "LOSTANDFOUND-PROPERTYMODEL", controller.formKey),
        formStdLookup("Property Make", "PROPERTYMAKE",
            "LOSTANDFOUND-PROPERTYMAKE", controller.formKey),
        formStdLookup("Property Gender", "PROPERTYGENDER",
            "LOSTANDFOUND-PROPERTYGENDER", controller.formKey),
        formText("Property", "PROPERTY"),
        formText("Property Store", "PROPERTYSTORE"),
        formText("Property Information", "PROPERTYINFO"),
        formText("Description", "DESCRIPTION", maxLines: 5),
        formImage("IMAGELINK", controller)
      ])
    ]);
  }

  //Detail
  Widget detail() {
    return Column(children: <Widget>[
      formCard([
        formBuilderDateTimePicker("Date", "LFDATE", InputType.both, controller),
        formSwitch("Is valuable?", "ISVALUABLE"),
        formBuilderDateTimePicker(
            "Wait Until", "WAITUNTIL", InputType.date, controller),
        formBuilderDateTimePicker(
            "Record Date", "RDATE", InputType.both, controller,
            enabled: false),
        formText("Logon", "RUSER", enabled: false)
      ]),
      formCard([
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: <Widget>[
            Text("Destroy Info", style: subtitle2),
          ]),
        ),
        formBuilderDateTimePicker(
            "Date", "DESTROYDATE", InputType.both, controller),
        formText("Staff", "DESTROYSTAFF"),
        formText("User", "DESTROYRUSER"),
        formText("Description", "DESTROYDESCRIPTION", maxLines: 5)
      ]),
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
      formCard([
        formBuilderDateTimePicker(
            "Check in", "CHECKIN", InputType.date, controller,
            enabled: false),
        formBuilderDateTimePicker(
            "Check put", "CHECKOUT", InputType.date, controller,
            enabled: false),
        formText("Agency", "AGENCY", enabled: false),
        formText("Vip Code", "VIPCODE", enabled: false),
        formNumber("Repeat Count", "REPEATCOUNT", controller, enabled: false),
        formNumber("Age", "AGE", controller, enabled: false),
        formNumber("Reservation No", "RESERVATIONID", controller,
            enabled: false),
      ]),
    ]);
  }

  //Delivery
  Widget delivery() {
    return Column(children: <Widget>[
      formCard([
        formBuilderDateTimePicker(
            "Delivery Date", "DELIVERYDATE", InputType.both, controller),
        formLookup("Staff", "DELIVERYSTAFFID", "DELIVERYSTAFF", "VW_STDSTAFF",
            "Username", "Id", controller),
        formStdLookup("Type", "DELIVERYTYPE", "LOSTANDFOUND-DELIVERYTYPE",
            controller.formKey),
        formText("Delivered By", "DELIVERYPERSON")
      ]),
    ]);
  }

  //Destrroy
  // Widget destroy() {
  //   return Column(children: <Widget>[]);
  // }

  return IndexedStack(
    index: controller.activeTab.value,
    children: <Widget>[master(), guest(), detail(), delivery()],
  );
}
