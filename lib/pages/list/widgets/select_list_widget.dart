import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:opexq/models/select_item_model.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/utils/configuration.dart';

Widget selectList(ListController controller) {
  Widget listItem(SelectItem item) {
    return Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12),
        child: controller.singleSelect.value ? 
        ListTile(
          contentPadding: const EdgeInsets.only(left: 16),
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          dense: true,
          // trailing: (_controller.selectedItems.contains(item.id))
          //     ? const Icon(Icons.check_box)
          //     : const Icon(Icons.check_box_outline_blank),
          onTap: () {
              controller.selectedItemList.add(item);
              Get.back(result: controller.selectedItemList);
          },
          title: //item.id == selectedValue
              //? Text(item.text, style: subtitle1)
              Text(item.text, style: subtitle2),
        )
        : Obx(() => CheckboxListTile(
              contentPadding: const EdgeInsets.only(left: 16),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(item.text, style: subtitle1),
              value: controller.selectedItemList.where((c) => c.id == item.id).toList().isNotEmpty ,//controller.selectedItemList.contains(item),
              onChanged: (bool? selected) {
                if (selected == true) {
                  controller.selectedItemList.add(item);
                } else {
                  controller.selectedItemList.remove(item);
                }
              },
            ))
        );
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
          itemBuilder: (context, item, index) {
            return itemWidget(item);
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 4),
      ),
    );
  }

  return listBody(controller: controller, itemWidget: listItem);
}
