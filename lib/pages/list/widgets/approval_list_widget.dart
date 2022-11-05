import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/pages/list/widgets/slidebackground_widget.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';

Widget approvalList(ListController controller) {
  Widget listCard(dynamic item) {
    return listCardContainer(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    item.processname,
                    style: headline5,
                    maxLines: 1,
                    minFontSize: 14,
                  ),
                  const SizedBox(height: 4),
                  Text(item.requestedby, style: subtitle2),
                  const SizedBox(height: 4),
                  AutoSizeText(
                    item.explanation ?? "",
                    style: bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 12,
                  ),
                  const SizedBox(height: 4),
                  Text("${formatDateTime(item.requestdate)} #${item.id}",
                      style: const TextStyle(
                          fontSize: 12, fontStyle: FontStyle.italic)),
                ],
              )),
          const SizedBox(width: 8),
          Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.link),
                        onPressed: () => print("dcsdsa")),
                    textButton(
                      item.state,
                      lightgrey,
                    ),
                  ]))
        ]));
  }

  Widget listItem(item) {
    return Dismissible(
        key: Key(item.id.toString()),
        direction: DismissDirection.startToEnd,
        background: slideBackground("left", "Edit", FontAwesomeIcons.penToSquare,
            controller.page.color.withOpacity((6 + 2) / 10)),
        //secondaryBackground: slideLeftBackground(),
        confirmDismiss: (direction) async {
          controller.handleEditForm(item.id);
          return false;
        },
        child: listCard(item));
  }

  return listBody(controller: controller, itemWidget: listItem);
}
