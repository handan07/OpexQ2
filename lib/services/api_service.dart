import "dart:convert";
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:opexq/models/approval_model.dart';
import 'package:opexq/models/callcenter_log_model.dart';
import 'package:opexq/models/checklist_model.dart';
import 'package:opexq/models/guest_model.dart';
import 'package:opexq/models/comment_model.dart';
import 'package:opexq/models/handbook_model.dart';
import 'package:opexq/models/lost_model.dart';
import 'package:opexq/models/message_model.dart';
import 'package:opexq/models/reminder_model.dart';
import 'package:opexq/models/roomrack_model.dart';
import 'package:opexq/models/task_model.dart';
import 'package:opexq/models/tasklog_model.dart';
import 'package:opexq/models/whatsapp_template_model.dart';
import 'package:opexq/models/whatsappuser_model.dart';
import 'package:opexq/models/select_item_model.dart';
import 'package:opexq/services/storage_service.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/utils/utils.dart';

class ApiService extends GetxService {
  static ApiService get() => Get.find();

  final box = Get.find<StorageService>();
  final token =
        "appapi#23\$e8fb79d00f62768d896eb82dbd7b6255786c4ddc7fa9e0698139b7ff7c19722d6511de5382ca982b06c8ce0d46b33390d35ffb1e41ce2bf4bdca54e68940d3ff";

  Future<ApiService> init() async {
    return this;
  }

  Future<dynamic> execApi(
      String spname, String baseobject, Map<String, dynamic> parameters) async {
    ApiRequest execRequest = ApiRequest(
        action: "Execute",
        object: spname,
        baseObject: baseobject,
        parameters: parameters);
    ApiResponse response = await httpPost(execRequest);
    if (response.success) {
      return response.resultSets;
    } else {
      return [];
    }
  }

  Future<dynamic> apiSequence(
      String name, Map<String, dynamic> parameters) async {
    ApiRequest execRequest =
        ApiRequest(action: "ApiSequence", object: name, parameters: parameters);
    ApiResponse response = await httpPost(execRequest);
    if (response.success) {
      return response.row;
    } else {
      return [];
    }
  }

  Future formSelect(String pageName, String baseObject,
      Map<String, dynamic> parameters) async {
    List<dynamic> result = await execApi(
        "App${pageName.toUpperCase()}List", baseObject, parameters);

    Map<String, dynamic> data = {};
    if (result.isNotEmpty) {
      if (result[0].isNotEmpty) {
        data = result[0][0];
      }
    }
    if (pageName == "task") {
      return Task.fromJson(json.encode(data)).toMap();
    } else if (pageName == "tasklog") {
      return TaskLog.fromJson(json.encode(data)).toMap();
    } else if (pageName == "lost") {
      return Lost.fromJson(json.encode(data)).toMap();
    } else if (pageName == "comment") {
      return Comment.fromJson(json.encode(data)).toMap();
    } else if (pageName == "survey") {
      return Comment.fromJson(json.encode(data)).toMap();
    } else if (pageName == "checklist") {
      return CheckList.fromJson(json.encode(data));
    } else if (pageName == "guest") {
      return Guest.fromJson(json.encode(data)).toMap();
    } else if (pageName == "guestselect") {
      return Guest.fromJson(json.encode(data)).toMap();
    } else if (pageName == "approval") {
      return Approval.fromJson(json.encode(data));
    } else if (pageName == "callcenter") {
      return CallCenter.fromJson(json.encode(data));
    } else if (pageName == "roomrack") {
      return Roomrack.fromJson(json.encode(data));
    } else if (pageName == "reminder") {
      return Reminder.fromJson(json.encode(data));
    } else if (pageName == "message") {
      return Message.fromJson(json.encode(data));
    } else if (pageName == "handbook") {
      return Handbook.fromJson(json.encode(data));
    } else if (pageName == "whatsapptemplate") {
      return WhatsAppTemplate.fromJson(json.encode(data));
    } else if (pageName == "whatsappuser") {
      return WhatsAppUser.fromJson(json.encode(data));
    } else {
      return data;
    }
  }

