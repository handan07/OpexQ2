import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:opexq/models/tasklog_model.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';

Widget taskLogList(ListController controller) {
  Widget listCard(TaskLog item) {
    return listCardContainer(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    textButton(
                      toTime(item.odate),
                      Colors.grey,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(formatDate(item.odate)),
                    const SizedBox(
                      height: 4,
                    ),
                  ]),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 6,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      item.state,
                      //"${item.place}",
                      style: headline5,
                      maxLines: 1,
                      minFontSize: 12,
                      //overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AutoSizeText(
                      item.ruser,
                      //"${item.place}",
                      style: subtitle1,
                      maxLines: 1,
                      minFontSize: 12,
                      //overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    item.subject == null
                        ? Container()
                        : AutoSizeText(
                            item.subject ?? "",
                            style: subtitle2,
                            maxLines: 2,
                            minFontSize: 10,
                          ),
                    const SizedBox(height: 8),
                    item.tdescription == null
                        ? Container()
                        : AutoSizeText(
                            item.tdescription ?? "",
                            style: bodyText1,
                            maxLines: 4,
                            minFontSize: 10,
                          ),
                    const SizedBox(height: 8),
                    item.pdate == null
                        ? Container()
                        : Text(
                            formatDate(item.pdate),
                            style: bodyText1,
                          ),
                  ]),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 2,
                child: Container(
                    padding: const EdgeInsets.all(0),
                    //color: grey,
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                        //radius: 45,
                        backgroundColor:
                            (item.filename == "" || item.filename == null)
                                ? lightgrey
                                : grey, //Color(0xffFDCF09),
                        child: (item.filename == "" || item.filename == null)
                            ? Container()
                            : GestureDetector(
                                onTap: () => openImage(item.filename),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      item.filename ?? "",
                                      fit: BoxFit.cover,
                                      width: 45.0,
                                      height: 45.0,
                                    )),
                              ))))
          ],
        ),
        color: lightgrey);
  }

  Widget listItem(item) {
    return listCard(item);
  }

  return listBody(controller: controller, itemWidget: listItem);
}
