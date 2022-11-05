import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:opexq/models/list_model.dart';
import 'package:opexq/models/summary_model.dart';
import 'package:opexq/pages/list/widgets/summary_widget.dart';
import 'package:opexq/services/api_service.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';

class FormController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var id = 0;
  var isReady = false.obs;
  Map<String, dynamic> formData = {};
  List<Summary> sumlist = <Summary>[].obs;
  List<Summary> sumlist1 = <Summary>[].obs;
  String imageLink = "";

  List<bool> bottomNavigationItemStatus = [true, false, false, false];

  TabController? tabController;
  late ListPage page;
  var activeTab = 0.obs;
  late GlobalKey<FormBuilderState> formKey;
  final api = Get.find<ApiService>();

  @override
  void onInit() {
    findPage();
    super.onInit();
  }

  @override
  void onReady() {
    handleLoad();
    super.onReady();
  }

  void findPage() {
    formKey = GlobalKey<FormBuilderState>();
    if (Get.parameters["page"] != null) {
      String pageName = Get.parameters["page"] ?? "";
      page = listPages.firstWhere((element) => element.name == pageName);
      if (page.editTabs.isNotEmpty) {
        tabController =
            TabController(vsync: this, length: page.editTabs.length);
        activeTab.value = toInt(Get.parameters["tab"]);
        tabController?.index = activeTab.value;
      }
    } else {
      Get.toNamed("/notfound");
    }
  }

  handleLoad() async {
    isReady.value = false;
    formData.clear();
    Get.arguments?.forEach((f, v) => formData[f] = v);
    id = toInt(Get.parameters["id"]);
    if (id == 0) {
      Get.arguments?.forEach((f, v) => formData[f] = v);
      //formData = page.initialvalue;
    } else {
      Map<String, dynamic> parameters = {"ID": id};
      if (Get.arguments != null) {
        String? filterField = Get.arguments["filterField"];
        String? filterValue = Get.arguments["filterValue"];
        if (filterValue != null && filterField != null) {
          parameters
              .addAll({"FILTERFIELD": filterField, "FILTERVALUE": filterValue});
        }
      }
      formData = await api.formSelect(page.name, page.baseObject, parameters);
    }
    isReady.value = true;
  }

  handleSave() async {
    if (formKey.currentState?.saveAndValidate() == true) {
      debugPrint(formKey.currentState!.value.toString());
      formData.addAll(formKey.currentState!.value);
      bool result;
      if (id == 0) {
        result = await api.formInsert(page.name, page.baseObject, formData);
      } else {
        result = await api.formUpdate(page.name, page.baseObject, id, formData);
      }
      if (result) {
        Get.back(result: true);
      }
    }
  }

  handleTabChange(int index) {
    activeTab.value = index;
  }

  clearFormValue(String fieldName) {
    formData[fieldName] = null;
    formKey.currentState!.fields[fieldName]?.didChange(null);
  }

  Future summaryList() async {
    isReady.value = false;

    var list = await ApiService.get().execApi(
        "App${page.name.toUpperCase()}EditSum",
        page.baseObject,
        {"ID": id});
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

  @override
  void onClose() {
    formData.clear();
    formKey.currentState?.reset();
    tabController?.dispose();
    super.onClose();
  }

  navigationItemTap(id) {
    if (id == 1) {
      Get.toNamed(AppRoutes.imageList);
    } else if (id == 2) {
      Get.toNamed(AppRoutes.profile);
    }
  }
}
