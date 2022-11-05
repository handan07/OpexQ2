import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:opexq/models/list_model.dart';
import 'package:opexq/models/summary_model.dart';
import 'package:opexq/services/api_service.dart';
import 'package:opexq/pages/list/widgets/summary_widget.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';

class ListController extends GetxController with GetTickerProviderStateMixin {
  late ListPage page;
  late TextEditingController searchTextController;
  TabController? tabController;
  var isReady = false.obs;
  RxString listSort = "".obs;
  RxString listOrderBy = "DESC".obs;
  RxString listFilterField = "".obs;
  RxString listFilterValue = "".obs;

  var listType = "list".obs;
  static const pageSize = 50;
  //gerek olmayabilir
  List<dynamic> datalist = [];
  final api = Get.find<ApiService>();
  late PagingController<int, dynamic> pagingController;
  Timer? listTimer;

  List<Summary> sumlist = <Summary>[].obs;
  List<Summary> sumlist1 = <Summary>[].obs;

  var activeTab = 0.obs;
  RxList selectedItemList = [].obs;
  RxBool singleSelect = true.obs;

  //SelectList
  var header = "".obs;
  var lookupValueField = "".obs;
  var valueField = "".obs;

  final String pageName;
  ListController(this.pageName);

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    searchTextController = TextEditingController(text: "");
    findPage();
    pagingController = PagingController(firstPageKey: 0);
    pagingController.addPageRequestListener((pageKey) {
      loadList(pageKey);
    });
    if ((page.name == "task" || page.name == "callcenter") &&
        listFilterField.value == "") {
      datalist.clear();
      startTimer();
    }
  }

  void findPage() {
    //if (Get.parameters["page"] != null) {
    //pageName = Get.parameters["page"] ?? "";
    page = listPages.firstWhere((element) => element.name == pageName);
    //activeTabs = page!.tabs!;
    if (page.tabs.isNotEmpty) {
      tabController = TabController(vsync: this, length: page.tabs.length);
      activeTab.value = toInt(Get.parameters["tab"]);
      tabController!.index = activeTab.value;
    }

    if (page.sort.isNotEmpty) listSort.value = page.sort[0];

    if (pageName == "select") {
      header.value = Get.arguments[3];
      lookupValueField.value = Get.arguments[1];
      valueField.value = Get.arguments[4];
      String selectType = Get.arguments[5];
      if (selectType == "multi") {
        singleSelect.value = false;
      }
      singleSelect.value = true;

      listOrderBy.value = "ASC";
    } else {
      header.value = page.header;
    }
  }

  // Future<dynamic> fetchSelectList(int offset) async {
  //   String? table;
  //   String? valueField;
  //   String? displayfield;

  //   table = Get.arguments[0];
  //   valueField = Get.arguments[1];
  //   displayfield = Get.arguments[2];

  //   final parameters = {
  //     "_OFFSET": offset,
  //     "_NEXT": pageSize,
  //     "SEARCH": searchTextController.text,
  //     "ORDERBY": listOrderBy.value,
  //     "TABLE": table ?? "",
  //     "VALUEFIELD": valueField ?? "ID",
  //     "DISPLAYFIELD": displayfield ?? ""
  //   };

  //   var listResponse = await ApiService.get().execApi(
  //       "App" + page.name.toUpperCase() + "List", page.baseObject, parameters);
  //   List list = [];
  //   if (listResponse.isNotEmpty) list = listResponse[0];
  //   return (list).map((i) => SelectItem.fromMap(i)).toList().cast<SelectItem>();
  // }

  // Future<dynamic> fetchList(int offset) async {

  //   var listResponse = await ApiService.get().execApi(
  //       "App" + page.name.toUpperCase() + "List", page.baseObject, parameters);
  //   List list = [];
  //   if (listResponse.isNotEmpty) list = listResponse[0];
  //   if (page.name == "task") {
  //     return (list).map((i) => Task.fromMap(i)).toList().cast<Task>();
  //   }
  //   if (page.name == "tasklog") {
  //     return (list).map((i) => TaskLog.fromMap(i)).toList().cast<TaskLog>();
  //   } else if (page.name == "lost") {
  //     return (list).map((i) => Lost.fromMap(i)).toList().cast<Lost>();
  //   } else if (page.name == "comment") {
  //     return (list).map((i) => Comment.fromMap(i)).toList().cast<Comment>();
  //   } else if (page.name == "survey") {
  //     return (list).map((i) => Survey.fromMap(i)).toList().cast<Survey>();
  //   } else if (page.name == "checklist") {
  //     return (list).map((i) => CheckList.fromMap(i)).toList().cast<CheckList>();
  //   } else if (page.name == "guest") {
  //     return (list)
  //         .map((i) => ClientReservation.fromMap(i))
  //         .toList()
  //         .cast<ClientReservation>();
  //   } else if (page.name == "guestselect") {
  //     return (list)
  //         .map((i) => ClientReservation.fromMap(i))
  //         .toList()
  //         .cast<ClientReservation>();
  //   } else if (page.name == "approval") {
  //     return (list).map((i) => Approval.fromMap(i)).toList().cast<Approval>();
  //   } else if (page.name == "callcenter") {
  //     return (list)
  //         .map((i) => CallCenter.fromMap(i))
  //         .toList()
  //         .cast<CallCenter>();
  //   } else if (page.name == "roomrack") {
  //     return (list).map((i) => Roomrack.fromMap(i)).toList().cast<Roomrack>();
  //   } else if (page.name == "reminder") {
  //     return (list).map((i) => Reminder.fromMap(i)).toList().cast<Reminder>();
  //   } else if (page.name == "message") {
  //     return (list).map((i) => Message.fromMap(i)).toList().cast<Message>();
  //   } else if (page.name == "handbook") {
  //     return (list).map((i) => Handbook.fromMap(i)).toList().cast<Handbook>();
  //   } else if (page.name == "whatsapptemplate") {
  //     return (list)
  //         .map((i) => WhatsAppTemplate.fromMap(i))
  //         .toList()
  //         .cast<WhatsAppTemplate>();
  //   } else if (page.name == "whatsappuser") {
  //     return (list)
  //         .map((i) => WhatsAppUser.fromMap(i))
  //         .toList()
  //         .cast<WhatsAppUser>();
  //   }
  // }

  void loadList(int pageKey) async {
    //stopTimer();
    isReady.value = false;
    Map<String, dynamic> parameters = {};

    try {
      if (page.name == "select" || page.name == "multiselect") {
        String? table;
        String? valueField;
        String? displayfield;

        table = Get.arguments[0];
        valueField = Get.arguments[1];
        displayfield = Get.arguments[2];

        parameters = {
          "_OFFSET": pageKey,
          "_NEXT": pageSize,
          "SEARCH": searchTextController.text,
          "ORDERBY": listOrderBy.value,
          "TABLE": table ?? "",
          "VALUEFIELD": valueField ?? "ID",
          "DISPLAYFIELD": displayfield ?? ""
        };
      } else {
        parameters = {
          "_OFFSET": pageKey,
          "_NEXT": pageSize,
          "SEARCH": searchTextController.text,
          "TAB": tabController == null
              ? 0
              : tabController!.index, // page.tabs![activeTab.value],
          "ORDERBY": listOrderBy.value,
          "SORT": page.sort.indexOf(listSort.value),
          "FILTERFIELD": listFilterField.value,
          "FILTERVALUE": listFilterValue.value
        };
      }

      var listResponse =
          await api.fetchList(page.name, page.baseObject, parameters);

      final isLastPage = listResponse.length < pageSize;

      if (isLastPage) {
        pagingController.appendLastPage(listResponse);
      } else {
        dynamic nextPageKey = pageKey + listResponse.length;
        pagingController.appendPage(listResponse, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }

    isReady.value = true;
    //startTimer();
  }

  Future summaryList() async {
    isReady.value = false;

    var list = await ApiService.get().execApi(
        "App${page.name.toUpperCase()}ListSum", page.baseObject, {});
    if (list.length > 0) {
      sumlist.assignAll(
          (list[0]).map((i) => Summary.fromMap(i)).toList().cast<Summary>());
    }
    if (list.length > 1 && (list[1].length > 0)) {
      sumlist1.assignAll(
          (list[1]).map((i) => Summary.fromMap(i)).toList().cast<Summary>());
    }

    isReady.value = true;

    openBottomSheet(
        summaryScreen(
            sumlist, sumlist1, appColors[page.name]!, handleTabChange),
        "Summary");
  }

  refreshList() {
    pagingController.refresh();
  }

  handleSearch() {
    refreshList();
  }

  handleSort(String value) {
    listSort.value = value;
    refreshList();
  }

  handleOrderBy() {
    listOrderBy.value = listOrderBy.value == "ASC" ? "DESC" : "ASC";
    refreshList();
  }

  handleClearSearch() {
    searchTextController.text = "";
    //pagingController.refresh();
    refreshList();
  }

  handleTabChange(int index) {
    activeTab.value = index;
    tabController!.index = index;
    refreshList();
  }

  handleEditForm(int id) async {
    var result = await Get.toNamed(
        '${AppRoutes.form}/${page.name}/$id');

    if (result ?? false) {
      refreshList();
    }
  }

  stopTimer() {
    listTimer?.cancel();
  }

  startTimer() {
    listTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
       pagingController.refresh();
    });
  }

  @override
  void onClose() {
    stopTimer();
    tabController?.dispose();
    pagingController.dispose();
    super.onClose();
  }
}
