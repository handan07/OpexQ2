import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/widgets/appbar_widget.dart';
import 'package:opexq/widgets/button_widgets.dart';
import 'package:opexq/widgets/drawer_widget.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarApp(header: "Unknown Page", tabs: []),
        endDrawer: const DrawerWidget(),
        body: Column(children: <Widget>[
          const SizedBox(height: 16),
          Expanded(
            flex: 2,
            child: Lottie.asset('assets/lottie/error404.json',
                width: 250, height: 250),
          ),
          Expanded(
            child: Center(
              child: Text('Unknown page'.tr,
                  style: Theme.of(context).textTheme.headline5),
            ),
          ),
          const Spacer(),
        ]),
        floatingActionButton: circleButton(
            icon: FontAwesomeIcons.house,
            onTap: () => Get.toNamed(AppRoutes.home),
            color: kPrimaryColor),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
