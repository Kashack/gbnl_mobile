import 'package:gbnl_mobile/core/database/app_database.dart';
import 'package:gbnl_mobile/core/database/database_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  getIt.registerSingleton<DatabaseHelper>(
    DatabaseHelper(await AppDatabase().initDB())
  );


}