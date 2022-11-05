// import 'package:flutter/material.dart';
// import 'package:opexq/pages/image/image_upload.dart';

// class TestPage extends StatefulWidget {
//   @override
//   _TestPageState createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   int currentIndex = 0;
//   String tit = 'Upload File';
//   String sub = 'Browse and chose the files you want to upload.';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.amber,
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => UploadScreen(1, '1', tit, sub)));
//           },
//           backgroundColor: Colors.amber,
//           child: Icon(
//             Icons.arrow_forward,
//             color: Colors.black,
//           ),
//         ),
//         body: ListView(children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(top: 15.0, left: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.arrow_back_ios),
//                   color: Colors.white,
//                   onPressed: () {},
//                 ),
//                 Container(
//                     width: 125.0,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         IconButton(
//                           icon: Icon(Icons.filter_list),
//                           color: Colors.white,
//                           onPressed: () {},
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.menu),
//                           color: Colors.white,
//                           onPressed: () {},
//                         )
//                       ],
//                     ))
//               ],
//             ),
//           ),
//           SizedBox(height: 25.0),
//           Padding(
//             padding: EdgeInsets.only(left: 40.0),
//             child: Row(
//               children: <Widget>[
//                 Flexible(
//                   child: email,
//                   fit: FlexFit.tight,
//                 ),
//                 SizedBox(width: 10.0),
//               ],
//             ),
//           ),
//           SizedBox(height: 40.0),
//           Container(
//               height: MediaQuery.of(context).size.height - 185.0,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(75.0),
//                     topRight: Radius.circular(75.0)),
//               ),
//               child: ListView(
//                   primary: false,
//                   padding: EdgeInsets.all(0.0),
//                   children: <Widget>[
//                     Padding(
//                         padding: EdgeInsets.only(top: 45.0),
//                         child: Container(
//                             height: MediaQuery.of(context).size.height - 300.0,
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("ToggleBar"),
//                                   Expanded(
//                                     child: GridView.count(
//                                       crossAxisCount: 2,
//                                       scrollDirection: Axis.vertical,
//                                       padding: EdgeInsets.all(25),
//                                       children: <Widget>[
//                                         myCard(Colors.amber, 'Voice recording'),
//                                         myCard(Colors.amberAccent, 'Rehersals'),
//                                         myCard(Colors.grey, 'Audio'),
//                                       ],
//                                     ),
//                                   )
//                                 ]))),
//                   ])),
//         ]));
//   }
// }

// Widget myCard(Color backgroundColor, String title) {
//   return Card(
//     color: backgroundColor,
//     elevation: 5,
//     margin: EdgeInsets.all(10),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
//     child: new InkWell(
//         onTap: () {},
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               SizedBox(height: 60),
//               Text(
//                 title,
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20.5,
//                 ),
//               ),
//               Text(
//                 '02/08/2020',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                   color: Colors.grey[800],
//                   fontWeight: FontWeight.w100,
//                   fontSize: 12.5,
//                 ),
//               ),
//             ],
//           ),
//         )),
//   );
// }

// final email = TextField(
//   autofocus: false,
//   style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
//   decoration: InputDecoration(
//     filled: true,
//     suffixIcon: Icon(Icons.search),
//     fillColor: Colors.white,
//     hintText: 'Search the file by name or type.',
//     contentPadding: const EdgeInsets.all(15),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.white),
//       borderRadius: BorderRadius.circular(25.7),
//     ),
//     enabledBorder: UnderlineInputBorder(
//       borderSide: BorderSide(color: Colors.white),
//       borderRadius: BorderRadius.circular(25.7),
//     ),
//   ),
// );
