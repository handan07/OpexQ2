// // import 'package:flutter/material.dart';
// // import 'package:flutter_html/flutter_html.dart';
// // import 'package:flutter_html_all/flutter_html_all.dart';

// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({Key? key, required this.title}) : super(key: key);

// //   final String title;

// //   @override
// //   _MyHomePageState createState() => new _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('flutter_html Example'),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Html(data: """
// //   <video controls>
// //     <source src="https://www.w3schools.com/html/mov_bbb.mp4" />
// //   </video>
// //  """, customRenders: {
// //           videoMatcher(): videoRender(),
// //         }
// //             //tagsList: Html.tags..remove(Platform.isAndroid ? "iframe" : "video"),
// //             //Optional parameters:

// //             // customRender: {
// //             //   "flutter": (RenderContext context!, Widget child, attributes, _) {
// //             //     return FlutterLogo(
// //             //       style: (attributes['horizontal'] != null)
// //             //           ? FlutterLogoStyle.horizontal
// //             //           : FlutterLogoStyle.markOnly,
// //             //       textColor: context.style.color,
// //             //       size: context.style.fontSize.size * 5,
// //             //     );
// //             //   },
// //             // },
// //             // onLinkTap: (url) {
// //             //   print("Opening $url...");
// //             // },
// //             // onImageTap: (src) {
// //             //   print(src);
// //             // },
// //             // onImageError: (exception, stackTrace) {
// //             //   print(exception);
// //             // },
// //             ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
// import 'package:form_builder_image_picker/form_builder_image_picker.dart';
// import 'package:get/get.dart';
// import 'package:opexq/models/selected_item_model.dart';
// import 'package:opexq/pages/form/widgets/form_widgets.dart';
// import 'package:opexq/utils/app_routes.dart';
// import 'package:opexq/utils/configuration.dart';
// import 'package:opexq/widgets/widgets.dart';

// class CustomFields extends StatefulWidget {
//   const CustomFields({Key? key}) : super(key: key);

//   @override
//   _CustomFieldsState createState() => _CustomFieldsState();
// }

// class ApiImage {
//   final String imageUrl;
//   final String id;
//   ApiImage({
//     required this.imageUrl,
//     required this.id,
//   });
// }

// class _CustomFieldsState extends State<CustomFields> {
//   final _formKey = GlobalKey<FormBuilderState>();
//   var options = ["Option 1", "Option 2", "Option 3"];
  

//   formBody() {
//     return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: FormBuilder(
//             key: _formKey,
//             autovalidateMode: AutovalidateMode.disabled,
//             initialValue: {
//               'tdescription': "deneme",
//               'tdate': DateTime.now()
//               // 'best_language': 'Dart',
//               // 'age': '13',
//               // 'gender': 'Male'
//             },
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
               
//                   formCard([
//                     FormBuilderImagePicker(
//                   name: 'photos',
//                   displayCustomType: (obj) =>
//                       obj is ApiImage ? obj.imageUrl : obj,
//                   decoration: const InputDecoration(labelText: 'Pick Photos'),
//                   bottomSheetPadding: EdgeInsets.only(bottom:50),
//                   maxImages: 1,
//                   onChanged: (images) {
//                     print("onChanged");
//                     print(images);
//                   },
//                   onImage: (image) {
//                     print("onImage");
//                     print(image);
//                   },
//                   onReset: () {
//                     print("reset");
//                   },
//                   // initialValue: [
//                   //   'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//                   //   const Text('this is an image\nas a widget !'),
//                   //   ApiImage(
//                   //     id: 'whatever',
//                   //     imageUrl:
//                   //         'https://images.pexels.com/photos/8311418/pexels-photo-8311418.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
//                   //   ),
//                   // ],
//                 ),
//                     formTag(
//                         "Place", "PLACEID", "PLACE", "PLACES", "ID", "PLACE"),
//                     FormBuilderFilterChip(
//                       name: 'filter_chip',
//                       decoration: InputDecoration(
//                         labelText: 'Select many options',
//                       ),
//                       options: [
//                         FormBuilderFieldOption(
//                             value: 'Test', child: Text('Test')),
//                         FormBuilderFieldOption(
//                             value: 'Test 1', child: Text('Test 1')),
//                         FormBuilderFieldOption(
//                             value: 'Test 2', child: Text('Test 2')),
//                         FormBuilderFieldOption(
//                             value: 'Test 3', child: Text('Test 3')),
//                         FormBuilderFieldOption(
//                             value: 'Test 4', child: Text('Test 4')),
//                       ],
//                     ),
                  
