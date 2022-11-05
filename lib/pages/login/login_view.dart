import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/login/login_controller.dart';
import 'package:opexq/pages/login/theme.dart';
import 'package:opexq/pages/login/widgets/login_widgets.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: Get.height,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              width: Get.size.width,
              height: Get.size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[
                      CustomTheme.loginGradientStart,
                      CustomTheme.loginGradientEnd
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 1.0),
                    stops: <double>[0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: Get.size.height > 800 ? 75 : 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image(
                        height: Get.size.height > 800 ? 180 : 120,
                        fit: BoxFit.fill,
                        image: const AssetImage('assets/images/login.png')),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 23.0),
                    child: Column(children: <Widget>[
                      Card(
                        elevation: 2.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: SizedBox(
                          width: 300.0,
                          //height: 150.0,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 12),
                              loginInput(
                                  FontAwesomeIcons.userLarge,
                                  'Usercode',
                                  focusNodeEmail,
                                  controller.emailTextController),
                              loginDivider(),
                              Obx(() => loginInputPassword(
                                  focusNodePassword,
                                  controller.passwordTextController,
                                  controller.obscureText.value,
                                  () => controller.togglePassword())),
                              const SizedBox(height: 20)
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                          offset: const Offset(0, -30),
                          child: circleButton(
                              icon: FontAwesomeIcons.arrowRight,
                              onTap: () => controller.handleLogin(),
                              color: kPrimaryColor)),
                    ]),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          TextButton(
                              onPressed: () {
                                controller.rememberMe.value =
                                    !controller.rememberMe.value;
                              },
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Obx(() => Checkbox(
                                        checkColor: kPrimaryColor,
                                        value: controller.rememberMe.value,
                                        onChanged: (value) {
                                          controller.rememberMe.value =
                                              toBool(value);
                                        })),
                                    Text('Remember Me'.tr,
                                        style: TextStyle(
                                          color: grey,
                                          fontSize: 14.0,
                                        )),
                                  ])),
                          TextButton(
                              onPressed: () => controller.forgetPassword(),
                              child: Text(
                                'Forgot Password?'.tr,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14.0,
                                ),
                              ))
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
