import 'package:get/get.dart';
import 'package:opexq/data/menu_data.dart';
import 'package:opexq/models/menu_model.dart';
import 'package:opexq/utils/utils.dart';

class MenuController extends GetxController {
  var selectedMenuId = 0.obs;
  dynamic selectedBottomItem;
  late var item = Menu().obs;
  int id = 0;
  var loaded = 0.obs;
  bool ready = false;
  var userName = "".obs;
  var dataList = <Menu>[].obs;

  @override
  void onReady() {
    handleMenu();
    super.onReady();
  }

  findMenu() {}

  handleMenu() {
    id = toInt(Get.parameters["id"]);
    if (id == 0) id = 1;
    if (menuData.isNotEmpty) {
      item.value = menuData.singleWhere((element) => element.id == id);
    } else {}
  }

  // void openDrawer(GlobalKey<ScaffoldState> key) {
  //   key.currentState?.openEndDrawer();
  // }

  // void closeDrawer(GlobalKey<ScaffoldState> key) {
  //   key.currentState?.openEndDrawer();
  // }
}
