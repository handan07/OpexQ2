import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/widgets.dart';

Widget searchBox(ListController controller) {
  return Row(children: <Widget>[
    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 8, top: 8, bottom: 8),
        child: TextField(
          controller: controller.searchTextController,
          decoration: InputDecoration(
            //contentPadding: const EdgeInsets.only(top: 12),
            //alignLabelWithHint: true,
            isDense: true,
            hintText: 'Search'.tr,
            hintStyle: TextStyle(color: lightgrey),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: GestureDetector(
              onTap: () => controller.handleClearSearch(),
              child: Icon(
                FontAwesomeIcons.xmark,
                color: lightgrey,
                size: 18,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () => controller.handleSearch(),
              child: Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: lightgrey,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    ),
    Obx(() => GestureDetector(
        onTap: () => controller.handleOrderBy(),
        child: controller.listOrderBy.value == "DESC"
            ? smallColoredButton(FontAwesomeIcons.sortDown,
                color: controller.page.color)
            : smallColoredButton(FontAwesomeIcons.sortUp,
                color: controller.page.color))),
    const SizedBox(width: 12),
  ]);
}

Widget listCardContainer(Widget child, {Color? color}) {
  return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(12)),
      child: child);
}

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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(error == null ? "Unknown error" : error.toString(),
                style: subtitle2),
          ),
        )
      ]);
}

Widget listBody({dynamic itemWidget, required ListController controller}) {
  return RefreshIndicator(
    onRefresh: () => Future.sync(
      () => controller.pagingController.refresh(),
    ),
    child: PagedListView<int, dynamic>.separated(
      shrinkWrap: true,
      pagingController: controller.pagingController,
      builderDelegate: PagedChildBuilderDelegate<dynamic>(
        animateTransitions: true,
        // [transitionDuration] has a default value of 250 milliseconds.
        transitionDuration: const Duration(milliseconds: 500),
        itemBuilder: (context, item, index) {
          return itemWidget(item);
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
        noMoreItemsIndicatorBuilder: (_) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.center, child: Text("No more data".tr)),
        ), //NoMoreItemsIndicator(),
      ),
      separatorBuilder: (context, index) => const Divider(height: 5),
    ),
  );
}

List<Widget> listBarAction() {
  return [
    PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      padding: const EdgeInsets.all(0),
      onSelected: (value) {
        switch (value) {
          case "history":
            final ListController controller = Get.find(tag: "task");
            controller.listType.value = "sheet";

            //openBottomSheetMax(taskList(_controller), "Requests");
            break;
          case "subtasks":
            final ListController controller = Get.find(tag: "comment");
            controller.listType.value = "sheet";

            //openBottomSheetMax(commentList(_controller), "Comments");
            break;
          case "hardware":
            final ListController controller = Get.find(tag: "callcenter");
            controller.listType.value = "sheet";

            //openBottomSheetMax(callCenterList(_controller), "Conversations");
            break;
          default:
        }
      },
      itemBuilder: (BuildContext contesxt) {
        return [
          PopupMenuItem(
            value: "history",
            child: Text("Date".tr),
          ),
          PopupMenuItem(
            value: "subtasks",
            child: CheckboxListTile(
              value: true,
              title: const Text("Priority"),
              onChanged: (val) {
                print("fdsfds");
              },
            ),
          ),
          PopupMenuItem(
            value: "hardware",
            child: CheckboxListTile(
              value: true,
              title: const Text("State"),
              onChanged: (val) {
                print("fdsfds");
              },
            ),
          ),
          //PopupMenuDivider(),
          PopupMenuItem(
              value: "2",
              child: SwitchListTile(
                value: true,
                title: const Text("Refresh"),
                onChanged: (val) {
                  print("fdsfds");
                },
              )),
        ];
      },
    ),
  ];
}