//                     formLookup(
//                         "Place", "PLACEID", "PLACE", "PLACES", "ID", "PLACE", _formKey),
//                     formLookup("Subject", "SUBJECTID", "SUBJECT",
//                         "CALL_SUBJECT", "ID", "SUBJECT", _formKey),
//                     formLookup("Priority", "PRIORITYID", "PRIORITY",
//                         "CALL_PRIORITY", "ID", "PRIORITY", _formKey),
//                     formLookup("Type", "TYPEID", "TICKETTYPE", "CALL_TYPE",
//                         "ID", "TICKETTYPE", _formKey),
//                     formBuilderDateTimePicker("Date", "TDATE", InputType.date, _formKey),
//                     formBuilderDateTimePicker("Time", "TTIME", InputType.time, _formKey),
//                     formLookup("Notifier Name", "NOTIFIERNAME", "NOTIFIERNAME",
//                         "VW_STDSTAFF", "UserName", "UserName", _formKey),
//                   ]),
//                   formCard([
//                     formLookup("Staff", "STAFFID", "STAFF", "VW_STDSTAFF", "ID",
//                         "UserName", _formKey),
//                     formLookup("Check List", "CHECKID", "CHECKNAME",
//                         "CHECK_LIST", "ID", "CHECKNAME", _formKey),
//                     formLookup("Source", "SOURCEID", "SOURCE", "CALL_SOURCES",
//                         "ID", "SOURCE", _formKey),
//                     formLookup("State", "STATEID", "STATE", "CALL_STATE", "ID",
//                         "STATE", _formKey),
//                     formLookup("Service Company", "SCOMPANYID", "SCOMPANY",
//                         "COMPANY", "ID", "CNAME", _formKey),
//                     formNumber("Amount", "AMOUNT"),
//                     formNumber("Repeat", "REPEAT"),
//                     formNumber("Grade", "GRADE"),
//                     formText("Logon", "RUSER", enabled: false),
//                     formBuilderDateTimePicker(
//                         "Record Date", "RDATE", InputType.both, _formKey,
//                         enabled: false),
//                     formText("Last Update User", "LUSER", enabled: false),
//                     formBuilderDateTimePicker(
//                         "Last Update Date", "LDATE", InputType.both, _formKey,
//                         enabled: false),
//                     formSwitch("Is Master?", "MASTERJOB", enabled: false),
                      
//                       Align(
//                         alignment: Alignment.center,
//                         child: FormBuilderImagePicker(
                         
//                           preventPop: true,
//                           cameraLabel: Text("Camera".tr),
//                           galleryLabel: Text("Gallery".tr),
//                           bottomSheetPadding: EdgeInsets.only(bottom: 50),
//                               name: 'photos',
//                               decoration: const InputDecoration(labelText: 'Pick Photos'),
//                               maxImages: 1,
//                             ),
//                       ),
//                   ]),
//                   formButtons()
//                 ])));
//   }

//   formButtons() {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           child: MaterialButton(
//             color: Theme.of(context).colorScheme.secondary,
//             child: const Text(
//               "Submit",
//               style: TextStyle(color: Colors.white),
//             ),
//             onPressed: () {
//               _formKey.currentState!.save();
//               if (_formKey.currentState!.validate()) {
//                 debugPrint(_formKey.currentState!.value.toString());
//               } else {
//                 debugPrint("validation failed");
//               }
//             },
//           ),
//         ),
//         const SizedBox(width: 20),
//         Expanded(
//           child: MaterialButton(
//             color: Theme.of(context).colorScheme.secondary,
//             child: const Text(
//               "Reset",
//               style: TextStyle(color: Colors.white),
//             ),
//             onPressed: () {
//               _formKey.currentState!.reset();
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//           child:
//               Padding(padding: const EdgeInsets.all(8.0), child: formBody())),
//     );
//   }
// }
