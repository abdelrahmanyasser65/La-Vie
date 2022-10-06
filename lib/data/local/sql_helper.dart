import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class HelperSql {
  static Database? _db;

  static Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  static initialDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "la>db");
    print(path);
    var myDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myDB;
  }

  //edit
  static _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Notes(ID INTEGER PRIMARY KEY,Description TEXT NOT NULL,Title TEXT NOT NULL,Date TEXT NOT NULL)');
  }

  static insertDB(Map<String, dynamic> data) async {
    Database? dbClient = await db;
    var result = await dbClient!.insert("la", data);
    print(result);
    return result;
  }

  static deleteDB(int id) async {
    Database? dbClient = await db;
    var result = await dbClient!.rawUpdate("DELETE FROM Notes WHERE ID = $id");
    print(result);
    return result;
  }

  //Update in DB
  static updateDB(int id, String title, String description, String date) async {
    Database? dbClient = await db;
    var result = await dbClient?.rawUpdate(
        "Update Notes SET Title = '$title', Description = '$description', Date = '$date' Where ID = $id");
    print(result);
    return result;
  }
//Get all rows in DB
// static getAllRowsDB() async
// {
//   List<NotesModel> noteList = [];
//   Database? dbClient = await db;
//   var result = await dbClient!.query("Notes");
//   for (var i in result)
//   {
//     noteList.add(NotesModel(id: i["ID"],
//         description: i["Description"],
//         title: i["Title"],
//         date: i["Date"]));
//   }
//   print(noteList);
//   return noteList;
// }
}
