import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/chat/chat_controller.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/utils/configuration.dart';

Widget whatsAppUserList(ListController controller) {
  Widget userIcon(String link, bool active) {
    return Container(
        padding: const EdgeInsets.all(0),
        //color: grey,
        width: 65,
        height: 65,
        child: CircleAvatar(
          //radius: 45,
          backgroundColor:
              active ? Colors.green : Colors.white, //Color(0xffFDCF09),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: link == ""
                  ? Image.asset(
                      "assets/images/onboarding_1.png",
                      fit: BoxFit.cover,
                      width: 50.0,
                      height: 50.0,
                    )
                  : Image.network(
                      link,
                      fit: BoxFit.cover,
                      width: 50.0,
                      height: 50.0,
                    )),
        ));
  }

  Widget listItem(item) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: ListTile(
        onTap: () {
          ChatController chatController = Get.find();
          chatController.handleAddUser(item.id);
        },
        tileColor: Colors.white54,
        selectedTileColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: Text(item.staffName),
        leading: userIcon(item.imageName, true),
        subtitle: Text(item.department),
        trailing: item.isAdmin == true
            ? Icon(
                FontAwesomeIcons.squareCheck,
                color: grey,
              )
            : Icon(
                FontAwesomeIcons.square,
                color: grey,
              ),
      ),
    );
  }

  return listBody(controller: controller, itemWidget: listItem);
}
