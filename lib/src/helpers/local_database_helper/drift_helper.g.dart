// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_helper.dart';

// ignore_for_file: type=lint
class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $UserTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userEmailMeta =
      const VerificationMeta('userEmail');
  @override
  late final GeneratedColumn<String> userEmail = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userImageMeta =
      const VerificationMeta('userImage');
  @override
  late final GeneratedColumn<Uint8List> userImage = GeneratedColumn<Uint8List>(
      'user_image', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, userId, userEmail, userImage];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'user';

  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['user_name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('email')) {
      context.handle(_userEmailMeta,
          userEmail.isAcceptableOrUnknown(data['email']!, _userEmailMeta));
    } else if (isInserting) {
      context.missing(_userEmailMeta);
    }
    if (data.containsKey('user_image')) {
      context.handle(_userImageMeta,
          userImage.isAcceptableOrUnknown(data['user_image']!, _userImageMeta));
    } else if (isInserting) {
      context.missing(_userImageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      userEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      userImage: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}user_image'])!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final String name;
  final String userId;
  final String userEmail;
  final Uint8List userImage;

  const UserData(
      {required this.id,
      required this.name,
      required this.userId,
      required this.userEmail,
      required this.userImage});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(name);
    map['user_id'] = Variable<String>(userId);
    map['email'] = Variable<String>(userEmail);
    map['user_image'] = Variable<Uint8List>(userImage);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      name: Value(name),
      userId: Value(userId),
      userEmail: Value(userEmail),
      userImage: Value(userImage),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userId: serializer.fromJson<String>(json['userId']),
      userEmail: serializer.fromJson<String>(json['userEmail']),
      userImage: serializer.fromJson<Uint8List>(json['userImage']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'userId': serializer.toJson<String>(userId),
      'userEmail': serializer.toJson<String>(userEmail),
      'userImage': serializer.toJson<Uint8List>(userImage),
    };
  }

  UserData copyWith(
          {int? id,
          String? name,
          String? userId,
          String? userEmail,
          Uint8List? userImage}) =>
      UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        userId: userId ?? this.userId,
        userEmail: userEmail ?? this.userEmail,
        userImage: userImage ?? this.userImage,
      );

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId, ')
          ..write('userEmail: $userEmail, ')
          ..write('userImage: $userImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, userId, userEmail, $driftBlobEquality.hash(userImage));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.name == this.name &&
          other.userId == this.userId &&
          other.userEmail == this.userEmail &&
          $driftBlobEquality.equals(other.userImage, this.userImage));
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> userId;
  final Value<String> userEmail;
  final Value<Uint8List> userImage;

  const UserCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userId = const Value.absent(),
    this.userEmail = const Value.absent(),
    this.userImage = const Value.absent(),
  });

  UserCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String userId,
    required String userEmail,
    required Uint8List userImage,
  })  : name = Value(name),
        userId = Value(userId),
        userEmail = Value(userEmail),
        userImage = Value(userImage);

  static Insertable<UserData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? userId,
    Expression<String>? userEmail,
    Expression<Uint8List>? userImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'user_name': name,
      if (userId != null) 'user_id': userId,
      if (userEmail != null) 'email': userEmail,
      if (userImage != null) 'user_image': userImage,
    });
  }

  UserCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? userId,
      Value<String>? userEmail,
      Value<Uint8List>? userImage}) {
    return UserCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      userEmail: userEmail ?? this.userEmail,
      userImage: userImage ?? this.userImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['user_name'] = Variable<String>(name.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (userEmail.present) {
      map['email'] = Variable<String>(userEmail.value);
    }
    if (userImage.present) {
      map['user_image'] = Variable<Uint8List>(userImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId, ')
          ..write('userEmail: $userEmail, ')
          ..write('userImage: $userImage')
          ..write(')'))
        .toString();
  }
}

class $NoteTable extends Note with TableInfo<$NoteTable, NoteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $NoteTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productTitleMeta =
      const VerificationMeta('productTitle');
  @override
  late final GeneratedColumn<String> productTitle = GeneratedColumn<String>(
      'note_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scriptureTextMeta =
      const VerificationMeta('scriptureText');
  @override
  late final GeneratedColumn<String> scriptureText = GeneratedColumn<String>(
      'scripture_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, productTitle, scriptureText];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'note';

  @override
  VerificationContext validateIntegrity(Insertable<NoteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('note_title')) {
      context.handle(
          _productTitleMeta,
          productTitle.isAcceptableOrUnknown(
              data['note_title']!, _productTitleMeta));
    } else if (isInserting) {
      context.missing(_productTitleMeta);
    }
    if (data.containsKey('scripture_text')) {
      context.handle(
          _scriptureTextMeta,
          scriptureText.isAcceptableOrUnknown(
              data['scripture_text']!, _scriptureTextMeta));
    } else if (isInserting) {
      context.missing(_scriptureTextMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  NoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      productTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note_title'])!,
      scriptureText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scripture_text'])!,
    );
  }

  @override
  $NoteTable createAlias(String alias) {
    return $NoteTable(attachedDatabase, alias);
  }
}

class NoteData extends DataClass implements Insertable<NoteData> {
  final int id;
  final String userId;
  final String productTitle;
  final String scriptureText;

  const NoteData(
      {required this.id,
      required this.userId,
      required this.productTitle,
      required this.scriptureText});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['note_title'] = Variable<String>(productTitle);
    map['scripture_text'] = Variable<String>(scriptureText);
    return map;
  }

  NoteCompanion toCompanion(bool nullToAbsent) {
    return NoteCompanion(
      id: Value(id),
      userId: Value(userId),
      productTitle: Value(productTitle),
      scriptureText: Value(scriptureText),
    );
  }

  factory NoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      productTitle: serializer.fromJson<String>(json['productTitle']),
      scriptureText: serializer.fromJson<String>(json['scriptureText']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'productTitle': serializer.toJson<String>(productTitle),
      'scriptureText': serializer.toJson<String>(scriptureText),
    };
  }

  NoteData copyWith(
          {int? id,
          String? userId,
          String? productTitle,
          String? scriptureText}) =>
      NoteData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        productTitle: productTitle ?? this.productTitle,
        scriptureText: scriptureText ?? this.scriptureText,
      );

  @override
  String toString() {
    return (StringBuffer('NoteData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('productTitle: $productTitle, ')
          ..write('scriptureText: $scriptureText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, productTitle, scriptureText);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.productTitle == this.productTitle &&
          other.scriptureText == this.scriptureText);
}

class NoteCompanion extends UpdateCompanion<NoteData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> productTitle;
  final Value<String> scriptureText;

  const NoteCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.productTitle = const Value.absent(),
    this.scriptureText = const Value.absent(),
  });

  NoteCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String productTitle,
    required String scriptureText,
  })  : userId = Value(userId),
        productTitle = Value(productTitle),
        scriptureText = Value(scriptureText);

  static Insertable<NoteData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? productTitle,
    Expression<String>? scriptureText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (productTitle != null) 'note_title': productTitle,
      if (scriptureText != null) 'scripture_text': scriptureText,
    });
  }

  NoteCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<String>? productTitle,
      Value<String>? scriptureText}) {
    return NoteCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      productTitle: productTitle ?? this.productTitle,
      scriptureText: scriptureText ?? this.scriptureText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (productTitle.present) {
      map['note_title'] = Variable<String>(productTitle.value);
    }
    if (scriptureText.present) {
      map['scripture_text'] = Variable<String>(scriptureText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('productTitle: $productTitle, ')
          ..write('scriptureText: $scriptureText')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDataBase extends GeneratedDatabase {
  _$AppDataBase(QueryExecutor e) : super(e);
  late final $UserTable user = $UserTable(this);
  late final $NoteTable note = $NoteTable(this);

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [user, note];
}
