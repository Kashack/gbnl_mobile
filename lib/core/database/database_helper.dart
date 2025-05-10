import 'package:sqflite/sqlite_api.dart';

import '../../features/auth/data/model/user.dart';

class DatabaseHelper{
  final Database database;

  DatabaseHelper(this.database);


  Future<UserModel> insertUser(UserModel user) async {
    user.id = await database.insert('users', user.toMap());
    return user;
  }

  Future<UserModel?> getUser() async {
    ///Get user that is created last as the current user
    final db = database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      orderBy: 'createdAt DESC',
      limit: 1,
    );
    if (maps.isNotEmpty) return UserModel.fromMap(maps.first);
    return null;
  }

}