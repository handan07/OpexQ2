import 'package:flutter/material.dart';
import 'package:opexq/models/guest_info_model.dart';
import 'package:opexq/utils/utils.dart';
import 'package:opexq/widgets/widgets.dart';

Widget guestInfo(GuestInfo data) {
  return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            textLabel("Name"),
            text(data.clientname ?? ""),
            textLabel("Room"),
            text(data.room ?? ""),
            textLabel("Check In"),
            text(formatDate(data.checkin)),
            textLabel("Check Out"),
            text(formatDate(data.checkout)),
            textLabel("Phone"),
            text(data.phone ?? ""),
            textLabel("Mobile"),
            text(data.cell ?? ""),
            textLabel("Email"),
            text(data.email ?? ""),
            textLabel("Country"),
            text(data.country ?? ""),
            textLabel("Nationality"),
            text(data.nation ?? ""),
            textLabel("Reservation Id"),
            text(data.reservationid.toString()),
            textLabel("Vip Code"),
            textLabel(data.vipcode ?? ""),
            textLabel("Repeat Count"),
            text(data.repeatcount.toString()),
          ]));
}
