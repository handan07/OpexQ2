import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:opexq/models/whatsapp_template_model.dart';
import 'package:opexq/pages/chat/widget/chat_bubble_widget.dart';
import 'package:opexq/pages/chat/widget/chat_widgets.dart';
import 'package:opexq/pages/list/list_controller.dart';
import 'package:opexq/utils/configuration.dart';
import 'package:opexq/utils/utils.dart';

Widget whatsAppTemplateList(ListController controller) {
  Widget avatarImage(String link) {
    return GestureDetector(
        onTap: () => openImage(link),
        child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
              image: NetworkImage(link),
              fit: BoxFit.cover,
            ),
          ),
          //color: grey,
          width: 70,
          height: 70,
        ));
  }

  Widget listItem(WhatsAppTemplate item) {
    return Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12),
        child: ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          dense: true,
          contentPadding: const EdgeInsets.only(left: 16, top: 0.0, right: 16),
          onTap: () {
            messageDialog(item);
          }, //=> Get.back(result: item),
          trailing: item.type == 'image'
              ? avatarImage(item.messageLink!)
              : item.type == 'file'
                  ? templateIcon(
                      FontAwesomeIcons.file, () => launchURL(item.messageLink))
                  : item.type == 'video'
                      ? templateIcon(FontAwesomeIcons.video,
                          () => openVideo(item.messageLink))
                      : item.type == 'audio'
                          ? templateIcon(FontAwesomeIcons.microphone,
                              () => openAudio(item.messageLink))
                          : item.type == 'location'
                              ? templateIcon(FontAwesomeIcons.mapPin,
                                  () => openMap(item.messageLink))
                              : item.type == 'whatsappsticker'
                                  ? avatarImage(item.messageLink!)
                                  : item.type == 'templatemessage'
                                      ? templateIcon(
                                          FontAwesomeIcons.fileInvoice, null)
                                      : item.type == 'interactive'
                                          ? templateIcon(
                                              FontAwesomeIcons.handPointUp,
                                              null)
                                          : templateIcon(
                                              FontAwesomeIcons.bomb, null),
          title: Text(item.messageName, style: subtitle1),
          subtitle: Text(item.lang ?? 'tr', style: bodyText1),
        ));
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
