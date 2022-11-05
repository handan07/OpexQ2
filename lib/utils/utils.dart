import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:opexq/pages/audio/audio_player.dart';
import 'package:opexq/pages/video/video_player.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'configuration.dart';

bool parseBool(String? value) {
  return value == null ? false : value.toLowerCase() == 'true';
}

bool toBool(bool? value) {
  return value ?? false;
}

int toInt(dynamic value) {
  if (value == null || value == "") return 0;
  try {
    return int.parse(value.toString());
  } catch (error) {
    return 0;
  }
}

String toTime(DateTime value) {
  try {
    final dateFormatter = DateFormat('HH:mm');
    final dateString = dateFormatter.format(value);
    return dateString;
  } catch (e) {
    return "";
  }
}

String toSqlDate(DateTime value) {
  try {
    final dateFormatter = DateFormat('yyyy-MM-dd');
    final dateString = dateFormatter.format(value);
    return dateString;
  } catch (e) {
    return "";
  }
}

String formatDate(DateTime? value) {
  try {
    if (value == null) {
      return "";
    } else {
      return DateFormat.yMd().format(value);
    }
  } catch (e) {
    return "";
  }
}

String formatDateTime(DateTime? value) {
  try {
    if (value == null) {
      return "";
    } else {
      return DateFormat.yMd().add_Hm().format(value);
    }
  } catch (e) {
    return "";
  }
}

parseDate(value) {
  try {
    if (value is DateTime) {
      return DateFormat.yMd().format(value);
    } else {
      DateTime d = DateTime.parse(value);
      return DateFormat.yMd().format(d);
    }
  } catch (e) {
    return null;
  }
}

parseTime(value) {
  try {
    DateTime d = DateTime.parse(value);
    return DateFormat('HH:mm').format(d);
  } catch (e) {
    return null;
  }
}

parseDateTime(value) {
  try {
    DateTime d = DateTime.parse(value);
    return DateFormat.yMd().add_Hm().format(d);
  } catch (e) {
    return null;
  }
}

String parseString(value) {
  if (value == null) return "";
  try {
    return value.toString();
  } catch (error) {
    return "";
  }
}

showSnackBar(String title, String message) {
  Get.snackbar(
    title.tr,
    message.tr,
    snackPosition: SnackPosition.BOTTOM,
  );
}

showWarning(String message) {
  Get.snackbar(
    "Warning".tr,
    message.tr,
    backgroundColor: Colors.yellow[700],
    snackPosition: SnackPosition.BOTTOM,
  );
}

showSuccess(String message) {
  Get.snackbar(
    "Done".tr,
    message.tr,
    backgroundColor: Colors.green[300],
    snackPosition: SnackPosition.BOTTOM,
  );
}

showAlert(String message) {
  Get.snackbar(
    "Alert".tr,
    message.tr,
    backgroundColor: Colors.red[200],
    snackPosition: SnackPosition.TOP,
  );
}

showNotification(String title, String message, String? imageUrl) {
  Get.snackbar(title.tr, message.tr,
      titleText: Text(title.tr, style: headline3),
      messageText: Column(children: <Widget>[
        imageUrl != null ? Image.network(imageUrl) : Container(),
        Text(message.tr, style: subtitle1),
      ]),
      backgroundColor: Colors.white54,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 30));
}

closeOpenedDialog() {
  if (Get.isBottomSheetOpen ?? false) Get.back();
  if (Get.isSnackbarOpen) Get.back();
  if (Get.isDialogOpen ?? false) Get.back();
}

showDefaultDialog(String title, String message) {
  closeOpenedDialog();
  Get.defaultDialog(title: title.tr, content: Text(message.tr));
}

showContentDialog(String title, Widget content) {
  closeOpenedDialog();
  Get.defaultDialog(title: title.tr, content: content, barrierDismissible: true

      // DropdownButton(
      //     dropdownColor: Colors.white,
      //     style: TextStyle(color: Colors.black87),
      //     value: 0,
      //     items: [
      //       DropdownMenuItem(
      //         child: Text("New"),
      //         value: 0,
      //       ),
      //       DropdownMenuItem(
      //         child: Text("Importance"),
      //         value: 1,
      //       ),
      //     ],
      //     onChanged: (value) {}),
      );
}

showErrorDialog(String title, String message) async {
  closeOpenedDialog();
  await Get.defaultDialog(
    title: title.tr,
    //barrierDismissible: false,
    content: Column(children: <Widget>[
      SizedBox(
        height: 250,
        width: 250,
        child: Lottie.asset('assets/lottie/error.json'),
      ),
      Container(
        padding: const EdgeInsets.all(16),
        child: greyline(),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(message),
      ),
    ]),
    //onConfirm: onConfirm,
    //onCancel: () => {Get.back()},
  );
}

