import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opexq/models/list_model.dart';
import 'package:opexq/models/lookupitem_model.dart';
import 'package:opexq/models/summary_model.dart';
import 'package:opexq/models/table_reservation_model.dart';
import 'package:opexq/services/api_service.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';

class TableReservationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late ListPage page;
  List<String> activeTabs = ["Grid", "List"].obs;

  late TextEditingController searchTextController;
  late TabController tabController;
  late ScrollController scrollController;

  var datalist = <TableReservation>[].obs;
  var sumlist = <Summary>[].obs;
  var activeTab = 0.obs;
  int _offset = 0;
  String type = "sum";

  var alacarteId = 0.obs;
  var timeSlotId = 0.obs;
  var resDate = DateTime.now().obs;
  var alacarteList = <LookupItem>[].obs;
  var timeSlotList = <TimeSlot>[].obs;
  var timeSlotListFiltered = <LookupItem>[].obs;

  @override
  void onInit() {
    page = listPages.singleWhere((element) => element.name == "table");
    searchTextController = TextEditingController(text: "");
    tabController = TabController(vsync: this, length: activeTabs.length);
    scrollController = ScrollController()..addListener(scrollListener);
    init();
    super.onInit();
  }

  void init() async {
    alacarteList.addAll(await lookupItems("ALACARTE", "RNAME"));
    alacarteId.value = alacarteList[0].id!;
    await lookupTimeSlotItems();
    await filteredTimeSlotItems();

    loadList();
  }

  Future lookupItems(String table, String field) async {
    final List<LookupItem> itemList = [];
    var list = await ApiService.get()
        .selectApi(table, select: ["ID", field], itemsPerPage: 1000);
    if (list != null) {
      for (var i = 0; i < list.length; i++) {
        itemList.add(LookupItem(list[i]["ID"], list[i][field]));
      }
    }
    return itemList;
  }

  void loadList() async {
    final parameters = {
      "_OFFSET": _offset,
      "_NEXT": 100,
      "SEARCH": searchTextController.text,
      "TYPE": type,
      "STATEID": type == "sum" ? null : activeTab.value,
      "ALACARTEID": alacarteId.value,
      "RESDATE": resDate.value.toIso8601String(),
      "TIMESLOTID": null
    };

    var list = await ApiService.get().execApi(
        "AlacarteReservationSelect", "ALACARTE_RESERVATION", parameters);
    if (type == "sum") {
      sumlist = (list).map((i) => Summary.fromMap(i)).toList().cast<Summary>();
    } else {
      datalist = (list)
          .map((i) => TableReservation.fromMap(i))
          .toList()
          .cast<TableReservation>();
    }
  }

  goToTab(index) {
    Get.toNamed(page.listRoute, arguments: [page.name, sumlist[index].id]);
  }

  Future lookupTimeSlotItems() async {
    var list = await ApiService.get().selectApi("ALACARTE_TIMESLOT",
        select: ["ID", "STARTTIME", "ENDTIME"],
        orderBy: [
          {"Column": "STARTTIME", "Direction": null}
        ],
        itemsPerPage: 1000);
    if (list != null) {
      timeSlotList.addAll(
          (list).map((i) => TimeSlot.fromMap(i)).toList().cast<TimeSlot>());
    }
  }

  Future filteredTimeSlotItems() async {
    timeSlotListFiltered.clear();
    for (var i = 0; i < timeSlotList.length; i++) {
      if (timeSlotList[i].alacarteid == alacarteId.value) {
        timeSlotListFiltered.add(LookupItem(
            timeSlotList[i].id ?? 0,
            "${toTime(timeSlotList[i].starttime!)} ${toTime(timeSlotList[i].endtime!)}"));
      }
    }
  }

  void loadMore() async {
    _offset = _offset + 1;
    loadList();
  }

  void refreshList() async {
    datalist.clear();
    loadList();
  }

  handleSearch() {
    datalist.clear();
    loadList();
  }

  handleClearSearch() {
    searchTextController.text = "";
    datalist.clear();
    loadList();
  }

  handleActionChange(int groupId) {
    tabController = TabController(vsync: this, length: activeTabs.length);
    loadList();
  }

  handleTabChange(int index) {
    activeTab.value = index;
    loadList();
  }

  void scrollListener() {
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels) {
      loadMore();
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
