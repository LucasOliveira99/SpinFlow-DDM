import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseConnection {
  static final DatabaseConnection _instance = DatabaseConnection._internal();
  factory DatabaseConnection() => _instance;
  DatabaseConnection._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;
    final dbPath = await databaseFactory.getDatabasesPath();
    final path = join(dbPath, 'app.db');
    // await deleteDatabase(path); // removed as per instructions
    _database = await databaseFactory.openDatabase(path,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: _onCreate,
        ));
    return _database!;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE video_aula(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        link_video TEXT,
        ativo INTEGER
      )
    ''');
  }
}
