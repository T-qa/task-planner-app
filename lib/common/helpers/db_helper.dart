import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DbBHelper {
  static Future<void> createTable(Database db) async {
    await db.execute(
      'CREATE TABLE todo('
      'id INTEGER PRIMARY KEY AUTOINCREMENT,'
      'title STRING, description TEXT, date String,'
      'startTime String, endTime String,'
      'remind INTEGER, repeat STRING,'
      'isCompleted INTEGER'
      ')',
    );

    await db.execute(
      'CREATE TABLE user('
      'id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0'
      'isVerified INTEGER'
      ')',
    );
  }

  static Future<Database> db() async {
    return openDatabase('t-qa', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await createTable(db);
    });
  }

  static Future<int> createItem(Task task) async {
    final db = await DbBHelper.db();
    final id = await db.insert(' ', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return id;
  }

  static Future<int> createUser(int isVerified) async {
    final db = await DbBHelper.db();
    final data = {
      'id': 1,
      'isVerified': isVerified,
    };

    final id = await db.insert(' ', data,
        conflictAlgorithm: ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getUser() async {
    final db = await DbBHelper.db();
    return db.query('user', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DbBHelper.db();
    return db.query('todos', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getSingleItem(int id) async {
    final db = await DbBHelper.db();
    return db.query('user', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
    int id,
    String title,
    String description,
    int isCompleted,
    String date,
    String startTime,
    String endTime,
  ) async {
    final db = await DbBHelper.db();
    final data = {
      'title': title,
      'desc': description,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
    };

    final results =
        await db.update('todos', data, where: 'id=?', whereArgs: [id]);

    return results;
  }

  static Future<void> deleteItem(int id) async {
    final db = await DbBHelper.db();
    try {
      db.delete('todos', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      debugPrint('Unable to delet $e');
    }
  }
}