showSuccessDialog(String title, String message) async {
  closeOpenedDialog();
  await Get.defaultDialog(
    title: title.tr,
    content: Column(children: <Widget>[
      SizedBox(
        height: 250,
        width: 250,
        child: Lottie.asset('assets/lottie/error.json'),
      ),
      Text(message.tr),
    ]),
    //onConfirm: onConfirm,
    //onCancel: () => {Get.back()},
  );
}

showConfirmDialog(String title, String message, dynamic onConfirm) {
  closeOpenedDialog();
  Get.defaultDialog(
      title: title.tr,
      content: Column(children: <Widget>[
        SizedBox(
          height: 200,
          width: 200,
          child: Lottie.asset('assets/lottie/error.json'),
        ),
        Text(message.tr),
      ]),
      //onConfirm: onConfirm,
      //onCancel: () => Get.back(),
      confirm: GestureDetector(
          onTap: () => onConfirm,
          child: smallColoredButton(FontAwesomeIcons.thumbsUp)),
      cancel: GestureDetector(
          onTap: () => Get.back(),
          child: smallColoredButton(FontAwesomeIcons.xmark)));
}

Widget showBusyIndicator() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 150),
        CircularProgressIndicator(
          strokeWidth: 10,
          backgroundColor: kPrimaryColor,
          valueColor: const AlwaysStoppedAnimation(Colors.black54),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: Text("Loading".tr, style: subtitle1),
        )
      ]);

  // return Expanded(
  //     child: Center(
  //         child: CircularProgressIndicator(
  //   strokeWidth: 10,
  //   backgroundColor: kPrimaryColor,
  //   valueColor: const AlwaysStoppedAnimation(Colors.black54),
  // )));
}

openBottomSheet(Widget child, String? title) {
  Get.bottomSheet(
      Wrap(spacing: 12, children: <Widget>[
        const SizedBox(height: 12),
        Align(
            alignment: Alignment.center,
            child: Container(height: 2, width: 50, color: grey)),
        const SizedBox(height: 12),
        title == null
            ? Container()
            : Align(
                alignment: Alignment.center,
                child: AutoSizeText(title.tr,
                    style: Get.textTheme.headline6,
                    maxLines: 1,
                    minFontSize: 10)),
        child,
        const SizedBox(height: 50),
      ]),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      elevation: 4,
      enterBottomSheetDuration: const Duration(milliseconds: 600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));
}

openBottomSheetMax(Widget child, String? title, {Color? color}) {
  Get.bottomSheet(
      SizedBox(
          height: Get.size.height * 0.8,
          child: Column(children: <Widget>[
            const SizedBox(height: 12),
            Align(
                alignment: Alignment.center,
                child: Container(height: 2, width: 50, color: grey)),
            const SizedBox(height: 12),
            title == null
                ? Container()
                : Align(
                    alignment: Alignment.center,
                    child: Text(title.tr, style: Get.textTheme.headline6)),
            const SizedBox(height: 12),
            Expanded(child: SingleChildScrollView(child: child)),
            const SizedBox(height: 50),
          ])),
      isScrollControlled: true,
      backgroundColor: color ?? Colors.white,
      elevation: 4,
      enterBottomSheetDuration: const Duration(milliseconds: 600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));
}

