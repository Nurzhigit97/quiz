import 'package:flutter/material.dart';
import 'package:quiz/question_model.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute('''
      CREATE TABLE questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        questions TEXT,
        answer INTEGER,
        isAnswerTrue INTEGER
      )
    ''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbestech.db',
      version: 1,
      onCreate: (sql.Database db, int version) async {
        print("...........createing a table..");
        await createTables(db);
      },
    );
  }

  static Future<int> createItem(QuestionModel questionModel) async {
    final db = await SqlHelper.db();
    final data = QuestionModel(
        id: 1,
        title: '1212',
        questions: ['1930', '2000', '1990', '2022'],
        answer: 1930,
        isAnswerTrue: false,
        trueImage:
            "https://w7.pngwing.com/pngs/769/150/png-transparent-buried-treasure-treasure-miscellaneous-treasure-buried-treasure-thumbnail.png");
    final id = await db.insert('questions', data as Map<String, Object?>,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SqlHelper.db();
    return db.query('questions', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SqlHelper.db();
    return db.query('questions', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id, String title, String description) async {
    final db = await SqlHelper.db();
    final data = {
      'title': title,
    };
    final result =
        await db.update('questions', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete('questions', where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint('Something went wrong when deleting an questions: $err');
    }
  }
}
