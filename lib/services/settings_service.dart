import 'package:get/get.dart';
import 'package:opexq/services/storage_service.dart';

/// middle man service to deal with other service, like a central point
class SettingsService1 extends GetxService {
  static SettingsService1 get() => Get.find();

  late int tenantId;
  late String tenant;
  late String token;
  late String endPoint;
  late String country;
  late String logoUrl;
  late String version;

  late int userId;
  late String userName;
  late int companyId;
  late String company;
  late int departmentId;
  late String department;
  late String departmentGroup;
  late String registerId;
  late String email;
  late String picture;
  late String? allowNotification;
  late bool? darkTheme;
  late String lang;

  final storage = StorageService.get();

  // Future<SettingsService> init() async {
  //   refreshCache();
  //   return this;
  // }

  void clearCache() {
    // ImageWidget.clearMem();
    // ImageWidget.clearDisk();
    // api.memCacheInterceptor.clear();
    // api.getCacheInterceptor.clear();
  }

  void refreshCache() {
    tenantId = storage.tenantId;
    tenant = storage.tenant;

    token = storage.token;
    endPoint = storage.endPoint;
    country = storage.country;
    logoUrl = storage.logoUrl;
    version = storage.version;

    userId = storage.userId;
    userName = storage.userName;
    company = storage.company;
    companyId = storage.companyId;
    departmentId = storage.departmentId;
    department = storage.department;
    departmentGroup = storage.departmentGroup;
    registerId = storage.registerId;
    email = storage.email;
    picture = storage.picture;
    allowNotification = storage.allowNotification;
    darkTheme = storage.darkTheme;
    lang = storage.lang;
  }

  //void throwExceptionTest() => throw Exception("Testing an exception!");

  //void initFCM() => FirebaseService.get().initFCM();

  //void showLoadNotifications() => Get.dialog(TestNotificationDialog());

}
