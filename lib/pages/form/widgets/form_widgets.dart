import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:opexq/models/selected_item_model.dart';
import 'package:opexq/pages/form/form_controller.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/utils/configuration.dart';

Widget formCard(List fields) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4.0),
    child: Card(
        margin: const EdgeInsets.only(top: 4),
        elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.only(bottom: 4, top: 4),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: fields.length,
              //separatorBuilder: (BuildContext context, int index) => greyline(),
              itemBuilder: (BuildContext context, int index) {
                return fields[index];
              },
            ))),
  );
}

formBuilderDateTimePicker(String label, String fieldName, InputType inputType,
    FormController controller,
    {bool? enabled}) {
  return Platform.isIOS
      ? FormBuilderCupertinoDateTimePicker(
          name: fieldName,
          initialValue: controller.formData[fieldName],
          inputType: inputType == InputType.date
              ? CupertinoDateTimePickerInputType.date
              : inputType == InputType.time
                  ? CupertinoDateTimePickerInputType.time
                  : CupertinoDateTimePickerInputType.both,
          decoration: InputDecoration(
            labelText: label.tr,
            suffixIcon: IconButton(
                icon: const Icon(Icons.close, size: 16),
                onPressed: () {
                  controller.formKey.currentState!.fields[fieldName]
                      ?.didChange(null);
                }),
          ),
          locale: Get.locale, //const Locale.fromSubtags(languageCode: 'en_GB'),
          enabled: enabled ?? true,
        )
      : FormBuilderDateTimePicker(
          name: fieldName,
          initialValue: controller.formData[fieldName],
          inputType: inputType, //InputType.time,
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: IconButton(
                icon: const Icon(Icons.close, size: 16),
                onPressed: () {
                  controller.formKey.currentState!.fields[fieldName]
                      ?.didChange(null);
                }),
          ),
          initialTime: const TimeOfDay(hour: 8, minute: 0),
          locale: Get.locale,  //const Locale.fromSubtags(languageCode: 'en_GB'),
          enabled: enabled ?? true,
        );
}

formLookup(
    String? label,
    String valueField,
    String textField,
    String lookupTable,
    String lookupValue,
    String lookupText,
    FormController controller,
    {dynamic onChanged,
    bool? isRequired}) {
  return FormBuilderTextField(
      name: textField,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label?.tr,
        suffixIcon: IconButton(
          icon: const Icon(Icons.close, size: 16),
          onPressed: () {
            controller.formData[valueField] = null;
            controller.formKey.currentState!.fields[textField]?.didChange(null);
            if (onChanged != null) {
              onChanged();
            }
          },
        ),
      ),
      validator: isRequired == null
          ? null
          : FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
      // valueTransformer: (value) {
      //   print('valueTransformer');
      //   print(valueField);
      //   print(fieldValue);
      //   return fieldValue;
      // },
      onTap: () async {
        String header = label ?? "Select";
        var result = await Get.toNamed("${AppRoutes.list}/select/0",
            arguments: [
              lookupTable,
              lookupValue,
              lookupText,
              header,
              valueField,
              "single"
            ]);
        if (result != null) {
          if (valueField == textField) {
            controller.formKey.currentState!.fields[textField]
                ?.didChange(result[0].text);
          } else {
            controller.formData[valueField] = result[0].id;
            controller.formKey.currentState!.fields[textField]
                ?.didChange(result[0].text);
          }
          if (onChanged != null) {
            onChanged();
          }
        }
      });
}

