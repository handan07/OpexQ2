import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/list_model.dart';

//const kBackgroundColor = Color(0xFF202020);
//const kPrimaryColor = Color(0xFFFFBD73);

//Color kprimaryColor = Color(0xFF7033FF);
//Color kPrimaryColorShadow = Color(0xFFF1EBFF);

// #efefef gri
// #13141a siyah
// #6a6a70 koyu gri
// #0e4fd2 koyu mavi
// #6f9ee7 mavi

// #f3f3f3
// #0959d5 mavi
// #95baf1 açık mavi
// #7c8cd4 mor
// #e8eacc kşrli beyaz

Color kPrimaryColor = const Color(0xFF0e4fd2);
Color kSecondaryColor = const Color(0xFF6f9ee7);

Color grey = Colors.grey.shade500; //Color(0xFF6a6a70);
Color lightgrey = Colors.grey.shade300;

Color kPrimaryColorShadow = const Color(0xFFF1EBFF);

//Images
var logoImage = 'assets/images/logo.png';
Map<String, dynamic> formData = {};

const Locale tr = Locale('tr', 'TR');
const Locale en = Locale('en', 'UK');

//enum Status { New, Processing, Confirmed, Canceled, Planning }
// text style
final headline1 = Get.theme.textTheme.headline1;
final headline2 = Get.theme.textTheme.headline2;
final headline3 = Get.theme.textTheme.headline3;
final headline4 = Get.theme.textTheme.headline4;
final headline5 = Get.theme.textTheme.headline5;
final headline6 = Get.theme.textTheme.headline6;

final subtitle1 = Get.theme.textTheme.subtitle1;
final subtitle2 = Get.theme.textTheme.subtitle2;

final bodyText1 = Get.theme.textTheme.bodyText1;
final bodyText2 = Get.theme.textTheme.bodyText2;

//Icons
final appIcons = <String, IconData>{
  "format_list_numbered": Icons.format_list_numbered,
  "hotel": Icons.hotel,
  "book": Icons.book,
  "comment": FontAwesomeIcons.comment,
  "accessibility": Icons.accessibility,
  "people": Icons.people,
  "task": FontAwesomeIcons.listCheck,
  "checklist": FontAwesomeIcons.circleCheck,
  "roomrack": FontAwesomeIcons.bed,
  "guest": FontAwesomeIcons.faceSmile,
  "guestselect": FontAwesomeIcons.faceSmile,
  "survey": FontAwesomeIcons.star,
  "lost": FontAwesomeIcons.glasses,
  "approval": FontAwesomeIcons.stamp,
  "technic": FontAwesomeIcons.plug,
  "table": FontAwesomeIcons.utensils,
  "resource": FontAwesomeIcons.umbrellaBeach,
  "activity": FontAwesomeIcons.shuffle,
  "dashboard": FontAwesomeIcons.chartBar,
  "reminder": FontAwesomeIcons.clock,
  "message": FontAwesomeIcons.bell,
  "handbook": FontAwesomeIcons.file,
  "callcenter": FontAwesomeIcons.paperPlane,
  "new": FontAwesomeIcons.plus,
};

//Page colors
final appColors = <String, Color>{
  "lost": Colors.lime,
  "roomrack": Colors.blueAccent,
  "comment": Colors.green,
  "survey": Colors.green,
  "guest": Colors.cyan,
  "guestselect": Colors.cyan,
  "dashboard": Colors.black,
  "reservation": Colors.orange,
  "table": Colors.orange,
  "resource": Colors.orange,
  "activity": Colors.orange,
  "approval": Colors.purple,
  "grey": Colors.grey,
  "task": Colors.red,
  "tasklog": Colors.red,
  "checklist": Colors.brown,
  "message": Colors.blueGrey,
  "help": Colors.pink,
  "reminder": Colors.redAccent,
  "callcenter": Colors.greenAccent,
  "whatsapptemplate": Colors.greenAccent,
  "whatsappuser": Colors.greenAccent,
  "new": Colors.deepOrangeAccent
};

final taskColors = <int, Color>{
  1: Colors.blue, //new
  2: Colors.lime.shade800, //in progress
  3: Colors.orange, //plan
  4: Colors.green, // completed
  5: Colors.green, //confirmed
  6: Colors.grey, //cancel
  7: Colors.purple, //reopen
  8: Colors.teal, // redirect
  9: Colors.indigo, // notified
};

final approvalColors = <int, Color>{
  0: Colors.blueGrey.shade200, //waiting
  1: Colors.blueGrey, //pending
  2: Colors.blue, //approved
  3: Colors.red.shade900, // not approved
  4: Colors.grey, //cancel
};

