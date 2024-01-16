import 'package:daily_devotional/src/helpers/local_database_helper/drift_helper.dart';
import 'package:daily_devotional/src/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../helpers/snak_bar_widget.dart';
import '../bottomNavBarSection/providers/bottom_navbar_provider.dart';
import '../bottomNavBarSection/screens/bottomNavScreen.dart';

class NotesProvider extends ChangeNotifier {
  AppDataBase appDataBase = AppDataBase();
  List<NoteData> notesList = [];

  addNote(NoteCompanion noteCompanion) {
    appDataBase.addNote(noteCompanion);
    showSuccessSnackBarMessage(message: "Note Added Successfully");
    // noteController.clear();
    GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context)
        .go(BottomNavScreen.route);
    Provider.of<ClinicBottomNavProvider>(
            RoutesUtils.cNavigatorState.currentState!.context,
            listen: false)
        .updateCurrentScreen(3);
    notifyListeners();
  }

  getListOfNotes() async {
    notesList = await appDataBase.getAllNoteItems();
    notifyListeners();
  }
}