  Future<bool> formInsert(
      String pageName, String baseObject, Map<String, dynamic> formData) async {
    debugPrint(formData.toString());
    List<dynamic> result = await execApi(
        "App${pageName.toUpperCase()}Insert", baseObject, formData);

    if (result.isNotEmpty) {
      if (result[0].isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  Future<bool> formUpdate(String pageName, String baseObject, dynamic id,
      Map<String, dynamic> formData) async {
    List<dynamic> result = await execApi(
        "App${pageName.toUpperCase()}Update", baseObject, formData);
    if (result.isNotEmpty) {
      if (result[0].isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  Future<dynamic> fetchList(String pageName, String baseObject,
      Map<String, dynamic> parameters) async {
    var listResponse = await ApiService.get()
    .execApi("App${pageName.toUpperCase()}List", baseObject, parameters);
    List list = [];
    if (listResponse.isNotEmpty) list = listResponse[0];
    if (pageName == "task") {
      return (list).map((i) => Task.fromMap(i)).toList().cast<Task>();
    }
    if (pageName == "tasklog") {
      return (list).map((i) => TaskLog.fromMap(i)).toList().cast<TaskLog>();
    } else if (pageName == "lost") {
      return (list).map((i) => Lost.fromMap(i)).toList().cast<Lost>();
    } else if (pageName == "comment") {
      return (list).map((i) => Comment.fromMap(i)).toList().cast<Comment>();
    } else if (pageName == "survey") {
      return (list).map((i) => Comment.fromMap(i)).toList().cast<Comment>();
    } else if (pageName == "checklist") {
      return (list).map((i) => CheckList.fromMap(i)).toList().cast<CheckList>();
    } else if (pageName == "guest") {
      return (list).map((i) => Guest.fromMap(i)).toList().cast<Guest>();
    } else if (pageName == "guestselect") {
      return (list).map((i) => Guest.fromMap(i)).toList().cast<Guest>();
    } else if (pageName == "approval") {
      return (list).map((i) => Approval.fromMap(i)).toList().cast<Approval>();
    } else if (pageName == "callcenter") {
      return (list)
          .map((i) => CallCenter.fromMap(i))
          .toList()
          .cast<CallCenter>();
    } else if (pageName == "roomrack") {
      return (list).map((i) => Roomrack.fromMap(i)).toList().cast<Roomrack>();
    } else if (pageName == "reminder") {
      return (list).map((i) => Reminder.fromMap(i)).toList().cast<Reminder>();
    } else if (pageName == "message") {
      return (list).map((i) => Message.fromMap(i)).toList().cast<Message>();
    } else if (pageName == "handbook") {
      return (list).map((i) => Handbook.fromMap(i)).toList().cast<Handbook>();
    } else if (pageName == "whatsapptemplate") {
      return (list)
          .map((i) => WhatsAppTemplate.fromMap(i))
          .toList()
          .cast<WhatsAppTemplate>();
    } else if (pageName == "whatsappuser") {
      return (list)
          .map((i) => WhatsAppUser.fromMap(i))
          .toList()
          .cast<WhatsAppUser>();
    } else if (pageName == "select") {
      return (list)
          .map((i) => SelectItem.fromMap(i))
          .toList()
          .cast<SelectItem>();
    }
  }

  Future<dynamic> execApiToken(
      String spname, String baseobject, Map<String, dynamic> parameters) async {
    ApiRequest execRequest = ApiRequest(
        action: "Execute",
        object: spname,
        baseObject: baseobject,
        parameters: parameters);
    ApiResponse response = await httpPost(execRequest);
    if (response.success) {
      return response.resultSets;
    } else {
      return [];
    }
  }

  // Future<dynamic> execApiResultSets(
  //     String spname, String baseobject, Map parameters) async {
  //   ApiRequest execRequest = ApiRequest(
  //       action: "Execute",
  //       object: spname,
  //       baseObject: baseobject,
  //       parameters: parameters);
  //   ApiResponse response = await httpPost(execRequest);
  //   if (response.success) {
  //     if (response.resultSets!.isNotEmpty) return response.resultSets;
  //   } else {
  //     return [];
  //   }
  // }

  Future<int> insertApi(
      String tablename, Map<String, dynamic> insertData) async {
    ApiRequest insertRequest =
        ApiRequest(action: "Insert", object: tablename, row: insertData);
    ApiResponse response = await httpPost(insertRequest);
    if (response.success == true) {
      return response.primaryKey ?? 0;
    }
    return 0;
  }

  Future<int> updateApi(
      String tablename, Map<String, dynamic> updateData, int id) async {
    ApiRequest updateRequest =
        ApiRequest(action: "Update", object: tablename, row: updateData);
    ApiResponse response = await httpPost(updateRequest);

    if (response.success == true) {
      return response.primaryKey ?? 0;
    } else {
      return 0;
    }
  }

  Future<int> deleteApi(String tablename, int id) async {
    ApiRequest deleteRequest =
        ApiRequest(action: "Delete", object: tablename, keys: id.toString());
    ApiResponse response = await httpPost(deleteRequest);
    if (response.success == true) {
      return response.primaryKey ?? 0;
    } else {
      return 0;
    }
  }

  Future<dynamic> selectApi(String object,
      {List<String>? select,
      List<dynamic>? where,
      List<dynamic>? joins,
      List<dynamic>? orderBy,
      bool? totalCount,
      int? pageIndex,
      int? itemsPerPage}) async {
    ApiRequest selectRequest = ApiRequest(
        action: "Select",
        object: object,
        select: select ?? [],
        paging: {
          "Current": pageIndex ?? 1,
          "ItemsPerPage": itemsPerPage ?? 100
        },
        orderBy: orderBy ?? [],
        where: where ?? [],
        joins: joins ?? [],
        totalCount: totalCount);
    ApiResponse response = await httpPost(selectRequest);

    if (response.success) {
      return response.resultSets?[0];
    } else {
      return [];
    }
  }

  Future<dynamic> byKeyApi(String tablename, int id,
      {String primaryKey = "ID"}) async {
    ApiRequest byKeyRequest =
        ApiRequest(action: "Select", object: tablename, paging: {
      "Current": 1,
      "ItemsPerPage": 1
    }, where: [
      {"Column": "ID", "Operator": "=", "Value": id}
    ]);
    ApiResponse response = await httpPost(byKeyRequest);
    if (response.success) {
      return response.resultSets?[0][0];
    } else {
      return <String, dynamic>{};
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      Map logindata = {
        "Action": "Login",
        "Usercode": email,
        "Password": password,
        "Tenant": box.tenantId
      };

      String postBody = json.encode(logindata);
      Map<String, String> headers = {
        "Content-type": "application/json; charset=utf-8"
      };

      String endPoint = parseString(box.endPoint);
      if (endPoint == "") Get.offAllNamed(AppRoutes.signUp);

      const CircularProgressIndicator();
      var authResult = await http.post(Uri.parse("$endPoint/login"),
          headers: headers, body: postBody);

      if (authResult.statusCode == 200) {
        var postResult = json.decode(utf8.decode(authResult.bodyBytes));
        bool success = postResult["Success"];
        if (success) {
          String token = postResult["LoginToken"];
          var tenancy = postResult["Tenancy"];

          int userId = toInt(tenancy["USERID"]);
          String email = parseString(tenancy["USEREMAIL"]);
          String userName = parseString(tenancy["USERNAME"]);
          int companyId = toInt(tenancy["COMPANYID"]);
          String company = parseString(tenancy["COMPANYNAME"]);
          String picture = parseString(tenancy["PICTURE"]);
          int departmentId = toInt(tenancy["DEPARTMENTID"]);
          String department = parseString(tenancy["DEPARTMENT"]);
          String departmentGroup = parseString(tenancy["DEPGROUP"]);
          String version = parseString(tenancy["MOBILECONFIGVERSION"]);

          box.token = token;
          box.userId = userId;
          box.userName = userName;
          box.email = email;
          box.company = company;
          box.companyId = companyId;
          box.department = department;
          box.departmentId = departmentId;
          box.departmentGroup = departmentGroup;
          box.picture = picture;
          box.version = version;

          //settings.refreshCache();
          getFcmToken();
          return true;
        } else {
          await showErrorDialog(
              "login Error", "Please check your username and password data.");
          return false;
        }
      } else {
        await showErrorDialog(
            "General network failure", "Please try again later.");
        return false;
      }
    } catch (e) {
      await showErrorDialog("Network Error", "Error".trArgs([e.toString()]));
    }
      return false;
  }

  Future getFcmToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      StorageService.get().writeStorage(StorageKeys.registerId, token);
      debugPrint(token);
      Map<String, dynamic> parameters = {};
      parameters["TOKEN"] = token;
      parameters["PLATFORM"] = Platform.isIOS ? "IOS" : "ANDROID";
      parameters["TYPE"] = 1;

      execApi("AppToken", "STDUSER_FIREBASETOKEN", parameters);
    }
  }

  Future<bool> changePassword(String newPassword) async {
    Map<String, dynamic> parameters = {};
    parameters["TOKEN"] = newPassword;
    parameters["PLATFORM"] = Platform.isIOS ? "IOS" : "ANDROID";
    parameters["TYPE"] = 2;

    await execApi("AppToken", "STDUSER_FIREBASETOKEN", parameters);
    return true;
  }

  Future<bool> appLogin(
      String companyId, String licence, String email, String password) async {
    final parameters = {"CLIENTID": toInt(companyId), "LICENCE": licence};
    
    ApiRequest execRequest = ApiRequest(
        action: "Execute",
        object: "SP_OPEX_APPLOGIN",
        baseObject: "LOGIN",
        parameters: parameters);

    execRequest.loginToken = token;

    String postbody =
        json.encode(execRequest.toMap(), toEncodable: myDateSerializer);
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
    };

    const CircularProgressIndicator();
    http.Response response = await http.post(
        Uri.parse("https://demonode.opex.app/"),
        headers: headers,
        body: postbody);

    var responseObject = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      if (responseObject.length > 0) {
        if (responseObject[0].length > 0) {
          //print(responseObject);
          var data = responseObject[0][0];
          String url = data["DATASERVICEURL"] ?? "";
          String version = data["VERSION"] ?? "";
          String tenant = data["CLIENTNAME"] ?? "";
          String logoUrl = data["COMPANYLOGOURL"] ?? "";
          int tenantId = toInt(data["CLIENTTENANTID"]);

          box.endPoint = url;
          box.version = version;
          box.tenant = tenant;
          box.logoUrl = logoUrl;
          box.tenantId = tenantId;
          //settings.refreshCache();

          bool logged = await login(email, password);
          if (logged) {
            return true;
          } else {
            box.clearStorage();
            return false;
          }
        } else {
          await showErrorDialog(
              "Login Error", "Please check your entered data.");
          return false;
        }
      } else {
        await showErrorDialog("Login Error", "Please check your entered data.");
        return false;
      }
    } else {
      await showErrorDialog("Login Error", "Please check your entered data.");
      return false;
    }
  }

  Future forgotPassword(String usercode) async {
    final int tenantId = StorageService.get().readStorage(StorageKeys.tenantId);
    var requestBody = jsonEncode({
      "Action": "Execute",
      "Object": "SP_OPEX_FORGOTPASSWORD",
      "Parameters": {"TENANTID": tenantId, "USERCODE": usercode}
    });

    String endPoint = parseString(
        await StorageService.get().readStorage(StorageKeys.endPoint));
    if (endPoint == "") Get.offAllNamed(AppRoutes.signUp);

    const CircularProgressIndicator();

    final http.Response response = await http.post(Uri.parse(endPoint),
        headers: ({"Content-Type": "application/json"}),body: requestBody);

    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      showSuccessDialog(
          "Forget Password", "Your password send your mail address.");
    } else {
      showErrorDialog("Error", body);
    }
    return;
  }

  Future<dynamic> httpPostApiToken(ApiRequest request) async {
    if (box.endPoint == "") {
      Get.offAndToNamed(AppRoutes.signUp);
      return;
    }

    if (box.token == "" ||
        box.tenantId == 0 ||
        box.companyId == 0) loginError();

    request.loginToken = box.token;
    //request.where??=request.where=[];
    request.parameters?.putIfAbsent("COMPANYID", () => box.companyId);
    request.parameters?.putIfAbsent("TENANTID", () => box.tenantId);
    request.parameters?.putIfAbsent("RUSERID", () => box.userId);
    request.parameters?.putIfAbsent("LANGUAGE", () => box.lang);

    String postbody = json.encode(request.toMap(), toEncodable: myDateSerializer);
    Map<String, String> headers = {"Content-Type": "application/json; charset=utf-8"};

    //CircularProgressIndicator();
    try {
      http.Response response = await http.post(Uri.parse(box.endPoint),
          headers: headers, body: postbody);

      var responseObject = json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        return parseSuccessResponse(request.action, responseObject);
      } else {
        return parseErrorReponse(response.statusCode, responseObject);
      }
    } catch (exp) {
      errorLog("HtppPost Error", exp.toString());
      return ApiResponse(statusCode: 0, success: false, resultSets: []);
    }
  }


