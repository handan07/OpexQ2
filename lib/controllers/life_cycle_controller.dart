import 'dart:io';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:opexq/services/api_service.dart';

class LifeCycleController extends SuperController {
  @override
  void onInit() {
    addStateLog("init");
    super.onInit();
  }

  @override
  void onDetached() {
    addStateLog("detached");
  }

  @override
  void onInactive() {
    addStateLog("inactive");
  }

  @override
  void onPaused() {
    //background
    addStateLog("paused");
  }

  @override
  void onResumed() {
    addStateLog("resumed");
  }

  addStateLog(String state) {
    Map<String, dynamic> parameters = {};
    parameters["STATE"] = state;
    parameters["PLATFORM"] = Platform.isIOS ? "IOS" : "ANDROID";

    ApiService.get().execApiToken(
        "GuestAppLifecycleState", "GUESTAPP_LIFECYCLESTATE", parameters);
  }

  // Future getDeviceInfo() async {
  //   final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  //   Map<String, dynamic> _deviceData = <String, dynamic>{};

  //   try {
  //     if (Platform.isAndroid) {
  //       AndroidDeviceInfo deviceData = await deviceInfoPlugin.androidInfo;
  //       print(deviceData);
  //     } else if (Platform.isIOS) {
  //       IosDeviceInfo deviceData = await deviceInfoPlugin.iosInfo;
  //       print(deviceData);
  //     }
  //   } catch (exp) {
  //     //print(exp);
  //   }
  // }
}
