import 'package:kublet/data/models/device/device_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DeviceSqliteService {
  String kubletTable = 'Kublets';

  Future<Database> initializeDB() async {
    String databaseName = 'device_db.db';

    String path = await getDatabasesPath();

    return openDatabase(
      join(path, databaseName),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $kubletTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            device_info TEXT,
            app_data TEXT,
            created_on TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  // Future<Database> initializeDB() async {
  //   String databaseName = 'database.db';
  //
  //   String path = await getDatabasesPath();
  //
  //   return openDatabase(
  //     join(path, databaseName),
  //     onCreate: (db, version) async {
  //       await db.execute('''
  //       CREATE TABLE $kubletTable(
  //         id INTEGER PRIMARY KEY AUTOINCREMENT,
  //         deviceIdentifier TEXT UNIQUE,
  //         deviceName TEXT,
  //         deviceUpdatedName TEXT,
  //         appId TEXT,
  //         tickerId TEXT,
  //         ticketName TEXT,
  //         tickerSymbol TEXT,
  //         uiImageUrl TEXT,
  //         firmwareUrl TEXT
  //       )
  //     ''');
  //     },
  //     version: 1,
  //   );
  // }

  Future<int> storeDevice(
      DeviceModel deviceConfigurationModel) async {
    final Database db = await initializeDB();
    final id = await db.insert(kubletTable, deviceConfigurationModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<int> updateDeviceInfo(
      DeviceModel deviceConfigurationModel) async {
    final Database db = await initializeDB();
    final id = deviceConfigurationModel.id;
    final rowsAffected = await db.update(
      kubletTable,
      deviceConfigurationModel.toJson(),
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return rowsAffected;
  }

  Future<List<DeviceModel>> getDeviceList() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(kubletTable);
    return queryResult
        .map((e) => DeviceModel.fromJson(e))
        .toList();
  }

  Future<void> deleteDeviceInfo(String id) async {
    final db = await initializeDB();
    try {
      await db.delete(kubletTable, where: "device_identifier = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}
