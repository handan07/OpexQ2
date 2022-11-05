import 'package:get/get.dart';
import 'package:opexq/models/menu_model.dart';
import 'package:opexq/utils/utils.dart';

class HomeController extends GetxController {
  var datalist = <Menu>[].obs;
  var isOpened = false.obs;

  @override
  void onReady() {
    init();
    super.onReady();
  }

  void init() async {
    List<Menu> menuList = [
      Menu(
          id: 1,
          title: "Tasks",
          type: "Button",
          route: "taskList",
          icon: "format_list_numbered"),
      Menu(
          id: 1,
          title: "Comments",
          type: "Button",
          route: "commentList",
          icon: "comment"),
      Menu(
          id: 1,
          title: "Lost&Found",
          type: "Button",
          route: "lostList",
          icon: "accessibility"),
      Menu(
          id: 1,
          title: "Guests",
          type: "Button",
          route: "guestList",
          icon: "people"),
      Menu(
          id: 1,
          title: "Roomrack",
          type: "Button",
          route: "roomrack",
          icon: "hotel"),
      Menu(
          id: 1,
          title: "Dashboard",
          type: "Button",
          route: "dashboard",
          icon: "hotel")
    ];
    datalist.assignAll(menuList);
  }

  navigationItemTap(id) {
    String pageName = "";
    if (id == 0) {
      pageName = "reminder";
    } else if (id == 1) {
      pageName = "message";
    } else if (id == 2) {
      pageName = "handbook";
    } else if (id == 3) {
      pageName = "dashBoard";
    }
    goToList(pageName);
  }
}
