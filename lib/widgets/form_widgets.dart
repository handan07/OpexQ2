import 'package:flutter/material.dart';
import 'package:opexq/widgets/widgets.dart';


// Widget formClientSelectList(
//     String dataField, List<LookupItem> selectedItemList, Function onTap) {
//   return FormBuilderField(
//     name: dataField,
//     builder: (FormFieldState<dynamic> field) {
//       return InputDecorator(
//         decoration: InputDecoration(
//           suffixIcon: GestureDetector(
//               onTap: onTap, child: Icon(FontAwesome.hand_pointer_o)),
//           contentPadding: EdgeInsets.all(4),
//           isDense: true,
//           border: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//             borderSide: BorderSide.none,
//           ),
//           fillColor: Colors.white,
//           filled: true,
//         ),
//         child: chipList(selectedItemList),
//       );
//     },
//   );
// }

// Widget formDatePicker(String dataField, {dynamic initialValue}) {
//   return FormBuilderDateTimePicker(
//     name: dataField,
//     textInputAction: TextInputAction.done,
//     initialValue: initialValue ?? DateTime.now(),
//     inputType: InputType.date,
//     decoration:
//         const InputDecoration(suffixIcon: Icon(FontAwesomeIcons.calendarWeek)),
//     initialTime: const TimeOfDay(hour: 8, minute: 0),
//     //pickerType: PickerType.cupertino,
//     format: DateFormat("yyyy-MM-dd"),
//     //locale: Locale.fromSubtags(languageCode: 'es'),
//   );
// }

// Widget formTimePicker(String dataField, {dynamic initialValue}) {
//   return FormBuilderDateTimePicker(
//     name: dataField,
//     textInputAction: TextInputAction.done,
//     initialValue: initialValue ?? DateTime.now(),
//     inputType: InputType.time,
//     decoration: const InputDecoration(suffixIcon: Icon(FontAwesomeIcons.clock)),
//     initialTime: const TimeOfDay(hour: 8, minute: 0),
//     //pickerType: PickerType.cupertino,
//     format: DateFormat("HH:MM"),
//     //locale: Locale.fromSubtags(languageCode: 'es'),
//   );
// }

// class AppBarEdit extends StatelessWidget implements PreferredSizeWidget {
//   final String? header;
//   final String? color;
//   final TabController? tabController;
//   final List<String>? tabs;
//   final dynamic handleTabChange;

//   const AppBarEdit(this.header, this.color, this.tabController,
//       {Key? key, this.tabs, this.handleTabChange})
//       : super(key: key);

//   @override
//   Size get preferredSize => const Size.fromHeight(100);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: backButton(),
//       title: appBarHeader(header),
//       bottom: tabs != null
//           ? TabBar(
//               onTap: handleTabChange,
//               indicatorColor: appColors[color]
//                   ?.withOpacity((6 + 2) / 10), //appColors[color],
//               indicatorWeight: 4.0,
//               isScrollable: true,
//               controller: tabController,
//               tabs: appBarTabs(),
//             )
//           : null,
//     );
//   }
// }

Widget chipItem(String label, Function()? onDeleted) {
  return Chip(
      labelPadding: const EdgeInsets.all(2.0),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey[200],
      elevation: 0.0,
      //shadowColor: Colors.grey[60],
      padding: const EdgeInsets.all(8.0),
      deleteIcon: const Icon(Icons.cancel, color: Colors.black54),
      onDeleted: () => onDeleted);
}

// Widget chipList(List<LookupItem> list) {
//   removeItem(item) {
//     //_controller.subjectList.value.removeWhere((item) => item.id == item.id);
//   }

//   return Wrap(
//       spacing: 6.0,
//       runSpacing: 6.0,
//       children: list
//           .map((item) => chipItem(item.text, () => removeItem(item)))
//           .toList());
// }

List<Widget> formClientData() {
  return [
    //formLabel('Select Client'),
    // formDropDown("CLIENTNAME", "label", ""),
    // formLabel('Phone'),
    // formInput("PHONE"),
    // formLabel('Mobile'),
    // formInput("CELL"),
    // formLabel('EMail'),
    // formInput("EMAIL"),
    // formLabel('Gender'),
    // formInput("GENDER"),
    // formLabel('CheckIn'),
    // formInput("CHECKIN"),
    // formLabel('CheckOut'),
    // formInput("CHECKOUT"),
    // formLabel('Agency'),
    // formInput("AGENCY"),
    // formLabel('Vip Code'),
    // formInput("VIPCODE"),
    // formLabel('Address'),
    // formInput("ADDRESS"),
    // formLabel('City'),
    // formInput("CITY"),
    // formLabel('Country'),
    // formInput("COUNTRY"),
    // formLabel('Nationality'),
    // formInput("NATION"),
    // formLabel('ReservationId'),
    // formInput("RESERVATIONID"),
    // formLabel('Age'),
    // formInput("AGE"),
    // formLabel('Repeat'),
    // formInput("REPEAT"),
  ];
}

// Widget formImagePicker(String dataField, var uploadImage) {
//   return FormBuilderImagePicker(
//     placeholderImage: AssetImage('assets/images/camera_black.jpeg'),
//     name: dataField,
//     decoration: const InputDecoration(
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(12.0)),
//         borderSide: BorderSide.none,
//       ),
//       fillColor: Colors.white,
//       //filled: true
//     ),
//     maxImages: 1,
//     onSaved: (e) {
//       try {
//         var selectedImg = e.first;
//         var imageBytes = selectedImg.readAsBytesSync(); // convert to bytes
//         var base64Image = base64Encode(imageBytes); // convert to string
//         uploadImage = base64Image;
//       } catch (exp) {
//         print(exp);
//       }
//     },
//     bottomSheetPadding: EdgeInsets.all(50),
//     cameraIcon: Icon(FontAwesome.camera_retro, size: 40),
//     galleryIcon: Icon(FontAwesome.file_image_o, size: 40),
//     cameraLabel: Text("Camera".tr),
//     galleryLabel: Text("Galery".tr),
//     onImage: (val) {
//       print(val);
//     },
//   );
// }

//new
Widget formCard(List fields) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Card(
        margin: const EdgeInsets.only(top: 4),
        elevation: 0.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.only(bottom: 12, top: 4),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: fields.length,
              separatorBuilder: (BuildContext context, int index) => greyline(),
              itemBuilder: (BuildContext context, int index) {
                return fields[index];
              },
            ))),
  );
}

// Widget textCard(List<FormFieldConfig> fields) {
//   return Card(
//       margin: const EdgeInsets.only(top: 8),
//       elevation: 0.0,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 25),
//           child: ListView.separated(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: fields.length,
//             separatorBuilder: (BuildContext context, int index) => greyline(),
//             itemBuilder: (BuildContext context, int index) {
//               return GetFormText(config: fields[index]);
//             },
//           )));
// }
