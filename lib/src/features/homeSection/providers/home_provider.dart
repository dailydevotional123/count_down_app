import 'package:daily_devotional/src/features/homeSection/models/home_model.dart';
import 'package:daily_devotional/src/features/homeSection/services/home_services.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  HomeServices homeServices = HomeServices();
  DevotionalModel? devotionalModel;

  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  pickScriptureOfTheDay() async {
    Future.delayed(const Duration(milliseconds: 1)).whenComplete(() {
      makeLoadingTrue();
      devotionalModel = homeServices.pickScriptureOfTheDay();
      makeLoadingFalse();
      notifyListeners();
    });
  }
}
