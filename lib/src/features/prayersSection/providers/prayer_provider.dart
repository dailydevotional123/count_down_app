import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_devotional/src/features/prayersSection/models/prayer_model.dart';
import 'package:daily_devotional/src/features/prayersSection/services/prayer_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../helpers/snak_bar_widget.dart';
import '../../../routing/routes.dart';

class PrayerProvider extends ChangeNotifier {
  PrayerServices prayerServices = PrayerServices();
  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  createPrayer({
    required String prayerTitle,
  }) {
    try {
      makeLoadingTrue();
      prayerServices
          .createPrayer(PrayerModel(
        userId: FirebaseAuth.instance.currentUser!.uid,
        prayerTitle: prayerTitle.toString(),
        dateTime: Timestamp.fromDate(DateTime.now()),
      ))
          .then((value) {
        makeLoadingFalse();
        Navigator.pop(RoutesUtils.cNavigatorState.currentState!.context);
        showSuccessSnackBarMessage(message: "Prayer Added Successfully");
      });
    } on Exception catch (e) {
      makeLoadingFalse();
      showErrorSnackBarMessage(message: e.toString());
      // TODO
    }
  }

  ///delete note
  deletePrayer(String prayerID) {
    makeLoadingTrue();
    prayerServices.deletePrayer(prayerID).whenComplete(() {
      makeLoadingFalse();
      Navigator.maybePop(RoutesUtils.cNavigatorState.currentState!.context);
      showErrorSnackBarMessage(message: "Prayer Deleted Successfully");
    });
  }
}
