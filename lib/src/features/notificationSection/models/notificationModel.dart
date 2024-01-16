// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

NotificationModelFirebase notificationModelFromJson(String str) =>
    NotificationModelFirebase.fromJson(json.decode(str));

String notificationModelToJson(NotificationModelFirebase data) =>
    json.encode(data.toJson(data.notificationId.toString()));

class NotificationModelFirebase {
  NotificationModelFirebase({
    this.notificationId,
    this.notificationDateTime,
    this.notificationtype,
    this.notificationTitle,
    this.notificationDescription,
   // this.senderId,
    this.recieverId,
  });

  String? notificationId;
  Timestamp? notificationDateTime;
  String? notificationtype;
  String? notificationTitle;
  String? notificationDescription;
  //String? senderId;
  String? recieverId;

  factory NotificationModelFirebase.fromJson(Map<String, dynamic> json) =>
      NotificationModelFirebase(
        notificationId: json["notificationID"],
        notificationDateTime: json["notificationDateTime"],
        notificationtype: json["notificationtype"],
        notificationTitle: json["notificationTitle"],
        notificationDescription: json["notificationDescription"],
      //  senderId: json["senderID"],
        recieverId: json["recieverID"],
      );

  Map<String, dynamic> toJson(String id) => {
        "notificationID": id,
        "notificationDateTime": notificationDateTime,
        "notificationtype": notificationtype,
        "notificationTitle": notificationTitle,
        "notificationDescription": notificationDescription,
      //  "senderID": senderId,
        "recieverID": recieverId,
      };
}
