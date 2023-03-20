import 'package:sqlite3/sqlite3.dart';
import 'package:dartserver/helpers/database_provider.dart'
    show DatabaseProvider;

class Echo {
  late final Database _db;
  final String message;

  Echo({required this.message}) {
    _db = DatabaseProvider.db;
  }

  List<Echo> getAllEchos() {
    final results = _db.select('SELECT * FROM echos');
    return results
        .map((row) => Echo(message: row['message'] as String))
        .toList();
  }

  void addEcho(String msg) {
    _db.execute('INSERT INTO echos (message) VALUES (?)', [msg]);
  }
}
