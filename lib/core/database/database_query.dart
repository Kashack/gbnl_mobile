class DatabaseQuery{
  static const createTable = '''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstName TEXT,
            lastName TEXT,
            createdAt INTEGER
          )
        ''';
}