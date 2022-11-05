import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/tableReservation/table_reservation_control.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/appbar_widget.dart';
import 'package:opexq/widgets/drawer_widget.dart';

class TableReservationHomeView extends StatelessWidget {
  final TableReservationController _controller =
      Get.put(TableReservationController());

  TableReservationHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.grey[100],
        appBar: AppBarApp(
          header: _controller.page.header,
          tabs: [],
        ),
        endDrawer: const DrawerWidget(),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: MediaQuery.of(context).size.width,
              //height: Get.height,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 16,
                    ),
                    // Obx(() => _controller.sumlist.isEmpty
                    //     ? Container()
                    //     : summaryGrid(_controller.page.name!,
                    //         _controller.sumlist, _controller.goToTab)),
                    Obx(() => ListTile(
                        onTap: () {
                          //   DatePicker.showDatePicker(context,
                          //       showTitleActions: true,
                          //       minTime: DateTime(2018, 3, 5), onChanged: (date) {
                          //     print('change $date in time zone ' +
                          //         date.timeZoneOffset.inHours.toString());
                          //   }, onConfirm: (date) {
                          //     _controller.resDate.value = date;
                          //     print(_controller.resDate);
                          //     print('confirm $date');
                          //   },
                          //       currentTime:
                          //           _controller.resDate.value, //DateTime.now(),
                          //       locale: LocaleType.tr);
                          // },
                        },
                        trailing: const Icon(
                          FontAwesomeIcons.calendarDay,
                          color: Colors.red,
                        ),
                        title: Text(
                          _controller.resDate.toString(),
                        ))),
                    Obx(() => _controller.alacarteList.isEmpty
                        ? Container()
                        : ListTile(
                            title: DropdownButton<int>(
                              value: _controller.alacarteId.value,
                              onChanged: (e) {
                                _controller.alacarteId.value = e ?? 0;
                                _controller.filteredTimeSlotItems();
                              },
                              items: _controller.alacarteList
                                  .map((item) => DropdownMenuItem(
                                        value: item.id,
                                        child: Text(parseString(item.text)),
                                      ))
                                  .toList(),
                            ),
                            trailing: const Icon(FontAwesomeIcons.faceFrownOpen),
                          )),
                    Obx(() => _controller.timeSlotListFiltered.isEmpty
                        ? Container()
                        : ListTile(
                            title: DropdownButton<int>(
                              value: _controller.timeSlotListFiltered[0].id,
                              onChanged: (e) {
                                _controller.timeSlotId.value = e ?? 0;
                              },
                              items: _controller.timeSlotListFiltered
                                  .map((item) => DropdownMenuItem(
                                        value: item.id,
                                        child: AutoSizeText(
                                            parseString(item.text),
                                            maxLines: 1),
                                      ))
                                  .toList(),
                            ),
                            trailing: const Icon(FontAwesomeIcons.clock),
                          )),
                    const SizedBox(height: 8),
                  ])),
        ),
        bottomNavigationBar: summaryBottomBar());
  }

  GestureDetector summaryBottomBar() {
    return GestureDetector(
      onTap: () {
        _controller.type = "list";
        _controller.loadList();
        Get.toNamed(_controller.page.listRoute != ""
            ? _controller.page.listRoute
            : "/");
      },
      child: Container(
        decoration: BoxDecoration(
          color: appColors[_controller.page.name],
        ),
        padding: const EdgeInsets.all(16),
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _controller.page.header.tr,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              height: 40,
              width: 40,
              child: const Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
