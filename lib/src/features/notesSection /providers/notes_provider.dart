import 'package:daily_devotional/src/features/notesSection%20/models/note_model.dart';
import 'package:daily_devotional/src/features/notesSection%20/services/notes_services.dart';
import 'package:daily_devotional/src/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../helpers/snak_bar_widget.dart';

class NotesProvider extends ChangeNotifier {
  /// storing notes in firebase database

  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  NotesServices notesServices = NotesServices();

  createNote({required String noteTitle, required String scriptureText}) {
    try {
      makeLoadingTrue();
      notesServices
          .createNote(NoteModel(
              userId: FirebaseAuth.instance.currentUser!.uid,
              noteTitle: noteTitle.toString(),
              scriptureText: scriptureText.toString()))
          .then((value) {
        makeLoadingFalse();
        Navigator.pop(RoutesUtils.cNavigatorState.currentState!.context);
        showSuccessSnackBarMessage(message: "Note Added Successfully");
      });
    } on Exception catch (e) {
      makeLoadingFalse();
      showErrorSnackBarMessage(message: e.toString());
      // TODO
    }
  }

  updateNoteFireStore(
      {required String noteId,
      required String noteTitle,
      required String scriptureText}) {
    try {
      makeLoadingTrue();
      notesServices
          .updateNote(NoteModel(
              userId: FirebaseAuth.instance.currentUser!.uid,
              noteId: noteId,
              noteTitle: noteTitle.toString(),
              scriptureText: scriptureText.toString()))
          .then((value) {
        makeLoadingFalse();
        Navigator.pop(RoutesUtils.cNavigatorState.currentState!.context);
        showSuccessSnackBarMessage(message: "Note Updated Successfully");
      });
    } on Exception catch (e) {
      makeLoadingFalse();
      showErrorSnackBarMessage(message: e.toString());
      // TODO
    }
  }

  ///delete note
  deleteNote(String noteID) {
    makeLoadingTrue();
    notesServices.deleteNote(noteID).whenComplete(() {
      makeLoadingFalse();
      Navigator.maybePop(RoutesUtils.cNavigatorState.currentState!.context);
      showErrorSnackBarMessage(message: "Note Deleted Successfully");
    });
  }

  ///storing notes in local storage drift database

// AppDataBase appDataBase = AppDataBase();
// List<NoteData> notesList = [];
//
// addNote(NoteCompanion noteCompanion) {
//   appDataBase.addNote(noteCompanion);
//   showSuccessSnackBarMessage(message: "Note Added Successfully");
//   // noteController.clear();
//   GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context)
//       .go(BottomNavScreen.route);
//   Provider.of<ClinicBottomNavProvider>(
//           RoutesUtils.cNavigatorState.currentState!.context,
//           listen: false)
//       .updateCurrentScreen(3);
//   notifyListeners();
// }
//
// updateNote(NoteCompanion noteCompanion) {
//   appDataBase.updateNoteItem(noteCompanion);
//   showSuccessSnackBarMessage(message: "Note Updated Successfully");
//   getListOfNotes('');
//   Navigator.pop(RoutesUtils.cNavigatorState.currentState!.context);
//   // noteController.clear();
//   // GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context)
//   //     .go(BottomNavScreen.route);
//   // Provider.of<ClinicBottomNavProvider>(
//   //         RoutesUtils.cNavigatorState.currentState!.context,
//   //         listen: false)
//   //     .updateCurrentScreen(3);
//   notifyListeners();
// }
//
// deleteNote(int noteID) {
//   appDataBase.deleteNoteItem(noteID);
//   Navigator.pop(RoutesUtils.cNavigatorState.currentState!.context);
//   showSuccessSnackBarMessage(message: "Note Deleted Successfully");
//   getListOfNotes('');
//   notifyListeners();
// }
//
// searchNotesList(String searchQuery) {
//   appDataBase.getFilteredNotesForUser(
//       FirebaseAuth.instance.currentUser!.uid.toString(), searchQuery);
// }
//
// getListOfNotes(String searchQuery) async {
//   notesList = await appDataBase.getAllNoteItems(
//       FirebaseAuth.instance.currentUser!.uid.toString(), searchQuery);
//   notifyListeners();
// }
}
