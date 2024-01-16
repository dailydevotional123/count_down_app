import 'dart:io';

import 'package:daily_devotional/src/helpers/local_database_helper/tables.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../snak_bar_widget.dart';

//
// part 'tawzea_sqlite.g.dart';
part 'drift_helper.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'countdown_sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [User, Note])
class AppDataBase extends _$AppDataBase {
  AppDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// ------------------------- Session Section -------------------------------------

  // /// Insert User
  // Future<int> insertSession(SessionTableCompanion entity) async {
  //   return await into(sessionTable).insert(entity);
  // }
  //
  // Future<bool> checkIfLoggedIn() async {
  //   final query = select(sessionTable);
  //   final session = await query.get();
  //   if (session.isEmpty) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
  //
  // Future<int> logoutSession() async {
  //   return delete(sessionTable).go();
  // }

  /// ------------------------- Users Section -------------------------------------

  Future<List<UserData>> getAllUsers() async {
    return await select(user).get();
  }

  Future<UserData?> getIndividualUsers(int userId) async {
    try {
      return (select(user)..where((element) => element.userId.equals(userId)))
          .getSingle();
    } on Exception catch (e) {
      showSuccessSnackBarMessage(message: e.toString());
      return null;
      // TODO
    }
  }

  /// Insert User
  Future<int> insertUser(UserCompanion entity) async {
    return await into(user).insert(entity);
  }

  // Future<bool> doesUserExist(int userId) async {
  //   final query = select(user)..where((u) => u.userId.equals(userId));
  //   final user = await query.get();
  //   if (user.isEmpty) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  ///------------------------------- Notes Section  ---------------------------------------------

  /// Add to cart
  Future<int> addNote(NoteCompanion noteCompanion) async {
    // showSnackBarMessage(content: "Item added to cart successfully");
    return await into(note).insert(noteCompanion);
    //  }
    // return 0;
  }

  Future<List<NoteData>> getAllNoteItems() async {
    return await select(note).get();
  }

  /// Delete cart item
  Future<int> deleteNoteItem(int id) async {
    return await (delete(note)..where((element) => element.id.equals(id))).go();
  }

  /// Update cart item
  Future<bool> updateNoteItem(NoteCompanion entity) async {
    return await update(note).replace(entity);
  }

// Future<UserTableData> entryById(int id) {
//   return (select(userTable)..where((t) => t.id.equals(id))).getSingle();
// }

