import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/chat/chat_controller.dart';
import 'package:opexq/utils/configuration.dart';

Widget chatInput(int index, TextEditingController textController) {
  return Padding(
    padding: const EdgeInsets.only(top: 2),
    child: TextField(
      controller: textController,
      textInputAction: TextInputAction.go,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: "Parameter $index",
        contentPadding: const EdgeInsets.all(6),
        alignLabelWithHint: true,
        icon: Icon(
          FontAwesomeIcons.question,
          color: grey,
          size: 14,
        ),
      ),
      onChanged: (value) {
        ChatController controller = Get.find();
        controller.updateTemplateMessage();
      },
    ),
  );
}