  Future<dynamic> httpPost(ApiRequest request) async {
    if (box.endPoint == "") {
      Get.offAndToNamed(AppRoutes.signUp);
      return;
    }

    if (box.token == "" ||
        box.tenantId == 0 ||
        box.companyId == 0) loginError();

    request.loginToken = box.token;
    if (request.action == "Insert" || request.action == "Update") {
      request.row!["TENANTID"] = box.tenantId;
    }

    if (request.action == "Insert" || request.action == "Update" || request.action == "DELETE") {
      request.row?.putIfAbsent("RUSER",() => box.userName);
      request.row?.putIfAbsent("RDATE", ()=>DateTime.now());
      request.row?.putIfAbsent("TENANTID", ()=>box.tenantId);
      request.row?.putIfAbsent("COMPANYID", ()=>box.companyId);
    }
    
    if (request.action == "Select") {
      request.where?.add(
          {"Column": "TENANTID", "Operator": "=", "Value": box.tenantId});
      request.where?.add({
        "Column": "COMPANYID",
        "Operator": "=",
        "Value": box.companyId
      });
    }

    if (request.action == "Execute" || request.action == "ApiSequence") {
      request.parameters?.putIfAbsent("COMPANYID", () => box.companyId);
      request.parameters?.putIfAbsent("TENANTID", () => box.tenantId);
      request.parameters?.putIfAbsent("RUSERID", () => box.userId);
      request.parameters?.putIfAbsent("LANGUAGE", () => box.lang);
    }

    String postbody = json.encode(request.toMap(), toEncodable: myDateSerializer);
    Map<String, String> headers = {"Content-Type": "application/json; charset=utf-8"};

    //CircularProgressIndicator();
    try {
      http.Response response = await http.post(Uri.parse(box.endPoint),
          headers: headers, body: postbody);

      var responseObject = json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        return parseSuccessResponse(request.action, responseObject);
      } else {
        return parseErrorReponse(response.statusCode, responseObject);
      }
    } catch (exp) {
      errorLog("HtppPost Error", exp.toString());
      return ApiResponse(statusCode: 0, success: false, resultSets: []);
    }
  }

  ApiResponse parseSuccessResponse(String? requestType, var responseObject) {
    ApiResponse response = ApiResponse(success: true, statusCode: 200,message:"Ok");

    if (requestType == "Execute") {
      response.resultSets = responseObject;
    } else if (requestType == "Select") {
      response.totalCount = toInt(responseObject["TotalCount"]);
      response.resultSets = responseObject["ResultSets"] ?? [];
    } else if (requestType == "ApiSequence") {
      response.row = responseObject ?? {};
    } else {
      response.primaryKey = toInt(responseObject["PrimaryKey"]);
      response.row = responseObject["Row"];
      response.rowsAffected = toInt(responseObject["RowsAffected"]);
    }
    return response;
  }

  Future<ApiResponse> parseErrorReponse(
      int statusCode, var responseObject) async {
    ApiResponse response = ApiResponse(
        success: false, statusCode: statusCode, message: responseObject);


    if (statusCode == 400 || statusCode == 404 || statusCode == 500) {
      errorLog("Api Error $statusCode", response.message ?? "");
      await showErrorDialog("Data Error", response.message ?? "Error");
    } else if (statusCode == 401) {
      loginError();
    } else if (statusCode == 403) {
      errorLog("Permission Message $statusCode",
          response.message ?? "");
      showErrorDialog("Authorization", "You don't have permission!");

    } else {
      errorLog("Api Error $statusCode", response.message ?? "");
      await showErrorDialog("Unknown Error", "");
    }
    return response;
  }

  errorLog(String errorCode, String errorMessage) {
    Map<String, dynamic> insertData = {
      "LUSER": box.userName,
      "ERR_CODE": errorCode,
      "ERR_MES": errorMessage,
      "LIP": null,
      "TENANTID": box.tenantId,
      "COMPANYID": box.companyId
    };

    ApiRequest insertRequest =
        ApiRequest(action: "Insert", object: "STDLOG_ERR", row: insertData);

    String postbody =
        json.encode(insertRequest.toMap(), toEncodable: myDateSerializer);

    http.post(Uri.parse(box.endPoint),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: postbody);
  }

  void loginError() {
    Get.toNamed(AppRoutes.login);
    showAlert("Login required");
  }

  // isLoggedOn() {
  //   var token =
  //       parseString(StorageService.get().readStorage(StorageKeys.token));
  //   int tenantid =
  //       toInt(StorageService.get().readStorage(StorageKeys.tenantId));
  //   int companyid =
  //       toInt(StorageService.get().readStorage(StorageKeys.companyId));
  //   if (token == "" || tenantid == 0 || companyid == 0) {
  //     Get.offAndToNamed("/login");
  //   }
  // }

  // Future<List<LookupItem>> lookupItems(String table, String field,
  //     {List<dynamic>? where, List<dynamic>? orderBy}) async {
  //   final List<LookupItem> itemList = [];
  //   var list = await selectApi(table,
  //       select: ["ID", field],
  //       where: where,
  //       orderBy: orderBy ??
  //           [
  //             {"Column": field}
  //           ],
  //       itemsPerPage: 1000);
  //   if (list != null) {
  //     for (var i = 0; i < list.length; i++) {
  //       itemList.add(LookupItem(list[i]["ID"], list[i][field]));
  //     }
  //   }
  //   return itemList;
  // }

  Future<List<String>> stdLookupItems(String field) async {
    final List<String> itemList = [];
    var list = await selectApi("STDLOOKUP",
        where: [
          {"Column": "LOOKUPTABLE", "Operator": "=", "Value": field}
        ],
        itemsPerPage: 1000);
    if (list != null) {
      for (var i = 0; i < list.length; i++) {
        itemList.add(list[i]["LOOKUPVALUE"]);
      }
    }
    return itemList;
  }

  // ApiResponse loginErrorResponse = ApiResponse(
  //   success: false,
  //   message: "Login Required",
  //   responseCode: 401,
  //   totalCount: 0,
  //   resultSets: [],
  // );

  Future<String> uploadFile(XFile file) async {
    final dio = Dio();
    String fileExtension = file.name.substring(file.name.indexOf("."));
    final fileBytes = await file.readAsBytes();
    var streamData = Stream.fromIterable(fileBytes.map((e) => [e]));
    //https://opexcdn.blob.core.windows.net/$web/17f7d330-3b01-6303-8ed7-8cd70846d800.jpg?sv=2019-10-10&ss=bfqt&srt=sco&sp=rwdlacupx&se=2030-06-29T16:17:32Z&st=2020-06-29T08:17:32Z&spr=https,http&sig=XE70ZqJpNz4N6LeuGCfwpy%2FYEHDPzP1gJkQBCj%2BZFQU%3D&api-version=2018-03-28
    //PUT /$web/17f7d330-3b01-6303-8ed7-8cd70846d800.jpg HTTP/1.1
/*
    sv: 2019-10-10
ss: bfqt
srt: sco
sp: rwdlacupx
se: 2030-06-29T16:17:32Z
st: 2020-06-29T08:17:32Z
spr: https,http
sig: XE70ZqJpNz4N6LeuGCfwpy/YEHDPzP1gJkQBCj+ZFQU=
api-version: 2018-03-28 */

/*
PUT /$web/17f7d330-3b01-6303-8ed7-8cd70846d800.jpg HTTP/1.1
Content-Type: application/octet-stream
Accept: application/atom+xml,application/xml
Accept-Language: en-US,en;q=0.9
Accept-Encoding: gzip, deflate, br
Host: opexcdn.blob.core.windows.net
Origin: https://demo5.opex.app
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Safari/605.1.15
Referer: https://demo5.opex.app/
Content-Length: 90766
Connection: keep-alive
x-ms-client-request-id: ac612f10-a1dc-11ec-8664-6972c708373b
x-ms-blob-content-type: image/jpeg
x-ms-blob-type: BlockBlob
x-ms-date: Sat, 12 Mar 2022 08:16:09 GMT
x-ms-blob-content-md5: rxFOvkOeGC9V/gtWKlcAJQ==
x-ms-version: 2018-03-28 */
    String filename =
        DateTime.now().millisecondsSinceEpoch.toString() + fileExtension;
    var uploadDestinationUrl = "https://opexcdn.blob.core.windows.net/\$web/$filename?sv=2019-10-10&ss=bfqt&srt=sco&sp=rwdlacupx&se=2030-06-29T16:17:32Z&st=2020-06-29T08:17:32Z&spr=https,http&sig=XE70ZqJpNz4N6LeuGCfwpy%2FYEHDPzP1gJkQBCj%2BZFQU%3D&api-version=2018-03-28";
    await dio.put(uploadDestinationUrl,
        data: streamData,
        options: Options(headers: {
          Headers.contentLengthHeader: fileBytes.length,
          "x-ms-blob-type": "BlockBlob",
          "content-type": "image/jpeg"
        }));
    return "https://opexcdn.blob.core.windows.net/\$web/$filename";
  }
}

