import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:opexq/models/list_model.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';

Widget menuGrid() {
  List<ListPage> menuPages = listPages
      .where((element) => element.visible == true)
      .toList()
      .cast<ListPage>();

  Widget menuIcon(ListPage item) {
    return GestureDetector(
        onTap: () => goToList(item.name),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(8),
                  width: 45,
                  height: 45,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(appIcons[item.name],
                        color: appColors[item.name], size: 40.0),
                  ))),
              //const SizedBox(height: 0),
              AutoSizeText(
                item.header.tr,
                maxLines: 1,
                style: subtitle1,
              ),
            ]));
  }

  Widget singleMenu(item) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () => goToList(item.name),
        child:Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        child:
            Padding(padding: const EdgeInsets.all(10.0), child: menuIcon(item)),
      ),
    ));
  }

  Widget tripleMenu(item) {
    ListPage itemResource = listPages.singleWhere((element) => element.id == 7);
    ListPage itemActivity = listPages.singleWhere((element) => element.id == 8);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        color: Colors.white,
                        //elevation: 1.0,
                        borderRadius: BorderRadius.circular(8.0),
                        //shadowColor: Color(0x802196F3),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              menuIcon(item),
                              const SizedBox(width: 10),
                              menuIcon(itemResource),
                              const SizedBox(width: 10),
                              menuIcon(itemActivity),
                            ])),
                  ]))),
    );
  }

  Widget doubleMenu(item) {
    ListPage itemSurvey = listPages.singleWhere((element) => element.id == 22);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        color: Colors.white,
                        //elevation: 1.0,
                        borderRadius: BorderRadius.circular(8.0),
                        //shadowColor: Color(0x802196F3),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              menuIcon(item),
                              const SizedBox(width: 8),
                              menuIcon(itemSurvey),
                            ]))
                  ]))),
    );
  }

  Widget buildTile(ListPage item) {
    if (item.id == 2) {
      return doubleMenu(item);
    } else if (item.id == 6) {
      return tripleMenu(item);
    } else {
      return singleMenu(item);
    }
  }

  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: SingleChildScrollView(
        child: StaggeredGrid.count(
            crossAxisCount: 3,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            //staggeredTiles: _cardTile,
            children: [
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: buildTile(menuPages[0])),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: buildTile(menuPages[1]),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: buildTile(menuPages[2]),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: buildTile(menuPages[3]),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: buildTile(menuPages[4]),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 1,
            child: buildTile(menuPages[5]),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: buildTile(menuPages[6]),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: buildTile(menuPages[7]),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: buildTile(menuPages[8]),
          ),
        ])),
  );
}
