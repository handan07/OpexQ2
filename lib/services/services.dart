import 'dart:convert';

import 'package:get/get.dart';
import 'package:opexq/services/api_service.dart';
import 'package:opexq/services/storage_service.dart';

import '../data/menu_data.dart';
import '../models/menu_model.dart';
import '../utils/dictionary.dart';
import '../utils/utils.dart';

abstract class AppServices {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    //await Get.putAsync(() => SettingsService().init());
    await Get.putAsync(() => ApiService().init());
    Get.put(Dictionary());
  //await loadDictionary();
    await loadMenu();
    // await Get.put(ApiCacheService()).init();
    //await Get.put(SessionService()).init();

    /// request for notifications permissions.
    //await FirebaseService.get().initFCM();

    //_initRepositories();
  }

  // static void _initRepositories() {
  //   /// if we need repositories, register here.
  //   Get.lazyPut(() => HomeRepo());
  // }
}

loadMenu() async {
  ApiRequest execRequest = ApiRequest(
      action: "Execute",
      object: "AppMenu",
      baseObject: "STDAPPMENUQ",
      parameters: {});
  ApiResponse response =
      await Get.find<ApiService>().httpPostApiToken(execRequest);
  if (response.success) {
    List list;
    if (response.resultSets!.isNotEmpty) {
      list = response.resultSets![0];
      if (list.isNotEmpty) {
        menuData = (list).map((i) => Menu.fromMap(i)).toList().cast<Menu>();
      } else {
        showAlert("Menu data is empty");
      }
    }

    if (response.resultSets!.length > 1) {
      list = response.resultSets![1];
      if (list.isNotEmpty) {
        Map<String, dynamic> language = jsonDecode(list[0]["VALUE"]);
        Map<String, String> language1 =
            language.map((key, value) => MapEntry(key, value!.toString()));
        Map<String, Map<String, String>> map = {
          Get.find<ApiService>().box.lang: language1
        };
        Get.find<Dictionary>().map = map;
        Get.clearTranslations();
        Get.addTranslations(map);
      } else {
        showAlert("Dictionary data is empty");
      }
    }
  }
}