  /// Get Selected Todo Tasks Listing

// Future<List<TodoTask>> getCompletedTodoTasks() async {
//   return await (select(todoTasks)
//         ..where((element) {
//           return element.isSelected.equals(true);
//         }))
//       .get();
// }
//
// Future<List<TodoTask>> getUnCompletedTodoTasks() async {
//   return await (select(todoTasks)
//         ..where((element) => element.isSelected.equals(false)))
//       .get();
// }
//
// Future<List<TodoTask>> getCompletedSelectedTodoTasks(title) async {
//   return await (select(todoTasks)
//         ..where((element) {
//           return element.isSelected.equals(true) &
//               element.listTitle.equals(title);
//         }))
//       .get();
// }
//
// Future<List<TodoTask>> getUnCompletedSelectedTodoTasks(title) async {
//   return await (select(todoTasks)
//         ..where((element) {
//           return element.isSelected.equals(false) &
//               element.listTitle.equals(title);
//         }))
//       .get();
// }
//
// /// Select Todo Task Record
// Future<List<TodoTask>> selectTodoTasks(String title) async {
//   return await (select(todoTasks)
//         ..where((element) => element.listTitle.equals(title)))
//       .get();
// }
//
// /// Update Todo Task Record
// Future<bool> updateTodoTasks(TodoTasksCompanion entity) async {
//   return await update(todoTasks).replace(entity);
// }
//
// /// Insert Todo Task Record
// Future<int> insertTodoTasks(TodoTasksCompanion entity) async {
//   return await into(todoTasks).insert(entity);
// }
//
// /// Delete Todo Task Record
// Future<int> deleteTodoTasks(int id) async {
//   return await (delete(todoTasks)..where((element) => element.id.equals(id)))
//       .go();
// }

// /// Get Selected Morning Routine Tasks Listing
//
// Future<List<RoutineMorningTask>> getCompletedMorningRoutineTasks() async {
//   return await (select(routineMorningTasks)
//         ..where((element) => element.isSelected.equals(true)))
//       .get();
// }
//
// /// Get Morning Routine Tasks Listing
// Future<List<RoutineMorningTask>> getMorningRoutineTasks() async {
//   return await (select(routineMorningTasks).get());
// }
//
// /// Select Morning Routine Task Record
// Future<RoutineMorningTask> selectMorningRoutineTasks(int id) async {
//   return await (select(routineMorningTasks)
//         ..where((element) => element.id.equals(id)))
//       .getSingle();
// }
//
// /// Get Un Selected Evening Tasks Listing
//
// Future<List<RoutineMorningTask>> getUnCompletedMorningRoutineTasks() async {
//   return await (select(routineMorningTasks)
//         ..where((element) => element.isSelected.equals(false)))
//       .get();
// }
//
// /// Update Morning Routine Task Record
// Future<bool> updateMorningRoutineTasks(
//     RoutineMorningTasksCompanion entity) async {
//   return await update(routineMorningTasks).replace(entity);
// }
//
// /// Insert Morning Routine Task Record
// Future<int> insertMorningRoutineTasks(
//     RoutineMorningTasksCompanion entity) async {
//   return await into(routineMorningTasks).insert(entity);
// }
//
// /// Delete Morning Routine Task Record
// Future<int> deleteMorningRoutineTasks(int id) async {
//   return await (delete(routineMorningTasks)
//         ..where((element) => element.id.equals(id)))
//       .go();
// }
//
// /// Get Selected Noon Tasks Listing
//
// Future<List<RoutineNoonTask>> getCompletedNoonRoutineTasks() async {
//   return await (select(routineNoonTasks)
//         ..where((element) => element.isSelected.equals(true)))
//       .get();
// }
//
// /// Get All Noon Tasks Listing
//
// Future<List<RoutineNoonTask>> getNoonRoutineTasks() async {
//   return await (select(routineNoonTasks).get());
// }
//
// /// Select Noon Routine Task Record
// Future<RoutineNoonTask> selectNoonRoutineTasks(int id) async {
//   return await (select(routineNoonTasks)
//         ..where((element) => element.id.equals(id)))
//       .getSingle();
// }
//
// /// Get Not Selected Evening Tasks Listing
//
// Future<List<RoutineNoonTask>> getUnCompletedNoonRoutineTasks() async {
//   return await (select(routineNoonTasks)
//         ..where((element) => element.isSelected.equals(false)))
//       .get();
// }
//
// /// Update Noon Routine Task Record
// Future<bool> updateNoonRoutineTasks(RoutineNoonTasksCompanion entity) async {
//   return await update(routineNoonTasks).replace(entity);
// }
//
// /// Insert Noon Routine Task Record
// Future<int> insertNoonRoutineTasks(RoutineNoonTasksCompanion entity) async {
//   return await into(routineNoonTasks).insert(entity);
// }
//
// /// Delete Noon Routine Task Record
// Future<int> deleteNoonRoutineTasks(int id) async {
//   return await (delete(routineNoonTasks)
//         ..where((element) => element.id.equals(id)))
//       .go();
// }
//
// /// Get Evening Tasks Listing
//
// Future<List<RoutineEveningTask>> getEveningRoutineTasks() async {
//   return await select(routineEveningTasks).get();
// }
//
// /// Get Selected Evening Tasks Listing
//
// Future<List<RoutineEveningTask>> getCompletedEveningRoutineTasks() async {
//   return await (select(routineEveningTasks)
//         ..where((element) => element.isSelected.equals(true)))
//       .get();
// }
//
// /// Get Un Selected Evening Tasks Listing
//
// Future<List<RoutineEveningTask>> getUnCompletedEveningRoutineTasks() async {
//   return await (select(routineEveningTasks)
//         ..where((element) => element.isSelected.equals(false)))
//       .get();
// }
//
// /// Select Evening Routine Task Record
// Future<RoutineEveningTask> selectEveningRoutineTasks(int id) async {
//   return await (select(routineEveningTasks)
//         ..where((element) => element.id.equals(id)))
//       .getSingle();
// }
//
// /// Update Evening Routine Task Record
// Future<bool> updateEveningRoutineTasks(
//     RoutineEveningTasksCompanion entity) async {
//   return await update(routineEveningTasks).replace(entity);
// }
//
// /// Insert Evening Routine Task Record
// Future<int> insertEveningRoutineTasks(
//     RoutineEveningTasksCompanion entity) async {
//   return await into(routineEveningTasks).insert(entity);
// }
//
// /// Delete Evening Routine Task Record
// Future<int> deleteEveningRoutineTasks(int id) async {
//   return await (delete(routineEveningTasks)
//         ..where((element) => element.id.equals(id)))
//       .go();
// }
//
// /// Get Night Tasks Listing
//
// Future<List<RoutineNightTask>> getNightRoutineTasks() async {
//   return await select(routineNightTasks).get();
// }
//
// /// Get Selected Night Tasks Listing
//
// Future<List<RoutineNightTask>> getCompletedNightRoutineTasks() async {
//   return await (select(routineNightTasks)
//         ..where((element) => element.isSelected.equals(true)))
//       .get();
// }
//
// /// Get Un Selected Night Tasks Listing
//
// Future<List<RoutineNightTask>> getUnCompletedNightRoutineTasks() async {
//   return await (select(routineNightTasks)
//         ..where((element) => element.isSelected.equals(false)))
//       .get();
// }
//
// /// Select Night Routine Task Record
// Future<RoutineNightTask> selectNightRoutineTasks(int id) async {
//   return await (select(routineNightTasks)
//         ..where((element) => element.id.equals(id)))
//       .getSingle();
// }
//
// /// Update Night Routine Task Record
// Future<bool> updateNightRoutineTasks(
//     RoutineNightTasksCompanion entity) async {
//   return await update(routineNightTasks).replace(entity);
// }
//
// /// Insert Night Routine Task Record
// Future<int> insertNightRoutineTasks(RoutineNightTasksCompanion entity) async {
//   return await into(routineNightTasks).insert(entity);
// }
//
// /// Delete Night Routine Task Record
// Future<int> deleteNightRoutineTasks(int id) async {
//   return await (delete(routineNightTasks)
//         ..where((element) => element.id.equals(id)))
//       .go();
// }
//
// /// Get Planned Tasks Listing
//
// Future<List<PlannedTask>> getPlannedTasks() async {
//   return await select(plannedTasks).get();
// }
//
// /// Get Selected Date Planned Tasks Listing
//
// Future<List<PlannedTask>> getSelectedDatePlannedTasks(dateTime) async {
//   return await (select(plannedTasks)
//         ..where((element) => element.taskDateTime.equals(dateTime)))
//       .get();
// }
//
// /// Get Selected Planned Tasks Listing
//
// Future<List<PlannedTask>> getCompletedPlannedTasks() async {
//   return await (select(plannedTasks)
//         ..where((element) => element.isSelected.equals(true)))
//       .get();
// }
//
// /// Get Un Selected Planned Tasks Listing
//
// Future<List<PlannedTask>> getUnCompletedPlannedTasks() async {
//   return await (select(plannedTasks)
//         ..where((element) => element.isSelected.equals(false)))
//       .get();
// }
//
// /// Select Planned Routine Task Record
// Future<PlannedTask> selectPlannedTasks(int id) async {
//   return await (select(plannedTasks)
//         ..where((element) => element.id.equals(id)))
//       .getSingle();
// }
//
// /// Update Planned Task Record
// Future<bool> updatePlannedTasks(PlannedTasksCompanion entity) async {
//   return await update(plannedTasks).replace(entity);
// }
//
// /// Insert Planned Task Record
// Future<int> insertPlannedTasks(PlannedTasksCompanion entity) async {
//   return await into(plannedTasks).insert(entity);
// }
//
// /// Delete Planned Task Record
// Future<int> deletePlannedTasks(int id) async {
//   return await (delete(plannedTasks)
//         ..where((element) => element.id.equals(id)))
//       .go();
// }
//
// /// Get Todo List Listing
//
// Future<List<TodoListData>> getTodoList() async {
//   return await select(todoList).get();
// }
//
// /// Get Same Date Todo List Listing
//
// Future<List<TodoListData>> getSameDateTodoList(dateTime) async {
//   return await (select(todoList)
//         ..where((element) => element.taskDateTime.equals(dateTime)))
//       .get();
// }
//
// Future<List<TodoListData>> getDateTodoList(dateTime) async {
//   return await (select(todoList)
//         ..where((element) => element.taskDateTime.equals(dateTime)))
//       .get();
// }
//
// /// Select Todo List Record
// Future<TodoListData> selectTodoList(int id) async {
//   return await (select(todoList)..where((element) => element.id.equals(id)))
//       .getSingle();
// }
//
// /// Update Todo List Record
// Future<bool> updateTodoList(TodoListCompanion entity) async {
//   return await update(todoList).replace(entity);
// }
//
// /// Insert Todo List Record
// Future<int> insertTodoList(TodoListCompanion entity) async {
//   return await into(todoList).insert(entity);
// }
//
// /// Delete Todo List Record
// Future<int> deleteTodoList(int id) async {
//   return await (delete(todoList)..where((element) => element.id.equals(id)))
//       .go();
// }
//
// /// Delete All Todo Tasks of List
// Future<int> deleteAllTodoTasks(String title) async {
//   return await (delete(todoTasks)
//         ..where((element) => element.listTitle.equals(title)))
//       .go();
// }
}
