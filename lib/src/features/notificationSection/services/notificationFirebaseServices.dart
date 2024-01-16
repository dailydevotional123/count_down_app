import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/firebaseUtils.dart';

import '../models/notificationModel.dart';

class NotificationFirebaseServices {
  ///Create Notification
  Future createNotification(
      NotificationModelFirebase notificationModelFirebase) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection(FirebaseUtils.notifications)
        .doc();
    return await docRef.set(notificationModelFirebase.toJson(docRef.id));
  }

  /// stream notifications
  Stream<List<NotificationModelFirebase>> streamNotifications(
      String appointmentStatus) {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.notifications)
        .where("recieverID", isEqualTo: "")

        // .where("appointmentStatus", isEqualTo: appointmentStatus)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) =>
                NotificationModelFirebase.fromJson(singleDoc.data()))
            .toList());
  }
}
