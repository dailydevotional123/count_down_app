import 'package:daily_devotional/src/features/%20bibleSection%20/screens/bible_screen.dart';
import 'package:daily_devotional/src/features/homeSection/screens/home_screen.dart';
import 'package:daily_devotional/src/features/moreSection/screens/more_screen.dart';
import 'package:daily_devotional/src/features/notesSection%20/screens/notes_screen.dart';
import 'package:flutter/material.dart';

import '../../prayersSection/screens/prayers_screen.dart';

class ClinicBottomNavProvider extends ChangeNotifier {
  Widget currentScreen = const HomeScreen();
  int currentIndex = 0;

  updateScreen(int index) {
    updateCurrentScreen(index);
  }

  updateCurrentScreen(int index) {
    switch (index) {
      case 0:
        currentIndex = index;
        currentScreen = const HomeScreen();
        notifyListeners();
        break;
      case 1:
        currentIndex = index;

        currentScreen = const BibleScreen();
        notifyListeners();
        break;
      case 2:
        currentIndex = index;
        currentScreen = const PrayersScreen();
        notifyListeners();

        break;
      case 3:
        currentIndex = index;
        currentScreen = NotesScreen();
        notifyListeners();

        break;
      case 4:
        currentIndex = index;
        currentScreen = MoreScreen();
        notifyListeners();

        break;
    }
  }

  clearClinicBottomNavBarProvider() {
    currentIndex = 0;
    currentScreen = const HomeScreen();
    notifyListeners();
  }
}
