import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/navigation_model.dart';
import 'package:opexq/pages/home/home_controller.dart';
import 'package:opexq/pages/home/widgets/bottom_menu.dart';
import 'package:opexq/pages/home/widgets/menu_grid.dart';
import 'package:opexq/services/storage_service.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';
import 'package:opexq/widgets/drawer_widget.dart';
import 'package:opexq/widgets/new_menu_bottomsheet.dart';

class HomeView extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  HomeView({Key? key}) : super(key: key);

  final List<NavigationItem> navigationItems = [
    //Reminder
    NavigationItem(appIcons["reminder"]!, 0),
    //Nofitications
    NavigationItem(appIcons["message"]!, 1),
    //Handbook
    NavigationItem(appIcons["handbook"]!, 2),
    //DashBoard
    NavigationItem(appIcons["dashboard"]!, 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 5.0,
          leadingWidth: 40.0,
          toolbarHeight: 75,
          title: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.profile),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                CircleAvatar(
                    child: StorageService.get().picture == ""
                        ? Image.asset("assets/images/login.png")
                        : Image.network(StorageService.get().picture)),
                const SizedBox(width: 10),
                Expanded(
                  child: AutoSizeText(
                    "Hello".trArgs([StorageService.get().userName]),
                    maxLines: 1,
                    //minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: grey),
                  ),
                ),
              ]
                  //trailing: const Icon(FontAwesomeIcons.user),
                  ),
            ),
          ),

          // title: GestureDetector(
          //     onTap: () => Get.toNamed(AppRoutes.home),
          //     child: AutoSizeText("Home".tr,
          //         maxLines: 1,
          //         style: const TextStyle(
          //             fontSize: 28,
          //             color: Colors.black87,
          //             fontWeight: FontWeight.w300))),
          //centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black87, size: 24),
        ),
        endDrawer: const DrawerWidget(),
        body: Column(children: <Widget>[
          Expanded(child: menuGrid()),
        ]),
        floatingActionButton: circleButton(
            icon: FontAwesomeIcons.plus,
            onTap: () => openBottomSheet(newMenubottomSheet(), "Quick New")),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: bottomNavigationBar(
            _controller.navigationItemTap, navigationItems));
  }
}

// Widget userWidget() {
//   return ListTile(
//     onTap: () => Get.toNamed(AppRoutes.profile),
//     title: AutoSizeText("Hello".trArgs(["Handan"])),
//     leading: CircleAvatar(child: Image.asset("assets/images/login.png")),
//     trailing: const Icon(FontAwesomeIcons.user),
//   );
// }
