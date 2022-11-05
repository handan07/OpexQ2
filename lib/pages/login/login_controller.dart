import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opexq/services/api_service.dart';
import 'package:opexq/services/storage_service.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/utils/utils.dart';

class LoginController extends GetxController {
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  late TextEditingController tenantTextController;
  late TextEditingController licenceTextController;

  final api = Get.find<ApiService>();

  final rememberMe = false.obs;
  var obscureText = true.obs;

  @override
  void onInit() async {
    emailTextController = TextEditingController(text: "");
    passwordTextController = TextEditingController(text: "");
    tenantTextController = TextEditingController(text: "");
    licenceTextController = TextEditingController(text: "");
    super.onInit();
  }

  @override
  void onReady() async {
    rememberMe.value =
        parseBool(await StorageService.get().readStorage("rememberMe"));
    if (rememberMe.value == true) {
      emailTextController.text =
          await StorageService.get().readStorage("userCode");
      passwordTextController.text =
          await StorageService.get().readStorage("password");
    }

    super.onReady();
  }

  void handleLogin() async {
    if (emailTextController.text == "") {
      showAlert("Please enter your usercode.");
      return;
    }

    if (passwordTextController.text == "") {
      showAlert("Pleas enter your password.");
      return;
    }

    // Future.wait([
    //   loadPriorities(),
    //   loadStates(),
    //   loadTypes(),
    //   loadSources(),
    //   loadChannels(),
    //   //loadPlaces(),
    //   //loadSubjects(),
    //   loadCurrencies()
    // ]);
    bool logged =
        await api.login(emailTextController.text, passwordTextController.text);
    if (logged) {
      _saveAccount(emailTextController.text, passwordTextController.text);
      passwordTextController.text = "";
      Get.offNamed(AppRoutes.home);
    }
  }

  void handleLicenceLogin() async {
    if (tenantTextController.text == "") {
      showAlert("Please enter your tenant code.");
      return;
    }

    if (licenceTextController.text == "") {
      showAlert("Pleas enter licence code.");
      return;
    }

    if (emailTextController.text == "") {
      showAlert("Please enter your usercode.");
      return;
    }

    if (passwordTextController.text == "") {
      showAlert("Pleas enter your password.");
      return;
    }
    bool logged = await api.appLogin(
        tenantTextController.text,
        licenceTextController.text,
        emailTextController.text,
        passwordTextController.text);

    if (logged) {
      _saveAccount(emailTextController.text, passwordTextController.text);
      passwordTextController.text = "";
      Get.offNamed(AppRoutes.home);
    }
  }

  togglePassword() {
    obscureText.value = !obscureText.value;
  }

  void _saveAccount(String userCode, String password) {
    if (rememberMe.value == true) {
      StorageService.get()
          .writeStorage("rememberMe", rememberMe.value.toString());
      StorageService.get().writeStorage("userCode", userCode);
      StorageService.get().writeStorage("password", password);
    } else {
      StorageService.get().deleteStorage("rememberMe");
      StorageService.get().deleteStorage("userCode");
      StorageService.get().deleteStorage("password");
    }
  }

  void forgetPassword() async {
    if (emailTextController.text == "") {
      showWarning("Please enter your mail address");
      return;
    }
    await api.forgotPassword(emailTextController.text);
  }

  // String userLocale() {
  //   String? userLocale = SettingsService.get().lang;
  //   return userLocale;
  // }

  // void changeTheme() {
  //   if (Get.isDarkMode) {
  //     Get.changeTheme(ThemeData.light());
  //     StorageService.get().writeStorage("darkTheme", true);
  //   } else {
  //     Get.changeTheme(ThemeData.dark());
  //     StorageService.get().writeStorage("darkTheme", false);
  //   }
  // }

  @override
  void onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    tenantTextController.dispose();
    licenceTextController.dispose();
    super.onClose();
  }
}
