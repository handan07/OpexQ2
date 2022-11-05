import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opexq/models/whatsapp_template_model.dart';
import 'package:opexq/pages/chat/chat_controller.dart';
import 'package:opexq/pages/chat/widget/chat_input.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/widgets.dart';

ChatController controller = Get.find();

Widget whatsAppButton(dynamic onPressed) {
  return CircleAvatar(
    radius: 25,
    backgroundColor: const Color(0xFF128C7E),
    child: IconButton(
        icon: const Icon(
          Icons.send,
          color: Colors.white,
        ),
        onPressed: onPressed
        //{
        // controller.handleSave();
        // if (sendButton) {
        //   _scrollController.animateTo(
        //       _scrollController
        //           .position.maxScrollExtent,
        //       duration:
        //           Duration(milliseconds: 300),
        //       curve: Curves.easeOut);
        //   sendMessage(
        //       _controller.text,
        //       widget.sourchat.id,
        //       widget.chatModel.id);
        //   _controller.clear();
        //   setState(() {
        //     sendButton = false;
        //   });
        //}
        //},
        ),
  );
}

Widget imageEdit(XFile? selectedFile) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Image.file(File(selectedFile!.path),
                width: 200, height: 200, fit: BoxFit.fill),
          ),
        ),
        whatsAppButton(() => controller.handleSendImage(selectedFile, "")),
      ]);
}

Widget bottomMenu(FocusNode focusNode) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      height: 100,
      child: Row(
        children: [
          Container(
            width: Get.size.width - 65,
            padding: const EdgeInsets.only(left: 5, top: 10),
            child: SizedBox(
              width: Get.size.width - 60,
              child: Card(
                margin: const EdgeInsets.only(left: 2, right: 2, bottom: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                    expands: true,
                    controller: controller.messageController,
                    focusNode: focusNode,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: null,
                    textInputAction: TextInputAction.newline,
                    onChanged: (value) {
                      // if (value.length > 0) {
                      //   setState(() {
                      //     sendButton = true;
                      //   });
                      // } else {
                      //   setState(() {
                      //     sendButton = false;
                      //   });
                      // }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Write a message ...".tr,
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      prefixIcon: IconButton(
                          icon: Icon(Icons.add, size: 30, color: grey),
                          onPressed: () => showMenu()),
                      //Get.toNamed(AppRoutes.list + '/whatsapptemplate/0')),
                      // suffixIcon: IconButton(
                      //   icon: const Icon(Icons.attach_file),
                      //   onPressed: () {
                      //     showMenu();
                      //     //openBottomSheet(imageEdit(), "");
                      //   },
                      // )
                    )),
                //contentPadding: EdgeInsets.all(5),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                right: 2,
                left: 2,
              ),
              child: whatsAppButton(controller.handleSaveText)),
        ],
      ),

      // Row(
      //   children: [
      //     Container(
      //       width: Get.size.width - 65,
      //       child: Card(
      //         margin: EdgeInsets.only(left: 8, right: 2, bottom: 20),
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(16),
      //         ),
      //         child: TextFormField(
      //           controller: _controller.messageController,
      //           focusNode: focusNode,
      //           textAlignVertical: TextAlignVertical.center,
      //           keyboardType: TextInputType.multiline,
      //           maxLines: 5,
      //           minLines: 1,
      //           onChanged: (value) {
      //             // if (value.length > 0) {
      //             //   setState(() {
      //             //     sendButton = true;
      //             //   });
      //             // } else {
      //             //   setState(() {
      //             //     sendButton = false;
      //             //   });
      //             // }
      //           },
      //           decoration: InputDecoration(
      //             border: InputBorder.none,
      //             hintText: "Type a message",
      //             hintStyle: TextStyle(color: Colors.grey),
      //             prefixIcon: IconButton(
      //               icon: const Icon(Icons.add),
      //               onPressed: () {
      //                 // if (!show) {
      //                 //   focusNode.unfocus();
      //                 //   focusNode.canRequestFocus = false;
      //                 // }
      //                 // setState(() {
      //                 //   show = !show;
      //                 // });
      //               },
      //             ),
      //             suffixIcon: IconButton(
      //               icon: Icon(Icons.attach_file),
      //               onPressed: () {
      //                 // showModalBottomSheet(
      //                 //     backgroundColor:
      //                 //         Colors.transparent,
      //                 //     context: context,
      //                 //     builder: (builder) =>
      //                 //         bottomSheet());
      //               },
      //             ),
      //             contentPadding: EdgeInsets.all(5),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(
      //         bottom: 20,
      //         right: 2,
      //         left: 2,
      //       ),
      //       child: CircleAvatar(
      //         radius: 25,
      //         backgroundColor: const Color(0xFF128C7E),
      //         child: IconButton(
      //           icon: const Icon(
      //             Icons.send,
      //             color: Colors.white,
      //           ),
      //           onPressed: () {
      //             // if (sendButton) {
      //             //   _scrollController.animateTo(
      //             //       _scrollController
      //             //           .position.maxScrollExtent,
      //             //       duration:
      //             //           Duration(milliseconds: 300),
      //             //       curve: Curves.easeOut);
      //             //   sendMessage(
      //             //       _controller.text,
      //             //       widget.sourchat.id,
      //             //       widget.chatModel.id);
      //             //   _controller.clear();
      //             //   setState(() {
      //             //     sendButton = false;
      //             //   });
      //             //}
      //           },
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    ),
  );
}

