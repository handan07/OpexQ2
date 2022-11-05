import 'package:flutter/material.dart';

class RadioListBuilder extends StatefulWidget {
  final int? groupValue;
  final List<String>? itemList;

  const RadioListBuilder({Key? key, this.groupValue, this.itemList})
      : super(key: key);

  @override
  RadioListBuilderState createState() {
    return RadioListBuilderState();
  }
}

class RadioListBuilderState extends State<RadioListBuilder> {
  int? value;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return RadioListTile(
          value: index,
          groupValue: widget.groupValue,
          onChanged: (value) => setState(() => value = value),
          title: Text(widget.itemList![index]),
        );
      },
      itemCount: widget.itemList!.length,
    );
  }
}
