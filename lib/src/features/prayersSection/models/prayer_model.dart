// To parse this JSON data, do
//
//     final noteModel = noteModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

PrayerModel noteModelFromJson(String str) =>
    PrayerModel.fromJson(json.decode(str));

String noteModelToJson(PrayerModel data) =>
    json.encode(data.toJson(data.prayerId.toString()));

class PrayerModel {
  PrayerModel({
    this.prayerId,
    this.userId,
    this.prayerTitle,
    this.dateTime,
  });

  String? prayerId;
  String? userId;
  String? prayerTitle;
  Timestamp? dateTime;

  factory PrayerModel.fromJson(Map<String, dynamic> json) => PrayerModel(
        prayerId: json["prayerId"],
        userId: json["userId"],
        prayerTitle: json["prayerTitle"],
        dateTime: json["dateTime"],
      );

  Map<String, dynamic> toJson(String id) => {
        "prayerId": id,
        "userId": userId,
        "prayerTitle": prayerTitle,
        "dateTime": dateTime,
      };
}
