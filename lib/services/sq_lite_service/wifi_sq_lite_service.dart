import 'package:kublet/data/models/wifi_info/wifi_info.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class WifiSqliteService {
  String wifiTable = 'wifi_table';

  Future<Database> initializeDB() async {
    String databaseName = 'wifi_db.db';

    String path = await getDatabasesPath();

    return openDatabase(
      join(path, databaseName),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $wifiTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            ssid TEXT,
            password TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  Future<int> storeWifiInfo(WifiInfo wifiInfo) async {
    final Database db = await initializeDB();
    print(db);
    final id = await db.insert(wifiTable, wifiInfo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<int> updateItem(WifiInfo wifiInfo) async {
    final Database db = await initializeDB();
    final id = wifiInfo.id;
    final rowsAffected = await db.update(
      wifiTable,
      wifiInfo.toJson(),
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return rowsAffected;
  }

  Future<List<WifiInfo>> getWifi() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(wifiTable);
    return queryResult.map((e) => WifiInfo.fromJson(e)).toList();
  }

  Future<void> deleteItem(int id) async {
    final db = await initializeDB();
    try {
      await db.delete(wifiTable, where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}
