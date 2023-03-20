import 'package:sqlite3/sqlite3.dart';

class DatabaseProvider {
  static late final Database db = sqlite3.openInMemory();

  static void init() {
    db.execute('''
      CREATE TABLE IF NOT EXISTS echos (
        message TEXT NOT NULL
      )
    ''');
    db.execute('''
      INSERT INTO echos (message) VALUES
        ('abc'),
        ('efg'),
        ('xyz')
    ''');
  }
}
