import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../features/auth/data/model/user.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase() => _instance;
  AppDatabase._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstName TEXT,
            lastName TEXT
          )
        ''');
      },
    );
  }

  Future<UserModel> insertUser(UserModel user) async {
    final db = await database;
    await db.insert('users', user.toMap());
    return user;
  }

  Future<UserModel?> getUser() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    if (maps.isNotEmpty) return UserModel.fromMap(maps.last);
    return null;
  }
}
