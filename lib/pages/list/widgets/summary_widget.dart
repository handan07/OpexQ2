import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opexq/models/summary_model.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/widgets/widgets.dart';

summaryScreen(List<Summary> sumlist, List<Summary> sumlist1, Color color,
    dynamic handleTabChange) {
  Widget homeListMenu(int index) {
    return ListTile(
        leading: Text(sumlist1[index].amount.toString(), style: headline3),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black54,
        ),
        title: Text(sumlist1[index].title, style: headline5),
        onTap: () {
          handleTabChange(sumlist1[index].id);
        });
  }

  Widget listMenu() {
    return sumlist1.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, index) => greyline(),
            itemCount: sumlist1.length,
            itemBuilder: (_, index) => homeListMenu(index))
        : Container();
  }

  GridView summaryGrid() {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(12),
      crossAxisCount: 3,
      children: List.generate(sumlist.length >= 6 ? 6 : sumlist.length, (i) {
        return InkWell(
            hoverColor: Colors.red,
            child: Container(
              padding: const EdgeInsets.all(8),
              //Center(child: ),
              color: color.withOpacity((i + 2) / 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    sumlist[i].amount.toString(),
                    style: const TextStyle(fontSize: 36),
                  ),
                  const SizedBox(height: 8),
                  Text(sumlist[i].title)
                ],
              ),
            ), //i == 0 ? [50] : color[i * 100]),
            onTap: () {
              handleTabChange(sumlist[i].id);
            });
      }),
    );
  }

  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: Get.size.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            summaryGrid(),
            Obx(() => listMenu())
          ]));
}
