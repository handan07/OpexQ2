import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:opexq/models/list_model.dart';
import 'package:opexq/models/roomrack_model.dart';
import 'package:opexq/services/api_service.dart';
import 'package:opexq/utils/configuration.dart';

class RoomrackEditController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late ListPage page;
  List<String> activeTabs = ["List", "Grid"].obs;

  late TextEditingController searchTextController;
  late TabController tabController;
  late ScrollController scrollController;

  var datalist = <Roomrack>[].obs;
  var activeTab = 0.obs;
  int _offset = 0;

  @override
  void onInit() {
    page = listPages.singleWhere((element) => element.name == "roomrack");
    searchTextController = TextEditingController(text: "");
    tabController = TabController(vsync: this, length: activeTabs.length);
    scrollController = ScrollController()..addListener(scrollListener);
    init();
    super.onInit();
  }

  void init() {
    loadList();
  }

  void loadList() async {
    final parameters = {
      "_OFFSET": _offset,
      "_NEXT": 100,
      "SEARCH": searchTextController.text,
      "STATEID": 1
    };

    var list =
        await ApiService.get().execApi("RoomrackApp", "Roomrack", parameters);
    datalist = (list).map((i) => Roomrack.fromMap(i)).toList().cast<Roomrack>();
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
    //searchTextController.text = "";
  }

  handleClearSearch() {
    searchTextController.text = "";
    datalist.clear();
    loadList();
    //searchTextController.text = "";
  }

  handleActionChange(int groupId) {
    tabController = TabController(vsync: this, length: activeTabs.length);
    loadList();
  }

  handleTabChange(int index) {
    activeTab.value = index;
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
