

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/shop_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  /// Getter
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'library.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE shops(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productName TEXT,
        quantity TEXT
      )
    ''');
  }

  /// CRUD
  // CREATE
  Future<int> insertShop(Shop shop) async {
    final db = await database;
    return await db.insert(
      'shops',
     shop.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // READ
  Future<List<Shop>> getShops() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('shops');
    return List.generate(maps.length, (i) => Shop.fromMap(maps[i]));
  }

  // UPDATE
  Future<int> updateShop(Shop shop) async {
    final db = await database;
    return await db.update(
      'shops',
      shop.toMap(),
      where: 'id = ?',
      whereArgs: [shop.id],
    );
  }

  // DELETE
  Future<int> deleteShop(int id) async {
    final db = await database;
    return await db.delete('shops', where: 'id = ?', whereArgs: [id]);
  }
}