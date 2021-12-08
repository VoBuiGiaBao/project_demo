import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:aina_assignment/data/local/userDao.dart';

class DbHelper {
  static late Database _db;

  static _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE "${UserDao.tableName}" ( "${UserDao.id}" INTEGER PRIMARY KEY, "${UserDao.login}" TEXT, "${UserDao.avatarUrl}" TEXT, "${UserDao.htmlUrl}" TEXT, "${UserDao.name}" TEXT, "${UserDao.location}" TEXT, "${UserDao.bio}" TEXT, "${UserDao.publicRepos}" INTEGER, "${UserDao.followers}" INTEGER, "${UserDao.following}" INTEGER)');
    log('_onCreate. version $version');
  }

  static Future init() async {
    _db = await openDatabase(
      'aina.db',
      version: 1,
      singleInstance: true,
      onCreate: _onCreate,
    );
  }

  static Database get db => _db;
}
