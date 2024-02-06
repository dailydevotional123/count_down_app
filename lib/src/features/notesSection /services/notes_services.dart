import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../constants/firebaseUtils.dart';
import '../models/note_model.dart';

class NotesServices {
  ///Create note
  Future createNote(NoteModel noteModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection(FirebaseUtils.notes).doc();
    return await docRef.set(noteModel.toJson(docRef.id));
  }

  /// stream notes list
  Stream<List<NoteModel>> streamNotesList() {
    // dp(msg: "search query", arg: searchQuery.toString());
    //if (searchQuery == "") {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.notes)
        .where("userId",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString())
        // .where("noteTitle", isLessThanOrEqualTo: searchQuery)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => NoteModel.fromJson(singleDoc.data()))
            .toList());
    // } else {
    //   dp(msg: "search query", arg: searchQuery.toString());
    //   return FirebaseFirestore.instance
    //       .collection(FirebaseUtils.notes)
    //       .where("userId",
    //           isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString())
    //       .where("noteTitle", isEqualTo: searchQuery)
    //       .snapshots()
    //       .map((list) => list.docs
    //           .map((singleDoc) => NoteModel.fromJson(singleDoc.data()))
    //           .toList());
    // }
  }

  ///delete note
  Future deleteNote(String noteID) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseUtils.notes)
        .doc(noteID)
        .delete();
  }

  /// update note
  Future updateNote(NoteModel noteModel) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseUtils.notes)
        .doc(noteModel.noteId)
        .update({
      'noteTitle': noteModel.noteTitle,
      "scriptureText": noteModel.scriptureText,
    });
  }
}
