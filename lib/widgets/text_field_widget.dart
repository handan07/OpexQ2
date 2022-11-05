import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

Widget textField(
    {String? label,
    String? value,
    IconData? icon,
    dynamic onTap,
    int? maxLines}) {
  return Padding(
    padding: const EdgeInsets.only(top: 4, left: 6, right: 6),
    child: TextFormField(
      initialValue: value ?? "",
      maxLines: maxLines ?? 1,
      readOnly: true,
      autocorrect: true,
      textInputAction: TextInputAction.done,
      enabled: true,
      onTap: () => onTap,
      decoration: InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.all(6),
        alignLabelWithHint: true,
        errorMaxLines: 1,
        icon: icon != null ? Icon(icon, size: 20).paddingOnly(top: 2) : null,
        // suffixIconConstraints:
        //     const BoxConstraints(maxWidth: 24, maxHeight: 24),
        // suffixIcon: getSuffix()
      ),
    ),
  );
}
