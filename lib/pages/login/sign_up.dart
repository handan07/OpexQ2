import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/pages/login/login_controller.dart';
import 'package:opexq/pages/login/theme.dart';
import 'package:opexq/pages/login/widgets/login_widgets.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/widgets/button_widgets.dart';

class SignUpView extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());

  final FocusNode focusNodeTenant = FocusNode();
  final FocusNode focusNodeLicence = FocusNode();
  final FocusNode focusNodeUserCode = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        // child: GestureDetector(
        //   onTap: () {
        //     FocusScope.of(context).requestFocus(FocusNode());
        //   },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                              FontAwesomeIcons.hotel,
                              "Client No",
                              focusNodeTenant,
                              _controller.tenantTextController),
                          loginDivider(),
                          loginInput(
                              FontAwesomeIcons.key,
                              "Licence Code",
                              focusNodeLicence,
                              _controller.licenceTextController),
                          loginDivider(),
                          loginInput(
                              FontAwesomeIcons.userLarge,
                              "Usercode",
                              focusNodeUserCode,
                              _controller.emailTextController),
                          loginDivider(),
                          Obx(() => loginInputPassword(
                              focusNodePassword,
                              _controller.passwordTextController,
                              _controller.obscureText.value,
                              () => _controller.togglePassword())),
                          const SizedBox(height: 16),
                          //                       Transform.translate(
                          //                           offset: const Offset(0, -20),
                          //                           child: circleButton(
                          //                               icon: FontAwesomeIcons.arrowRight,
                          //                               onTap:
                          //                                   _controller.handleLicenceLogin,
                          //                               color: Colors.blue[700]))
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                      offset: const Offset(0, -30),
                      child: circleButton(
                          icon: FontAwesomeIcons.arrowRight,
                          onTap: () => _controller.handleLicenceLogin(),
                          color: kPrimaryColor)),
                ]),
              ),
              // Expanded(
              //   flex: 2,
              //   child: ConstrainedBox(
              //     constraints: const BoxConstraints.expand(),
              //     child: Container(
              //       padding: const EdgeInsets.only(top: 25.0),
              //       child: Column(
              //         children: <Widget>[
              //           Stack(
              //             alignment: Alignment.topCenter,
              //             children: <Widget>[
              //               Card(
              //                 elevation: 2.0,
              //                 color: Colors.white,
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(8.0),
              //                 ),
              //                 child: SizedBox(
              //                   width: 300.0,
              //                   height: 320.0,
              //                   child: Column(
              //                     children: <Widget>[
              //                       loginInput(
              //                           FontAwesomeIcons.hotel,
              //                           "Client No",
              //                           focusNodeTenant,
              //                           _controller.tenantTextController),
              //                       loginDivider(),
              //                       loginInput(
              //                           FontAwesomeIcons.key,
              //                           "Licence Code",
              //                           focusNodeLicence,
              //                           _controller.licenceTextController),
              //                       loginDivider(),
              //                       loginInput(
              //                           FontAwesomeIcons.userAlt,
              //                           "Usercode",
              //                           focusNodeUserCode,
              //                           _controller.emailTextController),
              //                       loginDivider(),
              //                       Obx(() => loginInputPassword(
              //                           focusNodePassword,
              //                           _controller.passwordTextController,
              //                           _controller.obscureText.value,
              //                           () => _controller.togglePassword())),
              //                       const SizedBox(height: 16),
              //                       Transform.translate(
              //                           offset: const Offset(0, -20),
              //                           child: circleButton(
              //                               icon: FontAwesomeIcons.arrowRight,
              //                               onTap:
              //                                   _controller.handleLicenceLogin,
              //                               color: Colors.blue[700]))
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               // Transform.translate(
              //               //     offset: const Offset(0, 225),
              //               //     child: circleButton(
              //               //         icon: FontAwesomeIcons.arrowRight,
              //               //         onTap: () =>
              //               //             _controller.handleLicenceLogin(),
              //               //         color: Colors.blue[700])),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
