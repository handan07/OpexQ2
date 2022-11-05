import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/reservation/reservation_controller.dart';
import 'package:opexq/widgets/appbar_widget.dart';
import 'package:opexq/widgets/drawer_widget.dart';

class ReservationHomeView extends StatelessWidget {
  final ReservationController _controller = Get.put(ReservationController());

  ReservationHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.grey[100],
        appBar: AppBarApp(
          header: _controller.page.header,
          tabs: const [],
        ),
        endDrawer: const DrawerWidget(),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: MediaQuery.of(context).size.width,
              //height: Get.height,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    // Obx(() => summaryGrid(_controller.page.name!,
                    //     _controller.sumlist, _controller.goToTab)),
                  ])),
        ));
    //bottomNavigationBar: summaryBottomBar(_controller.page));
  }
}
