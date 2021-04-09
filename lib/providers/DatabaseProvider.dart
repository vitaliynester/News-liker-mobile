import 'package:sqflite/sqflite.dart';

import '../models/NewsModel.dart';

class DatabaseProvider {
  final String tableNews = 'news';
  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnCreatedAt = 'created_at';
  final String columnAdt = 'adt';

  Database db;

  Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + 'demo.db';
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
                        create table $tableNews ( 
                        $columnId integer not null, 
                        $columnTitle text not null,
                        $columnCreatedAt text not null,
                        $columnAdt text not null)
                        ''');
      },
    );
  }

  Future insert(NewsModel news) async {
    await db.insert(
      tableNews,
      news.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<NewsModel> getNews(int id) async {
    List<Map> maps = await db.query(
      tableNews,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return NewsModel.fromJson(maps.first);
    }
    return null;
  }

  Future<List<NewsModel>> getAllNews() async {
    List<Map> maps = await db.query(tableNews);
    List<NewsModel> newsList = new List<NewsModel>();
    if (maps.isNotEmpty) {
      for (var map in maps) {
        newsList.add(NewsModel.fromJson(map));
      }
      return newsList;
    }
    return [];
  }

  Future<int> delete(int id) async {
    return await db.delete(tableNews, where: '$columnId = ?', whereArgs: [id]);
  }

  Future close() async => db.close();
}
