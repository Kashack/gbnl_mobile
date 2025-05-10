import 'package:gbnl_mobile/core/database/database_query.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(DatabaseQuery.createTable);
      },
    );
  }
}
