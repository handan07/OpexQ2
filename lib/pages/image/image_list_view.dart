import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/documents_model.dart';
import 'package:opexq/pages/image/image_list_controller.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/appbar_widget.dart';
import 'package:opexq/widgets/button_widgets.dart';
import 'package:opexq/widgets/drawer_widget.dart';

class ImageListView extends StatelessWidget {
  final ImageListController _controller = Get.put(ImageListController());

  ImageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarApp(
          header: "Documents & Images",
          tabs: [],
        ),
        endDrawer: const DrawerWidget(),
        body: Obx(
          () => ListView.builder(
              controller: _controller.scrollController,
              itemCount: _controller.datalist.length,
              itemBuilder: (context, index) {
                return itemWidget(_controller.datalist[index]);
              }),
        ),
        floatingActionButton: circleButton(
            icon: FontAwesomeIcons.plus,
            //onTap: () => uploadImage(),
            color: kPrimaryColor),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }

  Widget itemWidget(Document item) {
    return GestureDetector(
      onTap: () => openImage(item.fileurl),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          //margin: EdgeInsets.only(bottom: 24),
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Hero(
              tag: item.id!,
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  height: 210,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(item.fileurl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    //color: Colors.black,
                    padding: const EdgeInsets.all(12),
                    //decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Colors.transparent,
                    //     Colors.black.withOpacity(0.6),
                    //   ],
                    // ),
                    //),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                item.title ?? "",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                item.mimetype!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );

    // AspectRatio(
    //     aspectRatio: 1.5 / 1,
    //     child: Column(children: <Widget>[
    //       Expanded(
    //         child: Container(
    //             margin: EdgeInsets.all(16),
    //             decoration: BoxDecoration(
    //                 image: DecorationImage(
    //                     image: NetworkImage(item.fileurl), fit: BoxFit.fill),
    //                 borderRadius: BorderRadius.circular(20),
    //                 color: Colors.orange),
    //             child: Stack(
    //                 alignment: AlignmentDirectional.bottomCenter,
    //                 children: <Widget>[
    //                   // ClipRRect(
    //                   //   borderRadius: BorderRadius.circular(20),
    //                   //   child: BackdropFilter(
    //                   //     filter: Ima  //ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    //                   //     child: Container(
    //                   //         height: 90,
    //                   //         padding: EdgeInsets.symmetric(horizontal: 20),
    //                   //         width: double.infinity,
    //                   //         decoration: BoxDecoration(
    //                   //           borderRadius: BorderRadius.circular(24),
    //                   //         ),
    //                   //         child: Column(
    //                   //           mainAxisAlignment: MainAxisAlignment.center,
    //                   //           crossAxisAlignment: CrossAxisAlignment.start,
    //                   //           children: <Widget>[
    //                   //             Text(
    //                   //               item.fileurl,
    //                   //               style: TextStyle(
    //                   //                   color: Colors.white,
    //                   //                   fontWeight: FontWeight.w600,
    //                   //                   fontSize: 15),
    //                   //             ),
    //                   //             SizedBox(
    //                   //               height: 5,
    //                   //             ),
    //                   //             Text(
    //                   //               item.mimetype,
    //                   //               style: TextStyle(
    //                   //                   color: Colors.white,
    //                   //                   fontWeight: FontWeight.w300),
    //                   //             )
    //                   //           ],
    //                   //         )),
    //                   //   ),
    //                   // ),
    //                 ])),
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Container(
    //         margin: EdgeInsets.only(right: 10),
    //         padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(5),
    //             color: Colors.grey[300]),
    //         child: Center(
    //           child: Text(
    //             item.mimetype,
    //             style: TextStyle(),
    //           ),
    //         ),
    //       ),
    //     ]));
  }
}
