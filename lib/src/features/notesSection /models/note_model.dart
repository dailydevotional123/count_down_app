// To parse this JSON data, do
//
//     final noteModel = noteModelFromJson(jsonString);

import 'dart:convert';

NoteModel noteModelFromJson(String str) => NoteModel.fromJson(json.decode(str));

String noteModelToJson(NoteModel data) =>
    json.encode(data.toJson(data.noteId.toString()));

class NoteModel {
  NoteModel({
    this.noteId,
    this.userId,
    this.noteTitle,
    this.scriptureText,
  });

  String? noteId;
  String? userId;
  String? noteTitle;
  String? scriptureText;

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        noteId: json["noteID"],
        userId: json["userId"],
        noteTitle: json["noteTitle"],
        scriptureText: json["scriptureText"],
      );

  Map<String, dynamic> toJson(String id) => {
        "noteID": id,
        "userId": userId,
        "noteTitle": noteTitle,
        "scriptureText": scriptureText,
      };
}
