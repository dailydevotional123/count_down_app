// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) =>
    json.encode(data.toJson(data.userId.toString()));

class UserModel {
  UserModel({
    this.userId,
    this.userName,
    this.emailAdress,
    this.profilePicture,
    this.dateCreated,
  });

  String? userId;
  String? userName;
  String? emailAdress;
  String? profilePicture;

  Timestamp? dateCreated;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userID"],
        userName: json["userName"],
        emailAdress: json["emailAdress"],
        profilePicture: json["profilePicture"],
        dateCreated: json["dateCreated"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "userID": docID,
        "userName": userName,
        "emailAdress": emailAdress,
        "profilePicture": profilePicture,
        "dateCreated": dateCreated,
      };
}
