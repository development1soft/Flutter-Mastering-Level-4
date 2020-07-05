import 'dart:async';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Note {

  static Database _db;

  Future<Database> get db async {

    if(_db == null)
    {
      _db = await initialDB();

      return _db; 
    
    }else{

      return _db;

    }

  }

  initialDB() async{
    io.Directory docDirect = await getApplicationDocumentsDirectory();
    String path = join(docDirect.path,'testdb.db');
    var mydb = await openDatabase(path,version: 1,onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db,int version) async{
    await db.execute('CREATE TABLE "notes" ("id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,"note"	TEXT NOT NULL)');
    print('Notes Table Created');
  }


}