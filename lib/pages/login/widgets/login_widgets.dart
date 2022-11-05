import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget loginDivider() {
  return Container(
    width: 250.0,
    height: 1.0,
    color: Colors.grey[400],
  );
}

Widget loginInput(IconData icon, String hint, FocusNode focusNode,
    TextEditingController textController) {
  return Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 8, left: 25.0, right: 25.0),
    child: TextField(
      focusNode: focusNode,
      controller: textController,
      textInputAction: TextInputAction.done,
      autocorrect: false,
      //style: TextStyle(fontSize: 14.0, color: Colors.black),
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        icon: Icon(
          icon,
          color: Colors.black54,
        ),
        hintText: hint.tr,
        hintStyle: const TextStyle(fontSize: 14.0),
      ),
    ),
  );
}

Widget loginInputPassword(FocusNode? focusNode,
    TextEditingController textController, bool obscureText, dynamic onTap,
    {String? hint, IconData? icon}) {
  return Padding(
    padding: const EdgeInsets.only(top: 0, bottom: 0, left: 25.0, right: 25.0),
    child: TextField(
        focusNode: focusNode,
        controller: textController,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: Icon(
            icon ?? FontAwesomeIcons.lock,
            color: Colors.black54,
          ),
          hintText: hint == null ? "Password".tr : hint.tr,
          hintStyle: const TextStyle(fontSize: 14.0),
          suffix: IconButton(
            onPressed: onTap,
            icon: Icon(
                obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                size: 15.0,
                color: Colors.black87),
          ),
        ),
        textInputAction: TextInputAction.done),
  );
}

Widget loginButton(String title, dynamic onPressed) {
  return Container(
    margin: const EdgeInsets.only(top: 260.0),
    decoration: const BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
          child: Text(
            title.tr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        )),
  );
}