class ApiRequest {
  String? loginToken;
  String action;
  String object;
  String? baseObject;
  bool? totalCount;
  bool? dataTypes;
  Map? paging;
  List<dynamic>? orderBy;
  List<dynamic>? where;
  List<dynamic>? joins;
  Map? row;
  String? keys;
  Map<String, dynamic>? parameters;
  List<String>? select;

  ApiRequest(
      {this.loginToken,
      required this.action,
      required this.object,
      this.baseObject,
      this.totalCount = false,
      this.dataTypes = false,
      this.paging,
      this.orderBy,
      this.where,
      this.joins,
      this.row,
      this.keys,
      this.parameters,
      this.select});

  Map<String, dynamic> toMap() => {
        "LoginToken": loginToken,
        "Action": action,
        "Object": object,
        "BaseObject": baseObject,
        "TotalCount": totalCount,
        "DataTypes": dataTypes,
        "Paging": paging,
        "OrderBy": orderBy,
        "Where": where,
        "Joins": joins,
        "Row": row,
        "Keys": keys,
        "Parameters": parameters
      };
}

class ApiResponse {
  bool success;
  List<dynamic>? resultSets;
  int? totalCount;
  String? message;
  int? rowsAffected;
  Map? row;
  int? primaryKey;
  int? statusCode;
  Map<String, dynamic>? body;

  ApiResponse(
      {required this.success,
      this.resultSets,
      this.totalCount,
      this.message,
      this.rowsAffected,
      this.row,
      this.body,
      this.primaryKey,
      this.statusCode});

  // ApiResponse.fromJson(Map<String, dynamic> json) {
  //   success = json['success'];
  //   resultSets = json['resultSets'];
  //   totalCount = json['totalCount'];
  //   message = json['message'];
  //   rowsAffected = json["rowsAffected"];
  //   row
  // }
}

dynamic myDateSerializer(dynamic object) {
  if (object is DateTime) {
    return object.toIso8601String();
  }
  return object;
}

List<T> parseItemListFromJsonArray<T>(
  List<dynamic> jsonArray,
  T Function(dynamic object) mapper,
) =>
    jsonArray.map(mapper).toList();