formGuestLookup(String? label, String valueField, String textField,
    FormController controller,
    {Function? onChanged}) {
  return FormBuilderTextField(
      name: textField,
      readOnly: true,
      decoration: InputDecoration(
        isDense: true,
        labelText: label?.tr,
        suffixIcon: IconButton(
          icon: const Icon(Icons.close, size: 16),
          onPressed: () {
            controller.formKey.currentState!.fields["CLIENTID"]
                ?.didChange(null);
            controller.formKey.currentState!.fields["ROOM"]?.didChange(null);
            controller.formKey.currentState!.fields["ADDRESS"]?.didChange(null);
            controller.formKey.currentState!.fields["COUNTRY"]?.didChange(null);
            controller.formKey.currentState!.fields["NATION"]?.didChange(null);
            controller.formKey.currentState!.fields["ZIPCODE"]?.didChange(null);
            controller.formKey.currentState!.fields["CITY"]?.didChange(null);
            controller.formKey.currentState!.fields["BDATE"]?.didChange(null);
            controller.formKey.currentState!.fields["PENSION"]?.didChange(null);
            controller.formKey.currentState!.fields["RESERVATIONID"]
                ?.didChange(null);
            controller.formKey.currentState!.fields["CHECKIN"]?.didChange(null);
            controller.formKey.currentState!.fields["CHECKOUT"]
                ?.didChange(null);
            controller.formKey.currentState!.fields["VIPCODE"]?.didChange(null);
            controller.formKey.currentState!.fields["AGENCY"]?.didChange(null);
            controller.formKey.currentState!.fields["TITLE"]?.didChange(null);
            controller.formKey.currentState!.fields["GENDER"]?.didChange(null);
            controller.formKey.currentState!.fields["REPEATCOUNT"]
                ?.didChange(null);
            controller.formKey.currentState!.fields["AGE"]?.didChange(null);
            controller.formKey.currentState!.fields["FIRSTNAME"]
                ?.didChange(null);
            controller.formKey.currentState!.fields["LASTNAME"]
                ?.didChange(null);
            controller.formKey.currentState!.fields["CLIENTNAME"]
                ?.didChange(null);
            controller.formKey.currentState!.fields["PHONE"]?.didChange(null);
            controller.formKey.currentState!.fields["CELL"]?.didChange(null);
            controller.formKey.currentState!.fields["EMAIL"]?.didChange(null);

            controller.formKey.currentState!.fields[valueField]
                ?.didChange(null);
            controller.formKey.currentState!.fields[textField]?.didChange(null);
          },
        ),
        // validator: FormBuilderValidators.compose([
        //   FormBuilderValidators.required(context),
        // ]),
      ),
      onChanged: (val) {
        if (onChanged != null) onChanged;
      },
      onTap: () async {
        var result =
            await Get.toNamed("${AppRoutes.list}/guestselect/0");
        if (result != null) {
          controller.formKey.currentState!.fields["CLIENTID"]
              ?.didChange(result.id);
          controller.formKey.currentState!.fields["ROOM"]
              ?.didChange(result.room);
          controller.formKey.currentState!.fields["ADDRESS"]
              ?.didChange(result.address);
          controller.formKey.currentState!.fields["COUNTRY"]
              ?.didChange(result.country);
          controller.formKey.currentState!.fields["NATION"]
              ?.didChange(result.nation);
          controller.formKey.currentState!.fields["ZIPCODE"]
              ?.didChange(result.zipcode);
          controller.formKey.currentState!.fields["CITY"]
              ?.didChange(result.city);
          controller.formKey.currentState!.fields["BDATE"]
              ?.didChange(DateTime.parse(result.bdate));
          controller.formKey.currentState!.fields["PENSION"]
              ?.didChange(result.pension);
          controller.formKey.currentState!.fields["RESERVATIONID"]
              ?.didChange(result.reservationid.toString());
          controller.formKey.currentState!.fields["CHECKIN"]
              ?.didChange(result.checkin);
          controller.formKey.currentState!.fields["CHECKOUT"]
              ?.didChange(result.checkout);
          controller.formKey.currentState!.fields["VIPCODE"]
              ?.didChange(result.vipcode);
          controller.formKey.currentState!.fields["AGENCY"]
              ?.didChange(result.agency);
          controller.formKey.currentState!.fields["TITLE"]
              ?.didChange(result.title);
          controller.formKey.currentState!.fields["GENDER"]
              ?.didChange(result.gender);
          controller.formKey.currentState!.fields["REPEATCOUNT"]
              ?.didChange(result.repeatcount.toString());
          controller.formKey.currentState!.fields["AGE"]
              ?.didChange(result.age.toString());
          controller.formKey.currentState!.fields["FIRSTNAME"]
              ?.didChange(result.firstname);
          controller.formKey.currentState!.fields["LASTNAME"]
              ?.didChange(result.lastname);
          controller.formKey.currentState!.fields["CLIENTNAME"]
              ?.didChange(result.clientname);
          controller.formKey.currentState!.fields["PHONE"]
              ?.didChange(result.phone);
          controller.formKey.currentState!.fields["CELL"]
              ?.didChange(result.cell);
          controller.formKey.currentState!.fields["EMAIL"]
              ?.didChange(result.email);
        }
      });
}

