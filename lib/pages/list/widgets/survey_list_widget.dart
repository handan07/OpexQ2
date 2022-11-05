import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/comment_model.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/pages/list/widgets/slidebackground_widget.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/widgets/button_widgets.dart';

Widget surveyList(ListController controller) {
  Widget listCard(Comment item) {
    return listCardContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("${item.place ?? ""} - ${item.clientname ?? ""}",
                      overflow: TextOverflow.ellipsis,
                      style: Get.theme.textTheme.headline5),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(item.survey ?? "", style: subtitle1),
                  const SizedBox(height: 8),
                  Container(
                    constraints: BoxConstraints(maxWidth: Get.width - 150),
                    child: Text(item.comment ?? "",
                        softWrap: true, style: bodyText1),
                  )
                ]),
          ),
          const SizedBox(width: 8),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF3F3FE),
                    ),
                    child: item.typeid == 1
                        ? const Icon(Icons.thumb_up_sharp, color: Colors.green)
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
                textButton(item.state ?? "", taskColors[item.stateid],
                    onTap: () => {}),
              ]),
        ],
      ),
    );
  }

  Widget listItem(item) {
    return Dismissible(
        key: Key(item.id.toString()),
        direction: DismissDirection.startToEnd,
        background: slideBackground("left", "Edit", FontAwesomeIcons.file,
            controller.page.color.withOpacity((6 + 2) / 10)),
        confirmDismiss: (direction) async {
          controller.handleEditForm(item.id);
          return false;
        },
        child: listCard(item));
  }

  return listBody(controller: controller, itemWidget: listItem);
}
