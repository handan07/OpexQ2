import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:core';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:opexq/models/callcenter_log_model.dart';
import 'package:opexq/models/chat_model.dart';
import 'package:opexq/models/whatsapp_template_model.dart';
import 'package:opexq/services/api_service.dart';
import 'package:opexq/utils/utils.dart';

class ChatController extends GetxController {
  int id = 0;
  RxString templateMessage = "".obs;
  final api = Get.find<ApiService>();
  List<dynamic> datalist = [];
  var isReady = false.obs;
  WhatsAppTemplate? messageTemplate;
  var conversation = CallCenter(
          id: 0,
          callid: "",
          status: "",
          crmid: 0,
          lastreceivedtime: "",
          lastreceiveddate: DateTime.now(),
          hasbirthday: false,
          messagetype: "",
          typeid: 2,
          isActive: false)
      .obs;
  Timer? chatTimer;

  late TextEditingController param1TextController;
  late TextEditingController param2TextController;
  late TextEditingController param3TextController;
  late TextEditingController param4TextController;
  late TextEditingController param5TextController;
  late TextEditingController messageController;

  static const pageSize = 50;
  late PagingController<int, dynamic> pagingController;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  init(CallCenter item) {
    messageController = TextEditingController(text: "");
    param1TextController = TextEditingController(text: "");
    param2TextController = TextEditingController(text: "");
    param3TextController = TextEditingController(text: "");
    param4TextController = TextEditingController(text: "");
    param5TextController = TextEditingController(text: "");

    pagingController = PagingController(firstPageKey: 0);
    pagingController.addPageRequestListener((pageKey) {
      loadMessages(pageKey);
    });
    //id = toInt(Get.arguments[0]);
    //clientName.value = Get.arguments[1] ?? "Messages";
    //to.value = Get.arguments[2] ?? "";
    // if (Get.arguments != null) {
    //   conversation.value = Get.arguments;
    //   id = conversation.value.id;
    // }
    conversation.value = item;
    id = conversation.value.id;
    datalist.clear();
    startChatTimer();
  }

  Future<dynamic> fetchList(int? offset) async {
    final parameters = {
      "_OFFSET": offset ?? 0,
      "_NEXT": pageSize,
      "SEARCH": "",
      "TAB": 0,
      //"ORDERBY": listOrderBy.value,
      "ID": id
    };

    var listResponse = await api.execApi(
        "AppCALLCENTERMESSAGEList", "CALLCENTER_LOG", parameters);
    List<dynamic> list = [];
    if (listResponse.isNotEmpty) list = listResponse[0];

    return (list)
        .map((i) => ChatMessage.fromMap(i))
        .toList()
        .cast<ChatMessage>();
  }

  Future loadSummary() async {
    Map<String, dynamic> parameters = {"CALLCENTERLOGID": id};

    await api.execApi("AppCALLCENTERSum", "CALLCENTER_LOG", parameters);
  }

  Future loadMessages(int pageKey) async {
    datalist.clear();
    isReady.value = false;

    try {
      var listResponse = await fetchList(
        pageKey,
      );

      if (listResponse.isNotEmpty) {
        datalist.assignAll(listResponse);
      } else {
        datalist.clear();
      }

      final isLastPage = datalist.length < pageSize;

      if (isLastPage) {
        pagingController.appendLastPage(datalist);
      } else {
        final nextPageKey = pageKey + datalist.length;
        pagingController.appendPage(datalist, nextPageKey);
      }
    } catch (error) {
      //pagingController.error = error;
    }

    isReady.value = true;
    loadSummary();
  }

  // void loadList(int pageKey) async {
  //   isReady.value = false;
  //   try {
  //     var listResponse = await fetchList(
  //       pageKey,
  //     );
  //     if (listResponse.isNotEmpty) {
  //       datalist.assignAll(listResponse);
  //     }

  //     final isLastPage = datalist.length < pageSize;

