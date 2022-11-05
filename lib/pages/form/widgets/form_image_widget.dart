import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opexq/pages/form/form_controller.dart';
import 'package:opexq/services/api_service.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

Widget formImage(String fieldName, FormController controller) {
  RxString fileLink = "".obs;
  String link = controller.formData[fieldName] ?? "";

// Widget displayImage() {
//   if (imageFile != null) {
//     return Image.file(imageFile);
//   } else if (pickImageError != null) {
//     return Text(
//       'Pick Image error: $pickImageError',
//       textAlign: TextAlign.center,
//     );
//   } else {
//     return const Text(
//       'No image picked ',
//       textAlign: TextAlign.center,
//     );
//   }
// }

// Widget previewVideo() {
//   final Text? retrieveError = getRetrieveErrorWidget();
//   if (retrieveError != null) {
//     return retrieveError;
//   }
//   if (controller.videoController == null) {
//     return const Text(
//       'You have not yet picked a video',
//       textAlign: TextAlign.center,
//     );
//   }
//   return Padding(
//     padding: const EdgeInsets.all(10.0),
//     child: AspectRatioVideo(controller.videoController),
//   );
// }

// Widget previewImages() {
//   final Text? retrieveError = getRetrieveErrorWidget();
//   if (retrieveError != null) {
//     return retrieveError;
//   }
//   if (controller.imageFileList != null) {
//     return Semantics(
//         child: ListView.builder(
//           key: UniqueKey(),
//           itemBuilder: (BuildContext context, int index) {
//             // Why network for web?
//             // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
//             return Semantics(
//               label: 'image_picker_example_picked_image',
//               child: kIsWeb
//                   ? Image.network(controller.imageFileList![index].path)
//                   : Image.file(File(controller.imageFileList![index].path)),
//             );
//           },
//           itemCount: controller.imageFileList!.length,
//         ),
//         label: 'image_picker_example_picked_images');
//   } else if (controller.pickImageError != null) {
//     return Text(
//       'Pick image error: $controller.pickImageError',
//       textAlign: TextAlign.center,
//     );
//   } else {
//     return const Text(
//       'You have not yet picked an image.',
//       textAlign: TextAlign.center,
//     );
//   }
// }

// Text? getRetrieveErrorWidget() {
//   if (controller.retrieveDataError != null) {
//     final Text result = Text(controller.retrieveDataError!);
//     controller.retrieveDataError = null;
//     return result;
//   }
//   return null;
// }

// Widget handlePreview() {
//   if (controller.isVideo) {
//     return previewVideo();
//   } else {
//     return previewImages();
//   }
// }

  void getImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      var imageFile = await picker.pickImage(
        source: source, maxWidth: 1000,
        maxHeight: 1000,
        //imageQuality: quality,
      );
      if (imageFile != null) {
        String fileName = await ApiService.get().uploadFile(imageFile);
        controller.formData[fieldName] = fileName;
        fileLink.value = fileName;
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
      case "video":
        Get.back();
        getImage(ImageSource.camera);
        break;
      case "template":
        Get.back();
        goToList("whatsapptemplate");
        //Get.toNamed(AppRoutes.list + '/whatsapptemplate/0');
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
              menuTile("Video", FontAwesomeIcons.camera, "video"),
            ],
          ),
        ),
        backgroundColor: Colors.transparent);
  }

  imageWidgetUploaded() {
    return SizedBox(
        height: 150,
        width: 150,
        child: Center(
            child: Stack(
          children: <Widget>[
            Image.file(File(fileLink.value),
                width: 130, height: 130, fit: BoxFit.fill),
            Positioned(
              right: 5.0,
              child: InkWell(
                child: const Icon(
                  Icons.remove_circle,
                  size: 30,
                  color: Colors.red,
                ),
                onTap: () {
                  fileLink.value = "";
                  controller.formData[fieldName] = null;
                },
              ),
            )
          ],
        )));
  }

  uploadImage(String fieldName, FormController controller) {
    return SizedBox(
        height: 150,
        width: 150,
        child: Center(
            child: fileLink.value == ""
                ? GestureDetector(
                    onTap: () => showMenu(),
                    child: Image.asset("assets/images/camera_black.jpeg",
                        width: 130, height: 130),
                  )
                : imageWidgetUploaded()));
  }

  imageWidget() {
    return SizedBox(
        height: 160,
        width: 160,
        child: Center(
            child: GestureDetector(
                onTap: () => openImage(link),
                child: Image.network(link,
                    width: 130, height: 130, fit: BoxFit.fill))));
  }

  return link != "" ? imageWidget() : uploadImage(fieldName, controller);
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class AspectRatioVideo extends StatefulWidget {
  const AspectRatioVideo(this.controller);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container();
    }
  }
}
