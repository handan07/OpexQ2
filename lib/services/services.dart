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
    //await loadMenu();
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