  //     if (isLastPage) {
  //       pagingController.appendLastPage(datalist);
  //     } else {
  //       final nextPageKey = pageKey + datalist.length;
  //       pagingController.appendPage(datalist, nextPageKey);
  //     }
  //   } catch (error) {
  //     pagingController.error = error;
  //   }
  //   isReady.value = true;
  // }

  handleSaveTemplate(WhatsAppTemplate item) async {
    stopChatTimer();

    Map<String, dynamic> formData = {};
    switch (item.type) {
      case "image":
        formData["content"] = item.messageName;
        formData["url"] = item.messageLink;
        formData["templateName"] = null;
        formData["templateParams"] = null;
        formData["lang"] = item.lang;
        formData["headerParam"] = null;
        formData["type"] = item.type;
        break;
      case "file":
        formData["content"] = item.messageName;
        formData["url"] = item.messageLink;
        formData["templateName"] = null;
        formData["templateParams"] = null;
        formData["lang"] = item.lang;
        formData["headerParam"] = null;
        formData["type"] = item.type;
        break;
      case "audio":
        formData["content"] = item.messageName;
        formData["url"] = item.messageLink;
        formData["templateName"] = null;
        formData["templateParams"] = null;
        formData["lang"] = item.lang;
        formData["headerParam"] = null;
        formData["type"] = item.type;
        break;
      case "video":
        formData["content"] = item.messageName;
        formData["url"] = item.messageLink;
        formData["templateName"] = null;
        formData["templateParams"] = null;
        formData["lang"] = item.lang;
        formData["headerParam"] = null;
        formData["type"] = item.type;
        break;
      case "whatsappsticker":
        formData["url"] = item.messageLink;
        formData["templateName"] = null;
        formData["templateParams"] = null;
        formData["lang"] = item.lang;
        formData["headerParam"] = null;
        formData["type"] = item.type;
        break;
      case "location":
        formData["content"] = item.messageName;
        formData["url"] = item.messageLink;
        formData["templateName"] = null;
        formData["templateParams"] = null;
        formData["lang"] = item.lang;
        formData["headerParam"] = null;
        formData["type"] = item.type;
        break;
      case "templatemessage":
        String params = param1TextController.text;
        params = "$params,${param2TextController.text}";
        params = "$params,${param3TextController.text}";
        params = "$params,${param4TextController.text}";
        params = "$params,${param5TextController.text}";

        formData["content"] = templateMessage.value;
        formData["url"] = null;
        formData["templateName"] = item.templatename;
        formData["templateParams"] = params;
        formData["lang"] = item.lang;
        formData["headerParam"] = null;
        formData["type"] = "hsm";
        break;
      case "interactive":
        formData["content"] = item.templatename;
        formData["url"] = null;
        formData["templateName"] = item.messageName;
        //formData["templateParams"] = params;
        formData["lang"] = item.lang;
        formData["headerParam"] = null;
        formData["type"] = "interactive";
        break;
      case "tag":
        formData["content"] = item.messageBody;
        formData["url"] = null;
        formData["templateName"] = null;
        formData["templateParams"] = null;
        formData["lang"] = item.lang;
        formData["headerParam"] = null;
        formData["type"] = "text";
        break;
      default:
    }

    formData["to"] = conversation.value.guestphone;
    formData["callcenterlogid"] = id;

    var response = await api.apiSequence("Whatsapp Message Send", formData);

    if (response.isNotEmpty) {
      if (response["success"] == 0) {
        showErrorDialog("Message Send", response["message"]);
        messageController.text = "";
        return;
      } else {
        Get.back();
      }
    }
    //clearParameters();

    startChatTimer();
  }

  handleSendImage(XFile image, String? content) async {
    stopChatTimer();
    var link = await api.uploadFile(image);

    Map<String, dynamic> formData = {};
    formData["content"] = "Image"; //content;
    formData["url"] = link;
    formData["templateName"] = null;
    formData["templateParams"] = null;
    formData["lang"] = null;
    formData["headerParam"] = null;
    formData["type"] = "image";
    formData["to"] = conversation.value.guestphone;
    formData["callcenterlogid"] = id;

    var response =
        await ApiService.get().apiSequence("Whatsapp Message Send", formData);

    if (response.isNotEmpty) {
      if (response["success"] == 0) {
        showErrorDialog("Message Send", response["message"]);
        messageController.text = "";
        return;
      } else {
        Get.back();
      }
    }

    startChatTimer();
  }