openImage(String? url) {
  if (url == null || url == "") {
    showErrorDialog("Error", "Empty url");
    return;
  }
  openBottomSheet(
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Align(
          alignment: Alignment.center,
          child: Hero(
              tag: url,
              child: InteractiveViewer(
            panEnabled: true, // Set it to false
            boundaryMargin: const EdgeInsets.all(0),
            minScale: 1,
            maxScale: 3,
            child: Image.network(
              url,
              width: Get.width * 0.80,
              //height: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
      )),
      "Look Closer");
}

openVideo(String? url) {
  if (url == null || url == "") {
    showErrorDialog("Error", "Empty url");
    return;
  }
  openBottomSheet(VideoView(videoUrl: url), "Watch");
}

openAudio(String? url) {
  if (url == null || url == "") {
    showErrorDialog("Error", "Empty url");
    return;
  }
  openBottomSheet(AudioView(url: url), "Watch");
}

// uploadImage() {
//   Get.defaultDialog(
//     title: "",
//     content: Column(children: <Widget>[
//       SizedBox(
//           height: 500,
//           width: 500,
//           child: Image.asset("assets/images/camera_black.jpeg")),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           GestureDetector(
//               onTap: () {
//                 //print("camera");
//               },
//               child: const Icon(FontAwesomeIcons.cameraRetro, size: 45)),
//           const SizedBox(width: 30),
//           GestureDetector(
//               onTap: () {
//                 //print("album");
//               },
//               child: const Icon(FontAwesomeIcons.fileArchive, size: 45))
//         ],
//       )
//     ]),
//   );
// }

goTo(String route) {
  closeOpenedDialog();
  Get.toNamed(route);
}

goToList(String pageName, {int? tab}) {
  closeOpenedDialog();
  tab == null
      ? Get.toNamed('${AppRoutes.list}/$pageName/0')
      : Get.toNamed('${AppRoutes.list}/$pageName/$tab');
}

goToForm(String pageName, {int? id, Map<String, dynamic>? parameters}) {
  closeOpenedDialog();
  //Get.toNamed(AppRoutes.list, arguments: {"page": page, "tabIndex": 0});
  id == null
      ? Get.toNamed('${AppRoutes.form}/$pageName/0',
          arguments: parameters)
      : Get.toNamed('${AppRoutes.form}/$pageName/$id',
          arguments: parameters);
}

//Get.delete<MineController>();
//Get.find<AuthController>().user.uid;
//print('The last character: ${hi.characters.last}\n');

//NOtes
//\$ 745.00

// Future<File> imageFromCamera() async {
//   final pickedFile = await ImagePicker().getImage(
//       source: ImageSource.camera,
//       maxWidth: 1000,
//       maxHeight: 1000,
//       imageQuality: 50);

//   if (pickedFile != null) {
//     return File(pickedFile.path);
//   } else {
//     showWarning("No file selected.");
//     return null;
//   }
// }

// Future<File> imageFromGallery() async {
//   final pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//       maxWidth: 1000,
//       maxHeight: 1000,
//       imageQuality: 50);

//   if (pickedFile != null) {
//     return File(pickedFile.path);
//   } else {
//     showWarning("No file selected.");
//     return null;
//   }
// }

// void showPicker() {
//   Get.bottomSheet(
//       SafeArea(
//         child: Container(
//           child: Wrap(
//             children: <Widget>[
//               ListTile(
//                 leading: const Icon(FontAwesomeIcons.cameraRetro, size: 30),
//                 title: Text("Camera".tr),
//                 onTap: () {
//                   //imageFromCamera();
//                   Get.back();
//                 },
//               ),
//               ListTile(
//                   leading: const Icon(FontAwesomeIcons.fileImage, size: 30),
//                   title: Text("Galery".tr),
//                   onTap: () {
//                     //imageFromGallery();
//                     Get.back();
//                   }),
//               ListTile(
//                 leading: const Icon(Icons.photo_camera),
//                 title: Text("List".tr),
//                 onTap: () {
//                   Get.back();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white);
// }

launchURL(String? url) async {
  if (url == "" || url == null) {
    showErrorDialog("Error", "Empty url");
    return;
  }
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    showErrorDialog("Error", "Could not launch $url");
  }
}

Future<void> launchMap(String? lat, String? long) async {
  if (lat == null || lat == "" || long == null || long == "") {
    showErrorDialog("Error", "Empty url");
    return;
  }

  var mapSchema = 'geo:$lat,$long';
  if (Platform.isIOS) {
    mapSchema = 'http://maps.apple.com/?q=${lat},${long}';
  } else {
    mapSchema =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long'; //'geo:$lat,$long';
  }
  if (await canLaunch(mapSchema)) {
    await launch(mapSchema);
  } else {
    showAlert('Could not launch map');
  }
}

bool get isDarkModeOn {
  //if (currentTheme == 'system') {
  if (WidgetsBinding.instance.window.platformBrightness == Brightness.dark) {
    return true;
  }
  //}
  // if (currentTheme == 'dark') {
  //   return true;
  // }
  return false;
}

String escapedString(value) {
  return value
      .replaceAll('\n', '\\n')
      .replaceAll(r"\'", "\\'")
      //.replaceAll("\\"", "\"")
      .replaceAll(r"\&", "\\&")
      .replaceAll('\r', '\\r')
      .replaceAll("\t", "\\t")
      .replaceAll("\b", "\\b")
      .replaceAll("\f", "\\f");
}

String unEscapedString(value) {
  return value
      .replaceAll('\\n', '\n')
      .replaceAll("\\'", r"\'")
      //.replaceAll("\\"", "\"")
      .replaceAll("\\&", r"\&")
      .replaceAll('\\r', '\r')
      .replaceAll("\\t", "\t")
      .replaceAll("\\b", "\b")
      .replaceAll("\\f", "\f");
}
