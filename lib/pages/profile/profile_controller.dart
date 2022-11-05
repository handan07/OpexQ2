import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opexq/services/api_service.dart';
import 'package:opexq/services/storage_service.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/utils/utils.dart';

class ProfileController extends GetxController {
  var id = 0;
  var isReady = false.obs;
  var selectedIndex = 3.obs;
  var selectedMenu = 1.obs;
  var obscureText = true.obs;
  var obscureText1 = true.obs;
  var obscureText2 = true.obs;
  var language = "".obs;
  var allowNotification = true.obs;
  var darkTheme = false.obs;
  var department = "".obs;
  var departmentGroup = "".obs;
  var company = "".obs;
  var userName = "".obs;
  var picture = "".obs;
  var version = "".obs;

  //final settings = Get.find<StorageService>();
  final api = Get.find<ApiService>();
  final box = Get.find<StorageService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController oldPasswordTextController;
  late TextEditingController newPasswordTextController;
  late TextEditingController verifyPasswordTextController;

  @override
  void onInit() {
    oldPasswordTextController = TextEditingController(text: "");
    newPasswordTextController = TextEditingController(text: "");
    verifyPasswordTextController = TextEditingController(text: "");
    super.onInit();
  }

  @override
  void onReady() {
    loadItem();
    super.onReady();
  }

  void loadItem() async {
    //id = toInt(readStorage("userId"));
    //var temp = await byKeyApi("VW_STDSTAFF", id);
    //data.value = User.fromMap(temp);
    userName.value = box.userName;
    company.value = box.company;
    department.value = box.department;
    departmentGroup.value = box.departmentGroup;
    picture.value = box.picture;
    version.value = box.version;
    language.value = box.lang;
    //allowNotification.value = toBool(settings.allowNotification);
    //darkTheme.value = toBool(settings.darkTheme);
    isReady.value = true;
  }

  // handleSave() {
  //   formKey.currentState.save();
  //   if (formKey.currentState != null) {
  //     if (formKey.currentState.validate()) {
  //       print(formKey.currentState.value);
  //       print(formKey.currentState.value["ID"]);
  //     }
  //   } else {
  //     print("validation failed");
  //   }
  // }

  handleMenuTap(index) {
    selectedMenu.value = index;
  }

  handleNotificationSettings(value) {
    allowNotification.value = value;
    box.writeStorage("allowNotification", value);
    box.allowNotification = value;
  }

  handleThemeSettings(value) {
    darkTheme.value = value;
    box.writeStorage("darkTheme", value);
    box.darkTheme = value;
  }

  Future handleChangePassword() async {
    if (oldPasswordTextController.text == "") {
      await showErrorDialog(
          "Change Password Error", "Enter your old password.");
      return false;
    }

    if (newPasswordTextController.text == "") {
      await showErrorDialog(
          "Change Password Error", "Enter your new password.");
      return false;
    }

    if (verifyPasswordTextController.text == "") {
      await showErrorDialog("Change Password Error", "Enter verify password.");
      return false;
    }

    if (newPasswordTextController.text != verifyPasswordTextController.text) {
      await showErrorDialog("Change Password Error",
          "Your passwords does not match. Please check.");
      return false;
    }

    var userCode = box.readStorage(StorageKeys.userCode);
    var oldPassword = oldPasswordTextController.text;
    var newPassword = newPasswordTextController.text;

    if (await api.login(userCode, oldPassword)) {
      var result = await api.changePassword(newPassword);
      if (result) {
        await showSuccessDialog(
            "Change Password", "Your password changed successfully");
        box.writeStorage("token", "");
        Get.toNamed(AppRoutes.login);
      }
    } else {
      showErrorDialog("Error", "Login Required");
    }
  }

  bottomMenuHandle(item) {
    if (item.id == 0) {
      Get.toNamed(AppRoutes.home);
    } else if (item.id == 1) {
      Get.toNamed(AppRoutes.home);
    } else if (item.id == 2) {
      Get.toNamed(AppRoutes.home);
    }
  }

  togglePassword(index) {
    if (index == 1) {
      obscureText.value = !obscureText.value;
    } else if (index == 2) {
      obscureText1.value = !obscureText1.value;
    } else if (index == 3) {
      obscureText2.value = !obscureText2.value;
    }
  }

  @override
  void onClose() {
    oldPasswordTextController.dispose();
    newPasswordTextController.dispose();
    verifyPasswordTextController.dispose();
    super.onClose();
  }
}
