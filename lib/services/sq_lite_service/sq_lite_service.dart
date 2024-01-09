import 'package:kublet/data/models/device_configuration/device_configuration_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {
  String table = 'Kublets';

  Future<Database> initializeDB() async {
    String databaseName = 'database.db';

    String path = await getDatabasesPath();

    return openDatabase(
      join(path, databaseName),
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $table(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          device_identifier TEXT UNIQUE,
          device_name TEXT,
          device_updated_name TEXT,
          ssid_name TEXT,
          ssid_password TEXT,
          app_id TEXT,
          ticker_id TEXT,
          ticket_name TEXT,
          ticker_symbol TEXT,
          ui_image TEXT,
          ui_firmware TEXT
        )
      ''');
      },
      version: 1,
    );
  }

  Future<int> createItem(
      DeviceConfigurationModel deviceConfigurationModel) async {
    final Database db = await initializeDB();
    final id = await db.insert(table, deviceConfigurationModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<int> updateItem(
      DeviceConfigurationModel deviceConfigurationModel) async {
    final Database db = await initializeDB();
    final uid = deviceConfigurationModel.deviceIdentifier;
    final rowsAffected = await db.update(
      table,
      deviceConfigurationModel.toJson(),
      where: 'device_identifier = ?',
      whereArgs: [uid],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return rowsAffected;
  }

  Future<List<DeviceConfigurationModel>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(table);
    return queryResult
        .map((e) => DeviceConfigurationModel.fromJson(e))
        .toList();
  }

  Future<void> deleteItem(String id) async {
    final db = await initializeDB();
    try {
      await db.delete(table, where: "device_identifier = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}
