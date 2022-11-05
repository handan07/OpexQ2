import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:opexq/pages/chat/chat_controller.dart';
import 'package:opexq/pages/chat/widget/chat_bubble_widget.dart';
import 'package:opexq/pages/chat/widget/chat_header_widget.dart';
import 'package:opexq/pages/chat/widget/chat_widgets.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/widgets.dart';

class ChatView extends StatelessWidget {
  final FocusNode focusNode = FocusNode();

  ChatView({Key? key}) : super(key: key);

  Widget pageErrorIndicator({dynamic error, dynamic onTryAgain}) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('assets/lottie/error.json', height: 200),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Text("Something went wrong", style: subtitle1),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Text(error == null ? "Unknown error" : error.toString(),
                style: subtitle2),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        //elevation: 1,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: grey),
            onPressed: () {
              //controller.dispose();
              ListController controller = Get.find(tag: "callcenter");
              controller.startTimer();
              Get.back();
            }),
        centerTitle: false,
        title: Obx(() => chatTitle(controller.conversation.value)),
        actions: chatActions(),
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(100),
        //   child: Container(
        //     height: 100.0,
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(
        //           horizontal: 12.0, vertical: 8.0),
        //       child: ListView(
        //         scrollDirection: Axis.horizontal,
        //         children: [
        //           //Let's create a custom widget for our story button
        //           storyButton(
        //               'https://www.otelcrm.net/images/shop/surveyonlobby.png',
        //               "Davie yo"),
        //           storyButton(
        //               "https://www.otelcrm.net/images/shop/surveyonlobby.png",
        //               "Jack Brell"),
        //           storyButton(
        //               "https://www.otelcrm.net/images/shop/surveyonlobby.png",
        //               "Anjie wo"),
        //           storyButton("", "Joseph "),
        //           storyButton("", "Juline kujo"),
        //         ],
        //       ),
        //     ),
        //   ),
        // )
      ),
      resizeToAvoidBottomInset: true,
      body: Column(children: <Widget>[
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => Future.sync(
              () => controller.pagingController.refresh(),
            ),
            // child: ListView.builder(
            //   shrinkWrap: true,
            //   controller: _controller.scrollController,
            //   itemCount: _controller.datalist.isEmpty
            //       ? 0
            //       : _controller.datalist.length + 1,
            //   //padding: const EdgeInsets.only(top: 10, bottom: 100),
            //   //physics: NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     if (index == _controller.datalist.length) {
            //       return Container(
            //         height: 50,
            //       );
            //     } else {
            //       return chatBubble(_controller.datalist[index]);
            //     }
            //   },
            // ),

            //
            child: PagedListView<int, dynamic>.separated(
              shrinkWrap: true,
              reverse: true,
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<dynamic>(
                animateTransitions: true,
                // [transitionDuration] has a default value of 250 milliseconds.
                transitionDuration: const Duration(milliseconds: 500),
                itemBuilder: (context, item, index) {
                  return chatBubble(item);
                },
                firstPageErrorIndicatorBuilder: (_) => pageErrorIndicator(
                  error: controller.pagingController.error,
                  onTryAgain: () => controller.pagingController.refresh(),
                ),
                newPageErrorIndicatorBuilder: (_) => pageErrorIndicator(
                  error: controller.pagingController.error,
                  onTryAgain: () =>
                      controller.pagingController.retryLastFailedRequest(),
                ),
                firstPageProgressIndicatorBuilder: (_) =>
                    showBusyIndicator(), //FirstPageProgressIndicator(),
                newPageProgressIndicatorBuilder: (_) =>
                    showBusyIndicator(), //NewPageProgressIndicator(),
                noItemsFoundIndicatorBuilder: (_) =>
                    noData(), //NoItemsFoundIndicator(),
                noMoreItemsIndicatorBuilder: (_) => const Align(
                    alignment: Alignment.center,
                    child: Text("No more data")), //NoMoreItemsIndicator(),
              ),
              separatorBuilder: (context, index) => const Divider(height: 5),
            ),
          ),
        ),
        bottomMenu(focusNode),
      ]),
      // ListView.builder(
      //   itemCount: _controller.datalist.length,
      //   //shrinkWrap: true,
      //   padding: const EdgeInsets.only(top: 10, bottom: 100),
      //   //physics: NeverScrollableScrollPhysics(),
      //   itemBuilder: (context, index) {
      //     return chatBubble(_controller.datalist[index]);
      //   },
      // ),
      //
      //   Align(
      //     alignment: Alignment.bottomRight,
      //     child: Container(
      //       padding: const EdgeInsets.only(right: 30, bottom: 50),
      //       child: FloatingActionButton(
      //         onPressed: () {
      //           //print(_controller.messageController.text);
      //           _controller.handleSave();
      //         },
      //         child: const Icon(Icons.send),
      //         backgroundColor: kPrimaryColor,
      //         elevation: 0,
      //       ),
      //     ),
      //   )
      // ],

      // bottomNavigationBar: bottomBar(),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniEndFloat,
      // floatingActionButton: circleButton(
      //     icon: Icons.send,
      //     onTap: () => _controller.handleSave(),
      //     color: appColors["callcenter"]?.withOpacity((6 + 2) / 10)),
      //bottomSheet: bottomSheet(),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: Get.size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }
}

// Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         ElevatedButton(onPressed: () {}, child: Text("Cancel")),
//         ElevatedButton(onPressed: () {}, child: Text("OK")),
//       ],
//     ),


// RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 style: bodyTextStyle,
//                 text: seeSourceFirst,
//               ),
//               TextSpan(
//                 style: bodyTextStyle.copyWith(
//                   color: colorScheme.primary,
//                 ),
//                 text: repoText,
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () async {
//                     final url = 'https://github.com/flutter/gallery/';
//                     if (await canLaunch(url)) {
//                       await launch(
//                         url,
//                         forceSafariVC: false,
//                       );
//                     }
//                   },
//               ),
//               TextSpan(
//                 style: bodyTextStyle,
//                 text: seeSourceSecond,
//               ),
//             ],
//           ),
