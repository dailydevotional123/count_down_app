import 'package:daily_devotional/src/helpers/local_database_helper/drift_helper.dart';
import 'package:daily_devotional/src/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../helpers/snak_bar_widget.dart';
import '../../bottomNavBarSection/providers/bottom_navbar_provider.dart';
import '../../bottomNavBarSection/screens/bottomNavScreen.dart';

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

  updateNote(NoteCompanion noteCompanion) {
    appDataBase.updateNoteItem(noteCompanion);
    showSuccessSnackBarMessage(message: "Note Updated Successfully");
    getListOfNotes('');
    Navigator.pop(RoutesUtils.cNavigatorState.currentState!.context);
    // noteController.clear();
    // GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context)
    //     .go(BottomNavScreen.route);
    // Provider.of<ClinicBottomNavProvider>(
    //         RoutesUtils.cNavigatorState.currentState!.context,
    //         listen: false)
    //     .updateCurrentScreen(3);
    notifyListeners();
  }

  deleteNote(int noteID) {
    appDataBase.deleteNoteItem(noteID);
    Navigator.pop(RoutesUtils.cNavigatorState.currentState!.context);
    showSuccessSnackBarMessage(message: "Note Deleted Successfully");
    getListOfNotes('');
    notifyListeners();
  }

  searchNotesList(String searchQuery) {
    appDataBase.getFilteredNotesForUser(
        FirebaseAuth.instance.currentUser!.uid.toString(), searchQuery);
  }

  getListOfNotes(String searchQuery) async {
    notesList = await appDataBase.getAllNoteItems(
        FirebaseAuth.instance.currentUser!.uid.toString(), searchQuery);
    notifyListeners();
  }
}
