import 'package:hive/hive.dart';

import '../routing/routes.dart';

class HiveLocalStorage {
  //
  static Future<Box> openHiveBox(String boxName) async {
    try {
      return await Hive.openBox(boxName);
    } on HiveError catch (e) {
      pe(msg: "Hive erro", arg: e);
      return Hive.box(boxName);
    }
  }

  static Future addListData(
      {var value, String? key, required String boxName}) async {
    try {
      var box = await openHiveBox(boxName);
      await box.add(value);
    } on Error catch (e) {
      pe(msg: "Error in read", arg: e);
    }
  }

  static Future<List?> getListData(
      {String? key, required String boxName}) async {
    //
    try {
      var box = await openHiveBox(boxName);
      return box.values.toList().cast<String>();
    } on HiveError catch (e) {
      pe(msg: "Error", arg: e);
      return null;
    } catch (e) {
      pe(msg: "Error", arg: e);
      return null;
    }
  }

  static Future write({var value, String? key, required String boxName}) async {
    try {
      var box = await openHiveBox(boxName);
      await box.put(key, value);
    } on Error catch (e) {
      pe(msg: "Error in read", arg: e);
    }
  }

  static Future<T?> readHiveValue<T>(
      {String? key, required String boxName}) async {
    try {
      var box = await openHiveBox(boxName);
      return await box.get(key);
    } on HiveError catch (e) {
      pe(msg: "Error", arg: e);
      return null;
    }
  }

  static Future deleteHiveValue({String? key, required String boxName}) async {
    try {
      var box = await openHiveBox(boxName);
      box.delete(key);
    } on HiveError catch (e) {
      pe(msg: "Error in deleteing", arg: e);
    }
  }

  static Future deleateAllValues({required String boxName, tag}) async {
    try {
      var box = await openHiveBox(boxName);
      box.deleteFromDisk();
    } on HiveError catch (e) {
      pe(msg: "Error $tag in deleteing", arg: e);
    } catch (e) {
      pe(msg: "Error $tag in deleteing hive util", arg: e);
    }
  }

  static Future deleteHiveAt({int? key, required String boxName, tag}) async {
    try {
      var box = await openHiveBox(boxName);
      box.deleteAt(key!);
    } on HiveError catch (e) {
      pe(msg: "Error $tag in deleteing", arg: e);
    } catch (e) {
      pe(msg: "Error $tag in deleteing hive util", arg: e);
    }
  }
}
