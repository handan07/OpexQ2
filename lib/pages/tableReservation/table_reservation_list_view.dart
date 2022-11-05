import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/table_reservation_model.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_master_widget.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';
import 'package:opexq/widgets/widgets.dart';

class TableReservationListView extends StatelessWidget {
  final ListController _controller = Get.find();

  TableReservationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListMasterScreen(
      controller: _controller,
      child:
          Obx(() => _controller.activeTab.value == 1 ? listBody() : gridBody()),
    );
  }

  Widget body() {
    return _controller.listType.value == "list" ? listBody() : gridBody();
  }

  Widget listBody() {
    return ListView.builder(
        itemCount: _controller.datalist.length,
        itemBuilder: (context, index) {
          return itemWidget(_controller.datalist[index]);
        });
  }

  Widget gridBody() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                2), // kaç surun olsun . örnekte 2 stundan olusan liste olacak
        itemCount: _controller.datalist.length, //listenin uzunluğu
        itemBuilder: (BuildContext context, index) {
          return itemWidget(_controller.datalist[index]);
        });
  }

  Widget itemWidget(TableReservation item) {
    return listCardContainer(
      Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      textButton(item.tableno, Colors.grey.shade400),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Today")
                    ]),
              ),
              // SizedBox(
              //   width: 8,
              // ),
              Expanded(
                flex: 5,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${item.state}",
                        style: headline6,
                        //overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(parseString(item.clientname), style: subtitle1),
                      const SizedBox(height: 8),
                      Container(
                        constraints: BoxConstraints(maxWidth: Get.width - 150),
                        child: Text(parseString(item.place),
                            softWrap: true, style: bodyText1),
                      ),
                    ]),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          greyline(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              textButton(item.state, taskColors[item.stateid],
                  onTap: () => showChangeStateDialog(item)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        icon: const Icon(FontAwesomeIcons.cameraRetro),
                        iconSize: 24,
                        color: Colors.grey[600],
                        onPressed: () => openImage(item.clientname)),
                    const SizedBox(
                      width: 12,
                    ),
                    Icon(Icons.menu, size: 24, color: Colors.grey[600]),
                    const SizedBox(
                      width: 12,
                    ),
                  ]),
              IconButton(
                icon: const Icon(Icons.menu),
                iconSize: 24,
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  // void showTaskMenu(Approval item) {
  //   Get.bottomSheet(Container(
  //     decoration: BoxDecoration(
  //         color: Colors.white, borderRadius: BorderRadius.circular(16)),
  //     child: Wrap(
  //       clipBehavior: Clip.none,
  //       children: <Widget>[
  //         Align(
  //           alignment: Alignment.topCenter,
  //           child: Icon(Icons.arrow_drop_down, size: 30),
  //         ),
  //         ListTile(
  //             leading: Icon(FontAwesomeIcons.newspaper),
  //             title: Text("Show Detail"),
  //             onTap: () => {}),
  //         greyLine(),
  //         ListTile(
  //           leading: Icon(FontAwesomeIcons.shoePrints),
  //           title: Text("Show History"),
  //           onTap: () => {},
  //         ),
  //         greyLine(),
  //         ListTile(
  //           leading: Icon(FontAwesomeIcons.listAlt),
  //           title: Text("Show Sub Tasks"),
  //           onTap: () => {},
  //         ),
  //         greyLine(),
  //         ListTile(
  //           leading: Icon(FontAwesomeIcons.book),
  //           title: Text("Show Tooltips"),
  //           onTap: () => {},
  //         ),
  //         greyLine(),
  //         ListTile(
  //           leading: Icon(FontAwesomeIcons.commentDots),
  //           title: Text("Add message"),
  //           onTap: () => {},
  //         ),
  //         greyLine(),
  //         ListTile(
  //           leading: Icon(FontAwesomeIcons.star),
  //           title: Text("Follow"),
  //           onTap: () => {},
  //         ),
  //         greyLine(),
  //         SizedBox(height: 100),
  //       ],
  //     ),
  //   ));
  // }

  void showChangeStateDialog(TableReservation item) {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Wrap(
        clipBehavior: Clip.none,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.all(26),
              color: Colors.grey[400],
              width: 100,
              height: 5,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Change Task State",
              style: subtitle1,
            ),
            //height: 50,
          ),
          greyline(),
          ListTile(
              leading: const Icon(FontAwesomeIcons.locationArrow),
              title: Text(item.state ?? ""),
              onTap: () => {}),
          ListTile(
            leading: const Icon(Icons.videocam),
            title: Text(item.tableno ?? ""),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.videocam),
            title: Text(parseString(item.place)),
            onTap: () => {},
          ),
          greyline(),
          const SizedBox(height: 100),
        ],
      ),
    ));
  }
}
