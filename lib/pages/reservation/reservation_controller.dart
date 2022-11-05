import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opexq/models/list_model.dart';
import 'package:opexq/models/reservation_model.dart';
import 'package:opexq/models/summary_model.dart';
import 'package:opexq/services/api_service.dart';
import 'package:opexq/utils/configuration.dart';

class ReservationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //int belongsTo = 0; // 0 All 1 My Dep 3 My Sub Dep 4 My Task

  late ListPage page;
  List<String> activeTabs = ["List", "Grid"].obs;

  late TextEditingController searchTextController;
  late TabController tabController;
  late ScrollController scrollController;

  var datalist = <Reservation>[].obs;
  var sumlist = <Summary>[].obs;
  var activeTab = 0.obs;
  int _offset = 0;
  String type = "sum";

  @override
  void onInit() {
    page = listPages.singleWhere((element) => element.name == "resource");
    searchTextController = TextEditingController(text: "");
    tabController = TabController(vsync: this, length: activeTabs.length);
    scrollController = ScrollController()..addListener(scrollListener);
    init();
    super.onInit();
  }

  void init() {
    activeTab.value = 0;
    tabController.index = 0;
    loadList();
  }

  goToTab(index) {
    Get.toNamed(page.listRoute, arguments: [page.name, sumlist[index].id]);
  }

  void loadList() async {
    final parameters = {
      "_OFFSET": 0,
      "_NEXT": 100,
      "SEARCH": searchTextController.text,
      "RESDATE": DateTime.now().toIso8601String(),
      "STATEID": activeTab.value,
      "TIMESLOTID": null,
    };

    var list = await ApiService.get()
        .execApi("ReservationList", "RESERVATION", parameters);
    if (activeTab == null) {
      sumlist = (list).map((i) => Summary.fromMap(i)).toList().cast<Summary>();
    } else {
      datalist = (list)
          .map((i) => Reservation.fromMap(i))
          .toList()
          .cast<Reservation>();
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

  goToList() {
    type = "list";
    loadList();
    Get.toNamed(page.listRoute);
  }

  handleSearch() {
    datalist.clear();
    loadList();
    //searchTextController.text = "";
  }

  handleClearSearch() {
    searchTextController.text = "";
    datalist.clear();
    loadList();
    //searchTextController.text = "";
  }

  handleTabChange(int index) {
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
    super.onClose();
  }
}