Widget templateIcon(IconData icon, dynamic onTap) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(0),
        //color: grey,
        width: 50,
        height: 50,
        child: Icon(
          icon,
          size: 30,
          color: Colors.black45,
        ),
      ));
}

Widget messageDialogWidget(WhatsAppTemplate item) {
  switch (item.type) {
    // case "text":
    //   return Text(item.messageName);
    case "image":
      return Align(
        alignment: Alignment.center,
        child: Image.network(
          item.messageLink!,
          fit: BoxFit.fill,
          width: 200,
          height: 200,
        ),
      );
    case "file":
      return Align(
          alignment: Alignment.center,
          child: templateIcon(
              FontAwesomeIcons.file, () => launchURL(item.messageLink ?? "")));
    case "video":
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Expanded(
            child: Icon(
              Icons.fast_rewind,
              size: 30,
            ),
          ),
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              child: IconButton(
                onPressed: () => launchURL(item.messageLink!),
                icon: const Icon(
                  Icons.play_arrow,
                ),
              )),
          const Expanded(
            child: Icon(Icons.fast_forward, size: 30),
          ),
        ],
      );
    case "audio":
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Expanded(
            child: Icon(Icons.fast_rewind),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                  onPressed: () {
                    //print("sdsda");
                    //LocalAudioPlayer();
                  },
                  icon: const Icon(Icons.pause)),
            ),
          ),
          const Expanded(
            child: Icon(Icons.fast_forward),
          ),
        ],
      );
    case "templatemessage":
      return Obx(() => RichText(
              text: TextSpan(
            text: controller.templateMessage.value,
            style: subtitle2,
          )));
    case "interactive":
      return Align(
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(
            text: item.messageName,
            style: subtitle2,
          )));
    case "location":
      return Align(
          alignment: Alignment.center,
          child:
              templateIcon(FontAwesomeIcons.mapPin, () => print("sfdfsfds")));
    case "whatsappsticker":
      return Align(
        alignment: Alignment.center,
        child: Image.network(item.messageLink!,
            fit: BoxFit.fill, width: 100, height: 100),
      );
    default:
      return Container();
  }
}

Widget templateParameters() {
  return Column(children: <Widget>[
    chatInput(1, controller.param1TextController),
    greyline(),
    chatInput(2, controller.param2TextController),
    greyline(),
    chatInput(3, controller.param3TextController),
    greyline(),
    chatInput(4, controller.param4TextController),
    greyline(),
    chatInput(5, controller.param5TextController)
  ]);
}

messageDialog(WhatsAppTemplate item) {
  controller.clearParameters();
  controller.messageTemplate = item;
  if (item.type == "templatemessage") {
    controller.templateMessage.value = item.messageBody ?? "";
  } else {
    controller.templateMessage.value = "";
  }

  openBottomSheet(
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              messageDialogWidget(item),
              const SizedBox(height: 8),
              item.type == "templatemessage"
                  ? templateParameters()
                  : const SizedBox(height: 8),
              whatsAppButton(() => controller.handleSaveTemplate(item))
              // TextButton(
              //     onPressed: () {
              //       Get.back();
              //       controller.handleSaveTemplate();
              //     },
              //     child: Text("Send".tr)),
            ]),
      ),
      item.messageName);
}

Widget userButton(String imgUrl, String userName) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0),
    child: Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
          radius: 26.0,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          userName,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

void getImage(ImageSource source) async {
  try {
    final picker = ImagePicker();
    var img = await picker.pickImage(
      source: source, maxWidth: 1000,
      maxHeight: 1000,
      //imageQuality: quality,
    );
    if (img != null) {
      openBottomSheet(imageEdit(img), "Send picked image!");
    }
  } catch (e) {
    //pickImageError = e;
  }
}

menuAction(String action) {
  switch (action) {
    case "camera":
      Get.back();
      getImage(ImageSource.camera);
      break;
    case "galery":
      Get.back();
      getImage(ImageSource.gallery);
      break;
    case "template":
      Get.back();
      goToList("whatsapptemplate");
      break;
    default:
      Get.back();
  }
}

Widget menuTile(String title, IconData icon, String action) {
  return ListTile(
      contentPadding: const EdgeInsets.only(left: 16),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      leading: Icon(icon, size: 30),
      title: Text(title.tr),
      onTap: () => menuAction(action));
}

void showMenu() {
  Get.bottomSheet(
      Container(
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Wrap(
          children: <Widget>[
            menuTile("Camera", FontAwesomeIcons.cameraRetro, "camera"),
            greyline(),
            menuTile("Galery", FontAwesomeIcons.fileImage, "galery"),
            greyline(),
            menuTile("Template", FontAwesomeIcons.fileZipper, "template"),
          ],
        ),
      ),
      backgroundColor: Colors.transparent);
}
