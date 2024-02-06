import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_devotional/src/features/prayersSection/models/prayer_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../constants/firebaseUtils.dart';

class PrayerServices {
  ///Create prayer
  Future createPrayer(PrayerModel prayerModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection(FirebaseUtils.prayers).doc();
    return await docRef.set(prayerModel.toJson(docRef.id));
  }

  /// stream prayer list
  Stream<List<PrayerModel>> streamPrayerList() {
    // dp(msg: "search query", arg: searchQuery.toString());
    //if (searchQuery == "") {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.prayers)
        .where("userId",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString())
        // .where("noteTitle", isLessThanOrEqualTo: searchQuery)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => PrayerModel.fromJson(singleDoc.data()))
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

  ///delete prayer
  Future deletePrayer(String noteID) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseUtils.prayers)
        .doc(noteID)
        .delete();
  }

  /// update prayer
  Future updatePrayer(PrayerModel prayerModel) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseUtils.prayers)
        .doc(prayerModel.prayerId)
        .update({
      'prayerTitle': prayerModel.prayerTitle,
      //"scriptureText": prayerModel.scriptureText,
    });
  }
}
