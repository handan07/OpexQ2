import 'package:flutter/material.dart';
import 'package:opexq/models/comment_model.dart';
import 'package:opexq/utils/utils.dart';

Card dataItem(Comment item) => Card(
      elevation: 1.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: dataItemTile(item),
      ),
    );

ExpansionTile dataItemTile(Comment item) => ExpansionTile(
    //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: SizedBox(
      width: 60,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(7.0),
            decoration: BoxDecoration(
                color: item.typeid == 1
                    ? Colors.green
                    : item.typeid == 2
                        ? Colors.red
                        : Colors.yellow,
                shape: BoxShape.circle),
            child: Icon(
                item.typeid == 1
                    ? Icons.thumb_up
                    : item.typeid == 2
                        ? Icons.thumb_down
                        : Icons.settings_outlined,
                color: Colors.white),
          ),
          //SizedBox(height: 8),
          Text(parseString(item.type)),
        ],
      ),
    ),
    title: Text(
      parseString(item.place),
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Column(children: <Widget>[
      Align(
        alignment: Alignment.topLeft,
        child: Text(parseString(item.commentitem)),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Text(parseString(item.comment)),
      ),
      Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: <Widget>[
              Text(parseString(item.state)),
              Text(parseString(item.state)),
            ],
          )),
    ]));
