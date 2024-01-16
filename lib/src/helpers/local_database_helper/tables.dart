import 'package:drift/drift.dart';

class User extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().named('user_name')();

  IntColumn get userId => integer().named("user_id")();

  TextColumn get userEmail => text().named('email')();

  BlobColumn get userImage => blob().named("user_image")();
}

class Note extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().named("user_id")();

  // IntColumn get productId => integer().named("product_id")();

  TextColumn get productTitle => text().named('note_title')();

  TextColumn get scriptureText => text().named('scripture_text')();

//   IntColumn get productQuantity => integer().named("product_quantity")();
//
//   RealColumn get productPrice => real().named("product_price")();
//
//   BlobColumn get productImage => blob().named("product_image")();
}
