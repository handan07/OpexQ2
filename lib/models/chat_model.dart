import 'package:flutter/material.dart';

class ChatDetailPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ChatDetailPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              // CircleAvatar(
              // backgroundImage: AssetImage("images/userImage1.jpeg"),
              // maxRadius: 20,
              // ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Jane Russel",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Online",
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.grey.shade700,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SendMenuItems {
  String text;
  IconData icons;
  MaterialColor color;
  SendMenuItems({required this.text, required this.icons, required this.color});
}

class ChatUsers {
  String text;
  String secondaryText;
  String image;
  String time;
  ChatUsers(
      {this.text = "",
      this.secondaryText = "",
      this.image = "",
      this.time = ""});
}

enum MessageType {
  sender,
  receiver,
}

class ChatMessage {
  final int id;
  final int callcenterlogid;
  final String? phone;
  final String messagestatus;
  final String messageType;
  final String direction;
  final String? message;
  final DateTime? createdDateTime;
  final DateTime? updatedDateTime;
  final String? ruser;
  final DateTime rdate;
  final String? errorcode;
  final String? errordescription;
  final String? url;
  final String? adminuser;
  final String? guestName;
  final String? groupUser;

  const ChatMessage(
      {required this.id,
      required this.callcenterlogid,
      this.guestName,
      this.phone,
      required this.messagestatus,
      required this.messageType,
      required this.direction,
      this.message,
      this.updatedDateTime,
      this.createdDateTime,
      this.errorcode,
      this.errordescription,
      this.adminuser,
      this.groupUser,
      this.url,
      this.ruser,
      required this.rdate});

  factory ChatMessage.fromMap(Map<String, dynamic> json) => ChatMessage(
        id: json["ID"],
        callcenterlogid: json["CALLCENTERLOGID"],
        guestName: json["GUESTNAME"],
        url: json["URL"],
        phone: json["PHONE"],
        messagestatus: json["MESSAGESTATUS"],
        messageType: json["MESSAGETYPE"],
        direction: json["DIRECTION"],
        message: json["CONTENTTEXT"],
        errorcode: json["ERRORCODE"],
        errordescription: json["ERRORDESCRIPTION"],
        createdDateTime: json["MESSAGECREATEDDATETIME"] == null
            ? null
            : DateTime.parse(json["MESSAGECREATEDDATETIME"]),
        updatedDateTime: json["MESSAGEUPDATEDDATETIME"] == null
            ? null
            : DateTime.parse(json["MESSAGEUPDATEDDATETIME"]),
        rdate: DateTime.parse(json["RDATE"]),
        ruser: json["RUSER"],
        adminuser: json["ADMINUSER"],
        groupUser: json["GROUPUSER"],
      );
}
