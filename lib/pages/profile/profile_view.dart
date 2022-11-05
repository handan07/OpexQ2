import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/login/widgets/login_widgets.dart';
import 'package:opexq/pages/profile/profile_controller.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/widgets/appbar_widget.dart';
import 'package:opexq/widgets/button_widgets.dart';

import '../../services/storage_service.dart';

class ProfileView extends StatelessWidget {
  final ProfileController _controller = Get.put(ProfileController());

  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => _controller.isReady.value == false
        ? const CircularProgressIndicator()
        : Scaffold(
            appBar: const AppBarApp(
              header: "Profile",
              tabs: [],
            ),
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        color: Colors.white),
                    child: Column(
                      children: <Widget>[
                        Hero(
                          transitionOnUserGestures: true,
                          tag: _controller.userName.value,
                          child: CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            maxRadius: 40,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: _controller.picture.value == ""
                                    ? Image.asset(
                                        "assets/images/onboarding_1.png")
                                    : Image.network(_controller.picture.value)),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          _controller.userName.value,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          _controller.company.value,
                          style:
                              const TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            makeUserWidgets(_controller.department.value),
                            Container(
                              width: 2,
                              height: 15,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              color: Colors.grey[500],
                            ),
                            makeUserWidgets(_controller.departmentGroup.value),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        makeActionButtons()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          // decoration: BoxDecoration(
                          //     border: Border(
                          //         bottom: BorderSide(
                          //   color: Colors.grey[300],
                          // ))),
                          child: _controller.selectedMenu.value == 1
                              ? settings()
                              : changePassword(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // bottomNavigationBar: bottomNavigationBar(
            //     _controller.selectedIndex.value,
            //     _controller.bottomMenuHandle)
          ));
  }

  Widget settings() {
    return Card(
        elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            width: 300.0,
            // height: 200.0,
            child: ListView(shrinkWrap: true, children: <Widget>[
              ListTile(
                title: Text("Language".tr),
                leading: const Icon(FontAwesomeIcons.globe),
                trailing: DropdownButton<String>(
                  value: Get.find<StorageService>().lang.toUpperCase(),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    Get.find<StorageService>()
                        .writeStorage("lang", newValue!.toLowerCase());
                    //AppController controller = Get.find();
                    //controller.updateLocale(newValue ?? "tr");
                  },
                  items: <String>['EN', 'TR']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    );
                  }).toList(),
                ),
              ),
              ListTile(
                  title: Text("Notification".tr),
                  leading: const Icon(FontAwesomeIcons.bell),
                  trailing: Switch(
                      value: _controller.allowNotification.value,
                      onChanged: (value) {
                        _controller.handleNotificationSettings(value);
                      })),
              ListTile(
                  title: Text("Dark Theme".tr),
                  leading: const Icon(FontAwesomeIcons.diaspora),
                  trailing: Switch(
                      value: _controller.darkTheme.value,
                      onChanged: (value) {
                        _controller.handleThemeSettings(value);
                      }))
            ])));
  }

  Widget changePassword() {
    return Card(
        elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: 300.0,
            // height: 200.0,
            child: Column(children: <Widget>[
              loginInputPassword(
                  null,
                  _controller.oldPasswordTextController,
                  _controller.obscureText.value,
                  () => _controller.togglePassword(1),
                  icon: FontAwesomeIcons.lockOpen),
              loginDivider(),
              loginInputPassword(
                  null,
                  _controller.newPasswordTextController,
                  _controller.obscureText1.value,
                  () => _controller.togglePassword(2),
                  hint: "New Password"),
              loginDivider(),
              loginInputPassword(
                  null,
                  _controller.verifyPasswordTextController,
                  _controller.obscureText2.value,
                  () => _controller.togglePassword(3),
                  hint: "Verify Password"),
              Transform.translate(
                  offset: const Offset(0, 25),
                  child: circleButton(
                      icon: FontAwesomeIcons.check,
                      onTap: () => _controller.handleChangePassword(),
                      color: Colors.red))
            ])));
  }

  Widget makeUserWidgets(name) {
    return Text(
      name ?? "Undefined".tr,
      style: const TextStyle(fontSize: 15, color: Colors.grey),
    );
    // return Row(
    //   children: <Widget>[
    //     Icon(FontAwesomeIcons.cog, color: Colors.black54),
    //     SizedBox(
    //       width: 5,
    //     ),
    //     Text(
    //       name ?? "Undefined".tr,
    //       style: TextStyle(fontSize: 15, color: Colors.grey),
    //     ),
    //   ],
    // );
  }

  Widget makeActionButtons() {
    return Transform.translate(
      offset: const Offset(0, 20),
      child: Container(
        height: 65,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, blurRadius: 20, offset: Offset(0, 10))
            ]),
        child: Row(
          children: <Widget>[
            Expanded(
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    height: double.infinity,
                    elevation: 0,
                    onPressed: () => _controller.handleMenuTap(1),
                    color: _controller.selectedMenu.value == 1
                        ? kPrimaryColor
                        : Colors.transparent,
                    child: Text(
                      "Settings".tr,
                      style: TextStyle(
                          color: _controller.selectedMenu.value == 1
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w400),
                    ))),
            Expanded(
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: double.infinity,
                  elevation: 0,
                  onPressed: () => _controller.handleMenuTap(2),
                  color: _controller.selectedMenu.value == 2
                      ? kPrimaryColor
                      : Colors.transparent,
                  child: Text(
                    "Change Password".tr,
                    style: TextStyle(
                        color: _controller.selectedMenu.value == 2
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w400),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