  handleSaveText() async {
    stopChatTimer();

    //print(conversation.value.id.toString());

    if (messageController.text == "") {
      showErrorDialog("Message Send", "Enter message");
      return;
    }

    String message = messageController.text;
    messageController.text = "";

    // var myEscapedJSONString = message
    //     .replaceAll('\n', '\\n')
    //     .replaceAll(r"\'", "\\'")
    //     //.replaceAll("\\"", "\"")
    //     .replaceAll(r"\&", "\\&")
    //     .replaceAll('\r', '\\r')
    //     .replaceAll("\t", "\\t")
    //     .replaceAll("\b", "\\b")
    //     .replaceAll("\f", "\\f");

    //print(myEscapedJSONString);

    Map<String, dynamic> formData = {};
    formData["to"] = conversation.value.guestphone;
    formData["type"] = "text";
    formData["content"] = escapedString(message);
    formData["callcenterlogid"] = id;

    var response = await api.apiSequence("Whatsapp Message Send", formData);

    if (response.isNotEmpty) {
      if (response["success"] == 0) {
        showErrorDialog("Message Send", response["message"]);
        messageController.text = "";
        return;
      }
    }

    datalist.add(ChatMessage(
        message: message,
        direction: "sent",
        messageType: "text",
        phone: "",
        messagestatus: "",
        id: 0,
        rdate: DateTime.now(),
        ruser: "",
        callcenterlogid: 0,
        guestName: "No name"));
    startChatTimer();
  }

  handleAddUser(int staffId) async {
    stopChatTimer();
    Get.back();
    Map<String, dynamic> parameters = {};
    parameters["CALLCENTERLOGID"] = id;
    parameters["STAFFID"] = staffId;
    parameters["ACTIVE"] = 1;

    await api.execApi("AppWHATSAPPUSERAdd", "CALLCENTER_GROUP", parameters);
    startChatTimer();
  }

  Future handleConversationStatus(String processType) async {
    if (processType == "Contact") {
      return;
    }
    Map<String, dynamic> parameters = {
      "PROCESSTYPE": processType,
      "CALLCENTERLOGID": id
    };

    await api.execApi("AppCALLCENTERStatus", "CALLCENTER_LOG", parameters);
    conversation.value.status = processType;
  }

  stopChatTimer() {
    chatTimer?.cancel();
  }

  startChatTimer() {
    chatTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      pagingController.refresh();
    });
  }

  clearParameters() {
    param1TextController.clear();
    param2TextController.clear();
    param3TextController.clear();
    param4TextController.clear();
    param5TextController.clear();
  }

  updateTemplateMessage() {
    String message = messageTemplate!.messageBody ?? "";
    String pattern;
    if (param1TextController.text != "") {
      pattern = "{{1}}";
      message =
          message.replaceAll(pattern, "*${param1TextController.text}*");
    }
    if (param2TextController.text != "") {
      pattern = "{{2}}";
      message = message.replaceAll(pattern, param2TextController.text);
    }
    if (param3TextController.text != "") {
      pattern = "{{3}}";
      message = message.replaceAll(pattern, param3TextController.text);
    }
    if (param4TextController.text != "") {
      pattern = "{{4}}";
      message = message.replaceAll(pattern, param4TextController.text);
    }
    if (param5TextController.text != "") {
      pattern = "{{5}}";
      message = message.replaceAll(pattern, param5TextController.text);
    }
    templateMessage.value = message;
  }

  @override
  void onClose() {
    stopChatTimer();
    //messageController.dispose();
    // param1TextController.dispose();
    // param2TextController.dispose();
    // param3TextController.dispose();
    // param4TextController.dispose();
    // param5TextController.dispose();
    pagingController.dispose();
    super.onClose();
  }
}
