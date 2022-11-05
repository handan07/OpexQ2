import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:opexq/services/storage_service.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/widgets/appbar_widget.dart';
import 'package:opexq/widgets/button_widgets.dart';

class LogoutView extends StatelessWidget {
  const LogoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StorageService.get().deleteStorage("token");
    return Scaffold(
        appBar: const AppBarApp(header: "Logout", tabs: []),
        body: Column(children: <Widget>[
          const SizedBox(height: 16),
          Expanded(
            flex: 2,
            child: Lottie.asset('assets/lottie/bye-bye.json',
                width: 250, height: 250),
          ),
          Expanded(
            child: Center(
              child: Text('Hope to see you soon'.tr,
                  style: Theme.of(context).textTheme.headline5),
            ),
          ),
          const Spacer(),
        ]),
        floatingActionButton: circleButton(
          icon: FontAwesomeIcons.lock,
          onTap: () => Get.toNamed(AppRoutes.login),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked);
  }
}
