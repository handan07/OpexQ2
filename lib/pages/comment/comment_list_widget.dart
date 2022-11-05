import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opexq/models/comment_model.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/pages/list/widgets/slidebackground_widget.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';

Widget commentList(ListController controller) {
  Widget listCard(Comment item) {
    return listCardContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  textButton(toTime(item.ctime), Colors.grey),
                  const SizedBox(
                    height: 8,
                  ),
                  AutoSizeText(
                    formatDate(item.cdate),
                    maxLines: 1,
                    minFontSize: 8,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF3F3FE),
                      ),
                      child: item.typeid == 1
                          ? const Icon(Icons.thumb_up_sharp,
                              color: Colors.green)
                          : item.typeid == 2
                              ? const Icon(Icons.thumb_down_alt_sharp,
                                  color: Colors.red)
                              : item.typeid == 3
                                  ? const Icon(Icons.comment,
                                      color: Colors.yellowAccent)
                                  : const Icon(Icons.comment,
                                      color: Colors.yellowAccent)),
                  const SizedBox(height: 4),
                  Text(item.type ?? ""),
                  const SizedBox(height: 4),
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
                    item.place == null
                        ? item.clientname ?? ""
                        : "${item.place ?? ""}-${item.clientname ?? ""}",
                    //"${item.place}",
                    style: headline5,
                    maxLines: 1,
                    minFontSize: 10,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(item.commentitem ?? "", style: subtitle1),
                  const SizedBox(height: 8),
                  AutoSizeText(
                    item.comment ?? "",
                    maxLines: 5,
                    style: bodyText1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ]),
          ),
          // const SizedBox(width: 8),
          // Expanded(
          //   flex: 2,
          //   child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: <Widget>[
          //         textButton(item.state ?? "", lightgrey,
          //             textColor: grey, onTap: () => {}),
          //       ]),
          // ),
        ],
      ),
    );
  }

  Widget listItem(item) {
    return Dismissible(
        key: Key(item.id.toString()),
        direction: DismissDirection.startToEnd,
        background: slideBackground(
            "left",
            "Edit",
            FontAwesomeIcons.commentDots,
            controller.page.color.withOpacity((6 + 2) / 10)),
        confirmDismiss: (direction) async {
          controller.handleEditForm(item.id);
          return false;
        },
        child: listCard(item));
  }

  return listBody(controller: controller, itemWidget: listItem);
}
