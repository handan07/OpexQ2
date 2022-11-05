import 'package:get/get.dart';
import 'package:opexq/controllers/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put<LifeCycleController>(LifeCycleController(), permanent: true);
    Get.put<AppController>(AppController(), permanent: true);
    //Get.put<MenuController>(MenuController(), permanent: true);
    //Get.put<LoginController>(LoginController(), permanent: true);
  }
}
