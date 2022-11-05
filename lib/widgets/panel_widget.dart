import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opexq/utils/configuration.dart';

Widget panel({String? caption, String? detail, Widget? child}) {
  return Container(
    width: Get.width,
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(12),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    //color: Colors.white,
    child: ExpansionTile(
        // leading: Container(
        //     padding: EdgeInsets.all(8.0),
        //     decoration: BoxDecoration(
        //       color: Colors.grey[100],
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: Text("25")),
        initiallyExpanded: false,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(caption!.tr, style: headline6),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: detail == null
                    ? Container()
                    : Text(detail.tr, style: headline6),
              )
            ]),
        children: <Widget>[
          Container(child: child),
        ]),
  );
}
