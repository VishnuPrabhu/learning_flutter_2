import 'dart:io';

import 'package:hacker_news_app/src/models/item_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NewsDbProvider {
  Database db;

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "items.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
          CREATE TABLE Items (
            id INTEGER PRIMARY KEY,
            type TEXT,
            by TEXT,
            time INTEGER,
            parent INTEGER,
            kids BLOB,
            dead INTEGER,
            deleted INTEGER,
            url TEXT,
            score INTEGER,
            title TEXT,
            descendants INTEGER
          )
        """);
      },
    );
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      'Items',
      columns: null,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return ItemModel.fromDB(maps.first);
    }
    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db.insert("Items", item.toMap());
  }
}
