// ignore_for_file: must_call_super

import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:opexq/controllers/app_controller.dart';
import 'package:opexq/utils/utils.dart';

class StorageService extends GetxService {
  static StorageService get() => Get.find();

  String? languageCode;
  String? countryCode;
  late GetStorage box;

  int get tenantId => toInt(box.read(StorageKeys.tenantId));
  set tenantId(int value) => writeStorage(StorageKeys.tenantId, value);

  String get tenant => box.read(StorageKeys.tenant) ?? "";
  set tenant(String value) => writeStorage(StorageKeys.tenant, value);

  String get token => box.read(StorageKeys.token) ?? "";
  set token(String value) => writeStorage(StorageKeys.token, value);

  String get lang => box.read(StorageKeys.lang) ?? "tr";
  set lang(String value) => writeStorage(StorageKeys.lang, value);

  String get endPoint => box.read(StorageKeys.endPoint) ?? "";
  set endPoint(String value) => writeStorage(StorageKeys.endPoint, value);

  String get country => box.read(StorageKeys.country) ?? "";
  set country(String value) => writeStorage(StorageKeys.country, value);

  String get logoUrl => box.read(StorageKeys.logoUrl) ?? "";
  set logoUrl(String value) => writeStorage(StorageKeys.logoUrl, value);

  String get version => box.read(StorageKeys.version) ?? "";
  set version(String value) => writeStorage(StorageKeys.version, value);

  int get userId => toInt(box.read(StorageKeys.userId));
  set userId(int value) => writeStorage(StorageKeys.userId, value);

  String get userName => box.read(StorageKeys.userName) ?? "";
  set userName(String value) => writeStorage(StorageKeys.userName, value);

  int get companyId => toInt(box.read(StorageKeys.companyId));
  set companyId(int value) => writeStorage(StorageKeys.companyId, value);

  String get company => box.read(StorageKeys.company) ?? "";
  set company(String value) => writeStorage(StorageKeys.company, value);

  int get departmentId => toInt(box.read(StorageKeys.departmentId));
  set departmentId(int value) => writeStorage(StorageKeys.departmentId, value);

  String get department => box.read(StorageKeys.department) ?? "";
  set department(String value) => writeStorage(StorageKeys.department, value);

  String get departmentGroup => box.read(StorageKeys.departmentGroup) ?? "";
  set departmentGroup(String value) =>
      writeStorage(StorageKeys.departmentGroup, value);

  String get registerId => box.read(StorageKeys.registerId) ?? "";
  set registerId(String value) => writeStorage(StorageKeys.registerId, value);

  String get email => box.read(StorageKeys.email) ?? "";
  set email(String value) => writeStorage(StorageKeys.email, value);

  String get picture => box.read(StorageKeys.picture) ?? "";
  set picture(String value) => writeStorage(StorageKeys.picture, value);

  String get allowNotification =>
      box.read(StorageKeys.allowNotification) ?? "true";
  set allowNotification(String value) =>
      writeStorage(StorageKeys.allowNotification, value);

  bool get darkTheme => box.read(StorageKeys.darkTheme) ?? false;
  set darkTheme(bool value) => writeStorage(StorageKeys.darkTheme, value);

  Future<StorageService> init() async {
    box = GetStorage();
    await box.initStorage;

    findAppLocale();
    languageCode = box.read(StorageKeys.lang);
    countryCode = box.read(StorageKeys.country);

    box.listenKey("lang", (value) {
    //   //initializeDateFormatting(Get.locale?.languageCode ?? "en");
        languageCode = value.toLowerCase();
        updateLocale(value.toLowerCase());
    });
    return this;
  }

  writeStorage(String key, dynamic value) {
    if (value != null) box.write(key, value);
  }

  readStorage(String key) => box.read(key);

  void deleteStorage(String key) => box.remove(key);

  void clearStorage() => box.erase();

  Future findAppLocale() async {
    // Get.deviceLocale with problem in iOS
    // Not return countryCode, only return languageCode
    // On the first load of the Application
    // (flutter problem, not GetX)
    final String? appLocale = readStorage("lang");
    if (appLocale == "" || appLocale == null) {
      var deviceLocale = Get.deviceLocale;
      if (deviceLocale!.languageCode == "tr") {
        writeStorage(StorageKeys.lang, "tr");
      } else {
        writeStorage(StorageKeys.lang, "en");
      }
    }
  }

  String userLocale() {
    String? userLocale = readStorage(StorageKeys.lang);
    if (userLocale == null) {
      return readStorage(StorageKeys.lang).toString();
    } else {
      return userLocale;
    }
  }

  void updateLocale(String locale) {
    if (locale.toLowerCase() == "tr") {
      Get.updateLocale(const Locale('tr', 'TR'));
      initializeDateFormatting('tr_TR', null);
    } else if (locale.toLowerCase() == "de") {
      Get.updateLocale(const Locale('de', 'DE'));
      initializeDateFormatting('tr_TR', null);
    } else if (locale.toLowerCase() == "ru") {
      initializeDateFormatting('tr_TR', null);
      Get.updateLocale(const Locale('ru', 'RU'));
    } else {
      initializeDateFormatting('tr_TR', null);
      Get.updateLocale(const Locale('en', 'UK'));
    }
    AppController controller = Get.find();
    controller.loadMenu();
    Get.offAllNamed("/");
  }
}

// storage keys.
abstract class StorageKeys {
  static const String tenantId = "tenantId";
  static const String tenant = "tenant";
  static const String token = "token";
  static const String lang = "lang";
  static const String endPoint = "endPoint";
  static const String country = "country";
  static const String logoUrl = "logoUrl";

  static const String registerId = "registerId";
  static const String userId = "userId";
  static const String userName = "userName";
  static const String userCode = "userCode";
  static const String email = "email";
  static const String companyId = "companyId";
  static const String company = "company";
  static const String department = "department";
  static const String departmentId = "departmentId";
  static const String departmentGroup = "departmentGroup";
  static const String picture = "picture";
  static const String version = "version";

  static const String allowNotification = "allowNotification";
  static const String darkTheme = "darkTheme";
}
