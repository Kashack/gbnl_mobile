import 'package:flutter_test/flutter_test.dart';
import 'package:gbnl_mobile/core/database/database_helper.dart';
import 'package:gbnl_mobile/core/database/database_query.dart';
import 'package:gbnl_mobile/features/auth/data/model/user.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late Database database;
  late DatabaseHelper databaseHelper;

  setUpAll(() async {
    database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath,options: OpenDatabaseOptions(
      version: 1,
      onCreate: (db, version) async {
         await db.execute(DatabaseQuery.createTable);
      },
    ));
    databaseHelper = DatabaseHelper(database);
  });

  tearDownAll(() {
    database.close();
  },);

  group('AppDatabase', () {

    test('first insert user into database', () async {
      final user = UserModel(
        id: 1,
        firstName: 'John',
        lastName: 'Doe',
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      await databaseHelper.insertUser(user);
    });

    test('getUsers should return inserted users', () async {
      UserModel user1 = UserModel (firstName: 'Ali', lastName: "Game", createdAt: DateTime.now().millisecondsSinceEpoch,);

      await databaseHelper.insertUser(user1);

      UserModel? users = await databaseHelper.getUser();

      expect (users?.firstName, "Ali");
    });

  });
}