import 'package:flutter/material.dart';

Widget counter(int count) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      GestureDetector(
        onTap: () {
          //_count += 1;
        },
        child: Container(
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(),
          ),
          child: const Icon(Icons.add),
        ),
      ),
      const SizedBox(width: 15.0),
      Text("$count"),
      const SizedBox(width: 15.0),
      GestureDetector(
        onTap: () {
          // _count -= 1;
        },
        child: Container(
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(),
          ),
          child: const Icon(Icons.remove),
        ),
      ),
    ],
  );
}
