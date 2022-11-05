import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/list_model.dart';
import 'package:opexq/widgets/widgets.dart';

sortScreen(ListPage page, String listSortField, dynamic handleSort) {
  Widget sortItem(int index) {
    return ListTile(
        // leading: Text(
        //   page.sort![index],
        //   style: const TextStyle(
        //     fontSize: 22,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black54,
        //   ),
        // ),
        leading: listSortField == page.sort[index]
            ? const Icon(
                FontAwesomeIcons.squareCheck,
                color: Colors.black54,
              )
            : const Icon(
                FontAwesomeIcons.square,
                color: Colors.black54,
              ),
        title: Text(
          page.sort[index],
          style: Get.textTheme.subtitle2,
        ),
        onTap: () {
          handleSort(page.sort[index]);
          Get.back();
        });
  }

  return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, index) => greyline(),
      itemCount: page.sort.length,
      padding: const EdgeInsets.all(4),
      itemBuilder: (_, index) => sortItem(index));
}