List<ListPage> listPages = [
  ListPage(
      id: 1,
      name: "task",
      color: Colors.red,
      header: "Tasks",
      baseObject: "CALLS",
      tabs: [
        "Open",
        "Delayed",
        "Plan",
        "Closed",
        "Cancelled",
        "Future",
        "Created By Me"
      ],
      editTabs: ["Record", "Guest", "Detail"],
      initialvalue: {},
      sort: ["Date", "Priority", "State", "Type"],
      homeRoute: "/listHome",
      listRoute: "/list",
      editRoute: "/taskEdit",
      headerEdit: "Task",
      visible: true),
  ListPage(
      id: 1,
      name: "tasklog",
      color: Colors.red,
      header: "Task Log",
      baseObject: "CALLS",
      tabs: [],
      editTabs: [],
      initialvalue: {},
      sort: [],
      homeRoute: "/listHome",
      listRoute: "/list",
      editRoute: "/taskLogEdit",
      headerEdit: "Task Log",
      visible: false),
  ListPage(
      id: 2,
      name: "comment",
      color: Colors.green,
      header: "Comments",
      baseObject: "COMMENTS",
      tabs: ["New", "Investigating", "Completed"],
      sort: ["Date", "Priority", "Type", "Result"],
      editTabs: ["Comment", "Guest", "Detail", "Result", "Statements"],
      initialvalue: {
        "STATEID": 1,
        "STATE": "New",
        "PRIORITYID": 1,
        "PRIORITY": "Normal"
      },
      homeRoute: "/listHome",
      listRoute: "/list",
      editRoute: "/commentEdit",
      headerEdit: "Comment",
      visible: true),
  ListPage(
      id: 22,
      name: "survey",
      color: Colors.green,
      header: "Surveys",
      baseObject: "COMMENTS",
      tabs: ["New", "Investigating", "Completed"],
      editTabs: ["Detail", "Guest", "Answers"],
      initialvalue: {},
      sort: ["Date", "Score"],
      homeRoute: "/listHome",
      listRoute: "/list",
      editRoute: "/surveyEdit",
      headerEdit: "Survey",
      visible: false),
  ListPage(
      id: 3,
      name: "guest",
      color: Colors.cyan,
      header: "Guests",
      baseObject: "CLIENT_RESERVATION",
      tabs: [
        "Inhouse",
        "Vip",
        "Repeat",
        "Birtdate",
        "Arrival",
        "Departure",
        "CheckedOut",
        "Reservation",
      ],
      sort: ["Room", "Name", "CheckIn"],
      editTabs: ["Profile", "Reservation", "Notes"],
      initialvalue: {},
      homeRoute: "/listHome",
      listRoute: "/list",
      editRoute: "/guestEdit",
      headerEdit: "Guest Info",
      visible: true),
  ListPage(
      id: 4,
      name: "roomrack",
      color: Colors.blueAccent,
      header: "Roomrack",
      baseObject: "Roomrack",
      tabs: [
        "All",
        "Dirty",
        "Clean",
        "Inspected",
        "Touched",
        "OOO",
        "OOS",
        "Clean-Vacant",
        "Clean-Stay",
        "Dirty-Vacant",
        "Dirty-Stay",
        "Reserved",
        "CheckOut",
        "Q",
        "Vip",
        "DND",
        "LateCheckOut"
      ],
      sort: ["Room", "Cleaness", "wewee"],
      editTabs: [],
      initialvalue: {},
      homeRoute: "/listHome",
      listRoute: "/list",
      editRoute: "/roomrackEdit",
      headerEdit: "Room State",
      visible: true),
  ListPage(
      id: 5,
      name: "lost",
      color: Colors.lime,
      header: "Lost&Found",
      baseObject: "LOSTANDFOUND",
      tabs: ["Lost", "Found", "Delivered", "Destroyed"],
      sort: ["Date", "PROPERTY"],
      editTabs: ["Property", "Client", "Detail", "Delivery"],
      initialvalue: {},
      homeRoute: "/listHome",
      listRoute: "/list",
      editRoute: "/lostEdit",
      headerEdit: "Lost&Found",
      visible: true),
  ListPage(
      id: 6,
      name: "table",
      color: Colors.orange,
      header: "Table",
      baseObject: "ALACARTE_RESERVATION",
      tabs: ["List", "Grid"],
      sort: [],
      editTabs: [],
      initialvalue: {},
      homeRoute: "/tableHome",
      listRoute: "/tableList",
      editRoute: "/tableReservationEdit",
      headerEdit: "Table Reservation",
      visible: true),
  ListPage(
      id: 7,
      name: "resource",
      color: Colors.orange,
      header: "Resource",
      baseObject: "RESERVATION",
      tabs: ["List", "Grid"],
      sort: [],
      editTabs: [],
      initialvalue: {},
      homeRoute: "/resourceHome",
      listRoute: "/tableList",
      editRoute: "/tableReservationEdit",
      headerEdit: "Resource Reservation",
      visible: false),
  ListPage(
      id: 8,
      name: "activity",
      color: Colors.orange,
      header: "Activity",
      baseObject: "ACTIVITY_RESERVATION",
      tabs: ["To Do", "Done", "Confirmed"],
      sort: ["Date", "List"],
      editTabs: [],
      initialvalue: {},
      homeRoute: "/listHome",
      listRoute: "list",
      editRoute: "/checkListEdit",
      headerEdit: "Activity",
      visible: false),
  ListPage(
      id: 9,
      name: "checklist",
      color: Colors.brown,
      header: "Checklist",
      baseObject: "CHECK_LIST_MASTER",
      tabs: ["To Do", "Done", "Confirmed"],
      sort: ["Date", "List"],
      editTabs: ["Check", "Form"],
      initialvalue: {},
      homeRoute: "/listHome",
      listRoute: "/list",
      editRoute: "/checkListEdit",
      headerEdit: "Checklist",
      visible: true),
  ListPage(
      id: 10,
      name: "approval",
      color: Colors.purple,
      header: "Approval",
      baseObject: "APPROVAL_PROCESS_LIST",
      tabs: ["Pending", "Approved", "Not Approved", "Cancelled"],
      sort: ["Date", "Requested By", "Form"],
      editTabs: ["Approve", "Log"],
      initialvalue: {},
      homeRoute: "/listHome",
      listRoute: "/list",
      editRoute: "",
      headerEdit: "Approval",
      visible: true),
  ListPage(
      id: 11,
      name: "callcenter",
      color: Colors.greenAccent,
      header: "WhatsApp",
      baseObject: "CALLCENTER_LOG",
      tabs: ["Queue ", "Accepted", "Resolved"],
      initialvalue: {},
      sort: ["Date", "Name"],
      editTabs: [],
      homeRoute: "/listHome",
      listRoute: "/list",
      editRoute: "/callcenterEdit",
      headerEdit: "Send Message",
      visible: true),
  ListPage(
      id: 12,
      name: "dashboard",
      color: Colors.black,
      header: "Dashboard",
      baseObject: "STDREMINDER",
      tabs: ["Summary", "Tables", "Graphs"],
      sort: [],
      editTabs: [],
      initialvalue: {},
      homeRoute: "",
      listRoute: "/list",
      editRoute: "",
      headerEdit: "",
      visible: false),
  ListPage(
      id: 12,
      name: "select",
      color: Colors.black,
      header: "Select",
      baseObject: "STDREMINDER",
      tabs: [],
      sort: [],
      editTabs: [],
      homeRoute: "",
      listRoute: "/list",
      editRoute: "",
      initialvalue: {},
      headerEdit: "Select",
      visible: false),
  ListPage(
      id: 122,
      name: "whatsapptemplate",
      color: Colors.black,
      header: "WhatsApp Templates",
      baseObject: "WHATSAPP_TEMPLATES",
      tabs: ["Document", "Template", "Interactive"],
      sort: [],
      editTabs: [],
      homeRoute: "",
      listRoute: "/list",
      editRoute: "",
      initialvalue: {},
      headerEdit: "Select",
      visible: false),
  ListPage(
      id: 122,
      name: "whatsappuser",
      color: Colors.black,
      header: "Select Asistant",
      baseObject: "WHATSAPP_USERS",
      tabs: [],
      sort: [],
      editTabs: [],
      homeRoute: "",
      listRoute: "/list",
      editRoute: "",
      initialvalue: {},
      headerEdit: "Select",
      visible: false),
  ListPage(
      id: 100,
      name: "reminder",
      color: Colors.redAccent,
      header: "Reminders",
      baseObject: "STDREMINDER",
      tabs: ["Today", "Future", "Past"],
      sort: [],
      editTabs: [],
      initialvalue: {},
      homeRoute: "",
      listRoute: "/list",
      editRoute: "/reminderEdit",
      headerEdit: "Reminder",
      visible: false),
  ListPage(
      id: 101,
      name: "message",
      color: Colors.blueGrey,
      header: "Messages",
      baseObject: "STDNOTIFICATION_LOG",
      tabs: ["Today", "Past"],
      sort: [],
      headerEdit: "",
      editTabs: [],
      initialvalue: {},
      editRoute: "",
      homeRoute: "",
      listRoute: "/list",
      //editRoute: "/messageEdit",
      //headerEdit: "Message",
      visible: false),
  ListPage(
      id: 102,
      name: "handbook",
      color: Colors.blueGrey,
      header: "Handbook",
      baseObject: "STDHANDBOOK",
      tabs: ["Department", "All"],
      sort: [],
      editTabs: [],
      initialvalue: {},
      homeRoute: "",
      listRoute: "/list",
      editRoute: "/handbookEdit",
      headerEdit: "Handbook",
      visible: false),
  ListPage(
      id: 103,
      name: "guestselect",
      color: Colors.cyan,
      header: "Guest Select",
      baseObject: "CLIENT_RESERVATION",
      tabs: [
        "Inhouse",
        "Arrival",
        "Departure",
        "CheckedOut",
        "Reservation",
      ],
      sort: ["Room", "Name", "CheckIn"],
      editTabs: [],
      initialvalue: {},
      homeRoute: "/listHome",
      listRoute: "/list",
      editRoute: "/guestEdit",
      headerEdit: "Guest Info",
      visible: false),
];
