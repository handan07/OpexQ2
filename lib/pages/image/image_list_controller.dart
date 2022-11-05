import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opexq/models/documents_model.dart';
import 'package:opexq/models/list_model.dart';
import 'package:opexq/services/api_service.dart';
import 'package:video_player/video_player.dart';

class ImageListController extends GetxController {
  int _offset = 0;
  late ListPage page;
  late TextEditingController searchTextController;
  late ScrollController scrollController;
  var isReady = false.obs;
  late File uploadFile;

  List<XFile>? imageFileList;

  set imageFile(XFile? value) {
    imageFileList = value == null ? null : <XFile>[value];
  }

  dynamic pickImageError;
  bool isVideo = false;

  VideoPlayerController? videoController;
  VideoPlayerController? toBeDisposed;
  String? retrieveDataError;

  final ImagePicker picker = ImagePicker();

  List<dynamic> datalist = [].obs;
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    searchTextController = TextEditingController(text: "");
    scrollController = ScrollController()..addListener(scrollListener);
    findPage();
  }

  @override
  void onReady() {
    loadList();
    super.onReady();
  }

  void findPage() {
    // if (Get.arguments[0] != null) {
    //   String name = Get.arguments[0];
    //   page = listPages.firstWhere((element) => element.name == name);
    // } else
    //   Get.toNamed("/notfound");
  }

  void loadList() async {
    var list = await ApiService().selectApi("DOCARCHIVE", where: [
      {"Column": "SOURCETABLE", "Operator": "=", "Value": "CALLS"},
      {"Column": "SOURCETABLEID", "Operator": "=", "Value": "447529"}
    ]);
    datalist.assignAll(
        (list).map((i) => Document.fromMap(i)).toList().cast<Document>());
  }

  void loadMore() async {
    _offset = _offset + 1;
    loadList();
  }

  void refreshList() async {
    datalist = [];
    loadList();
  }

  void scrollListener() {
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels) {
      loadMore();
    }
  }

  //new

  Future<void> disposeVideoController() async {
    if (toBeDisposed != null) {
      await toBeDisposed!.dispose();
    }
    toBeDisposed = videoController;
    videoController = null;
  }

  Future<void> playVideo(XFile? file) async {
    //if (file != null && mounted) {
    await disposeVideoController();
    late VideoPlayerController controller;
    if (kIsWeb) {
      controller = VideoPlayerController.network(file!.path);
    } else {
      controller = VideoPlayerController.file(File(file!.path));
    }
    videoController = controller;
    // In web, most browsers won't honor a programmatic call to .play
    // if the video has a sound track (and is not muted).
    // Mute the video so it auto-plays in web!
    // This is not needed if the call to .play is the result of user
    // interaction (clicking on a "play" button, for example).
    const double volume = kIsWeb ? 0.0 : 1.0;
    await controller.setVolume(volume);
    await controller.initialize();
    await controller.setLooping(true);
    await controller.play();
    //}
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await playVideo(response.file);
      } else {
        isVideo = false;
        // setState(() {
        //   _imageFile = response.file;
        //   _imageFileList = response.files;
        // });
      }
    } else {
      retrieveDataError = response.exception!.code;
    }
  }

  // @override
  // void deactivate() {
  //   if (videoController != null) {
  //     videoController!.setVolume(0.0);
  //     videoController!.pause();
  //   }
  //   super.deactivate();
  // }

  @override
  void onClose() {
    disposeVideoController();
    scrollController.dispose();
    super.onClose();
  }
}
