import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opexq/models/task_model.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/pages/list/widgets/list_widgets.dart';
import 'package:opexq/pages/list/widgets/slidebackground_widget.dart';
import 'package:opexq/pages/task/tasklog_list_widget.dart';
import 'package:opexq/utils/app_routes.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/button_widgets.dart';

Widget taskList(ListController controller) {
  //late Task selectedTask;

  // logEditForm(String status) {
  //   //if (selectedTask != null) {
  //   List<Widget> items = [
  //     const SizedBox(height: 12),
  //     // Text(
  //     //   selectedTask.place ?? "",
  //     //   style: subtitle2,
  //     // ),
  //     // Text(selectedTask.subject, style: subtitle2),
  //     // Text(selectedTask.tdescription ?? "")
  //   ];
  //   //items.addAll(taskLogEdit(selectedTask));
  //   openBottomSheet(
  //       Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 12),
  //           width: Get.size.width,
  //           child: Column(children: items)),
  //       status + " the task");
  // }

  // logMenuTile(String caption) {
  //   return ListTile(
  //     onTap: () => logEditForm(caption),
  //     visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
  //     title: Text(caption),
  //     contentPadding: const EdgeInsets.only(left: 12, right: 12),
  //     trailing: const Icon(
  //       Icons.arrow_forward_ios,
  //       size: 16,
  //     ),
  //   );
  // }

  // logEditMenu() {
  //   return Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 12),
  //       width: Get.size.width,
  //       child: ListView(shrinkWrap: true, children: <Widget>[
  //         logMenuTile("Bildir"),
  //         greyline(),
  //         logMenuTile("In process"),
  //         greyline(),
  //         logMenuTile("Plan"),
  //         greyline(),
  //         logMenuTile("Close"),
  //         greyline(),
  //         logMenuTile("Cancel"),
  //         greyline(),
  //         logMenuTile("Assign"),
  //         greyline(),
  //         logMenuTile("Open"),
  //       ]));
  // }

  // Widget textButton(String? caption, Color backgroundColor, dynamic onPressed) {
  //   return TextButton(
  //       style: TextButton.styleFrom(
  //           textStyle: const TextStyle(
  //               color: Colors.white,
  //               fontSize: 12,
  //               overflow: TextOverflow.visible),
  //           shape: const BeveledRectangleBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(5))),
  //           primary: Colors.white,
  //           // padding: EdgeInsets.all(0),
  //           onSurface: Colors.grey,
  //           backgroundColor: backgroundColor),
  //       onPressed: onPressed,
  //       child: Text(caption ?? ""));
  // }

  Widget box(int index, int duration, String caption) {
    return Container(
      padding: const EdgeInsets.all(8),
      //Center(child: ),
      color: const Color(0xFF42A5F5).withOpacity((index + 2) / 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            duration.toString(),
            style: const TextStyle(fontSize: 36),
          ),
          const SizedBox(height: 8),
          Text(caption)
        ],
      ),
    );
  }

  openAlertInfo(String subject, int duration) {
    openBottomSheet(
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(subject, style: subtitle1),
                const SizedBox(height: 8),
                GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(12),
                    crossAxisCount: 3,
                    children: <Widget>[
                      box(1, 20, "Expected Time"),
                      box(2, 40, "Warning Time"),
                      box(3, 60, "Alert Time"),
                      box(4, 20, "time to go"),
                      box(5, 40, "Warning Time"),
                      box(6, 60, "Alert Time"),
                    ]),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        "Time Info");
  }

  Widget actionButton(IconData icon, {Color? color, dynamic onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Icon(
          icon,
          color: color ?? grey,
          size: 20,
        ),
      ),
    );
  }

  showHistory(int callId) {
    final ListController controller =
        Get.put<ListController>(ListController("tasklog"), tag: "tasklog");
    controller.listType.value = "sheet";
    controller.listFilterField.value = "CALLID";
    controller.listFilterValue.value = callId.toString();
    controller.refreshList();

    openBottomSheetMax(taskLogList(controller), "Task Log");
  }

  // showSubTask(int callId) {
  //   final ListController controller =
  //       Get.put<ListController>(ListController("tasklog"), tag: "tasklog");
  //   controller.listType.value = "sheet";
  //   controller.listFilterField.value = "MASTERJOBID";
  //   controller.listFilterValue.value = callId.toString();

  //   openBottomSheetMax(taskList(controller), "Detail Tasks");
  // }

  Widget listCard(Task item) {
    return listCardContainer(Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      item.alert == 1
                          ? textButton(toTime(item.ttime), Colors.red,
                              onTap: () => openAlertInfo(item.subject, 20))
                          : item.warning == 1
                              ? textButton(toTime(item.ttime), Colors.yellow,
                                  onTap: () => openAlertInfo(item.subject, 20))
                              : textButton(toTime(item.ttime), Colors.grey,
                                  onTap: () => openAlertInfo(item.subject, 20)),
                      const SizedBox(
                        height: 8,
                      ),
                      AutoSizeText(
                        formatDate(item.tdate),
                        maxLines: 1,
                        minFontSize: 8,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                          padding: const EdgeInsets.all(0),
                          //color: grey,
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                              //radius: 45,
                              backgroundColor:
                                  (item.docname == "" || item.docname == null)
                                      ? Colors.white
                                      : grey, //Color(0xffFDCF09),
                              child:
                                  (item.docname == "" || item.docname == null)
                                      ? Container()
                                      : GestureDetector(
                                          onTap: () => openImage(item.docname),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.network(
                                                item.docname ?? "",
                                                fit: BoxFit.cover,
                                                width: 45.0,
                                                height: 45.0,
                                              )),
                                        )))
                    ]),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 6,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        item.place ?? "",
                        //"${item.place}",
                        style: headline5,
                        maxLines: 1,
                        minFontSize: 12,
                        //overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AutoSizeText(
                        item.subject,
                        style: subtitle1,
                        maxLines: 2,
                        minFontSize: 10,
                      ),
                      const SizedBox(height: 8),
                      AutoSizeText(
                        item.tdescription ?? "",
                        style: bodyText1,
                        maxLines: 4,
                        minFontSize: 10,
                      ),
                    ]),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      textButton(
                          item.state, taskColors[item.stateid] ?? kPrimaryColor,
                          onTap: () async {
                        var result = await Get.toNamed(
                            '${AppRoutes.form}/tasklog/0',
                            arguments: {"CALLID": item.id});

                        if (result ?? false) {
                          controller.refreshList();
                        }
                        //{
                        //selectedTask = item;
                        //openBottomSheetMax(TaskLogView(), "Task State Change");
                        //}
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      AutoSizeText(item.tickettype,
                          maxLines: 1, minFontSize: 8),
                      const SizedBox(
                        height: 8,
                      ),
                      AutoSizeText(item.priority, minFontSize: 8, maxLines: 1),
                    ]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              item.stateid != 1
                  ? actionButton(FontAwesomeIcons.clock,
                      onTap: () => showHistory(item.id))
                  : const SizedBox(width: 4),
              (item.clientid == null || item.clientid == 0)
                  ? const SizedBox(width: 4)
                  : actionButton(FontAwesomeIcons.user,
                      onTap: () => goToForm("guest", id: item.clientid)),
              // (item.masterjob == null || item.masterjob == false)
              //     ? const SizedBox(width: 4)
              //     : actionButton(FontAwesomeIcons.list,
              //         onTap: () => showSubTask(item.id)),
              // item.deviceid == null
              //     ? const SizedBox(width: 4)
              //     : actionButton(FontAwesomeIcons.plug,
              //         onTap: () => openImage(item.docname)),
              // item.periodicjob == null
              //     ? const SizedBox(width: 4)
              //     : actionButton(FontAwesomeIcons.reply,
              //         onTap: () => openImage(item.docname)),
              //actionButton(Icons.plumbing),
            ],
          )
        ]));
  }

  Widget listItem(item) {
    return Dismissible(
        key: Key(item.id.toString()),
        direction: DismissDirection.startToEnd,
        background: slideBackground("left", "Edit", FontAwesomeIcons.file,
            appColors["task"]?.withOpacity((6 + 2) / 10)),
        secondaryBackground: slideBackground(
            "right",
            "State",
            FontAwesomeIcons.file,
            appColors["task"]?.withOpacity((6 + 2) / 10)),
        confirmDismiss: (direction) async {
          controller.handleEditForm(item.id);
          return false;
        },
        child: listCard(item));
  }

  return listBody(controller: controller, itemWidget: listItem);
}
