import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/reservation_model.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_master_widget.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';
import 'package:opexq/widgets/widgets.dart';

class ReservationListView extends StatelessWidget {
  final ListController _controller = Get.find();

  ReservationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListMasterScreen(
      controller: _controller,
      child: Obx(
        () => _controller.datalist.isEmpty
            ? noData()
            : ListView.builder(
                itemCount: _controller.datalist.length,
                itemBuilder: (context, index) {
                  return itemWidget(_controller.datalist[index]);
                }),
      ),
    );
  }

  Widget itemWidget(Reservation item) {
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
                      textButton(item.state, Colors.grey.shade400),
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
              textButton(item.state, taskColors[item.stateid], onTap: () => {}),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        icon: const Icon(FontAwesomeIcons.cameraRetro),
                        iconSize: 24,
                        color: Colors.grey[600],
                        onPressed: () => openImage(item.specialrequest)),
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
                onPressed: () => {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