formStdLookup(String? label, String textField, String lookupTable,
    GlobalKey<FormBuilderState> formKey,
    {Function? onChanged}) {
  return FormBuilderTextField(
      name: textField,
      readOnly: true,
      decoration: InputDecoration(
        isDense: true,
        labelText: label?.tr,
        suffixIcon: IconButton(
          icon: const Icon(Icons.close, size: 16),
          onPressed: () {
            formKey.currentState!.fields[textField]?.didChange(null);
            //controller.formData[valueField] = null;
            //controller.formKey.currentState!.fields[textField]?.didChange(null);
            if (onChanged != null) {
              onChanged();
            }
          },
        ),
      ),
      // validator: FormBuilderValidators.compose([
      //   FormBuilderValidators.required(context),
      // ]),
      // validator: FormBuilderValidators.compose([
      //   FormBuilderValidators.required(context),
      // ]),
      onTap: () async {
        String header = label ?? "Select";
        var result = await Get.toNamed("${AppRoutes.list}/select/0",
            arguments: [
              lookupTable,
              "LOOKUPVALUE",
              "LOOKUPVALUE",
              header,
              "LOOKUPVALUE",
              "single"
            ]);
        if (result != null) {
          formKey.currentState!.fields[textField]?.didChange(result[0].text);
        }
      });
}

formTag(String? label, String valueField, String textField, String lookupTable,
    String lookupValue, String lookupText) {
  List<SelectedItem> selectList = [];
  return FormBuilderField<String?>(
    name: valueField,

    onChanged: (val) => debugPrint(val.toString()),
    builder: (FormFieldState field) {
      return Wrap(
        spacing: 6.0,
        runSpacing: 6.0,
        children: List.generate(selectList.length, (index) {
          return ChoiceChip(
              labelPadding: const EdgeInsets.all(2.0),
              label: Text(
                selectList[index].text,
                style: Get.context!.textTheme.bodyText2!
                    .copyWith(color: Colors.white, fontSize: 14),
              ),
              selected: true,
              selectedColor: Colors.deepPurple,
              onSelected: (value) {
                print(value);
              });
        }),
      );
    },
    // onTap: () async {
    //   String header = label ?? "Select";
    //   var result = await Get.toNamed(AppRoutes.list + "/select/0",
    //       arguments: [
    //         lookupTable,
    //         lookupValue,
    //         lookupText,
    //         header,
    //         valueField
    //       ]);
    //   if (result != null) {
    //     if (valueField == textField) {
    //       _formKey.currentState!.fields[textField]?.didChange(result.text);
    //     } else {
    //       _formKey.currentState!.fields[valueField]?.didChange(result.id);
    //       _formKey.currentState!.fields[textField]?.didChange(result.text);
    //     }
    //   }
    // }
  );
}

formText(String label, String fieldName,
    {bool? readOnly, bool? enabled, int? maxLines}) {
  return FormBuilderTextField(
    name: fieldName,
    maxLines: maxLines ?? 1,
    decoration: InputDecoration(
      isDense: true,
      labelText: label.tr,
    ),
    textInputAction: TextInputAction.next,
    readOnly: readOnly ?? false,
    enabled: enabled ?? true,
  );
}

formNumber(String label, String fieldName, FormController controller,
    {bool? readOnly, bool? enabled}) {
  return FormBuilderTextField(
    name: fieldName,
    initialValue: controller.formData[fieldName]?.toString(),
    decoration: InputDecoration(
      labelText: label.tr,
    ),
    valueTransformer: (text) => num.tryParse(text ?? "0"),
    // initialValue: '12',
    // validator: FormBuilderValidators.integer(Get.context!),
    keyboardType: TextInputType.number,
    textInputAction: TextInputAction.next,
    readOnly: readOnly ?? false,
    enabled: enabled ?? true,
  );
}

formSwitch(String label, String fieldName, {bool? enabled}) {
  return FormBuilderSwitch(
    title: Text(label.tr),
    name: fieldName,
    enabled: enabled ?? true,
  );
}

// formImage(String label, String fieldName) {
//   return FormBuilderImagePicker(
//     name: "fieldName",
//     // displayCustomType: (obj) =>
//     //     obj is ApiImage ? obj.imageUrl : obj,
//     decoration: InputDecoration(labelText: label),
//     bottomSheetPadding: const EdgeInsets.only(bottom: 50),
//     maxImages: 1,
//     onChanged: (images) {
//       debugPrint("onChanged");
//       debugPrint(images.toString());
//     },
//     onImage: (image) {
//       debugPrint("onImage");
//       debugPrint(image.toString());
//     },
//     onReset: () {
//       debugPrint("reset");
//     },
//     // initialValue: [
//     //   'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//     //   const Text('this is an image\nas a widget !'),
//     //   ApiImage(
//     //     id: 'whatever',
//     //     imageUrl:
//     //         'https://images.pexels.com/photos/8311418/pexels-photo-8311418.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
//     //   ),
//     // ],
//   );
// }

Widget selectChip(String label, Color color) {
  return InputChip(
    padding: const EdgeInsets.all(2.0),
    label: Text(label, style: TextStyle(color: grey)),
    onDeleted: () {
      print("delete");
    },
  );
}
