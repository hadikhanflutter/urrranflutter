import 'package:codingsq/sqflite/model_student.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart ' as p;

final String database_name = 'student_db';
final String table_name = 'student_table';
final String column_id = 'id';
final String column_name = 'name';

class DatabaseStudent {
  static Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  static DatabaseStudent? _databaseStudent;

  DatabaseStudent.createInstance();

  factory DatabaseStudent() {
    if (_databaseStudent == null) {
      _databaseStudent = DatabaseStudent.createInstance();
    }
    return _databaseStudent!;
  }

  Future<Database?> initializeDatabase() async {
    try {
      var databsePath = await getDatabasesPath();
      String path = p.join(databsePath, database_name);
      Database database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) {
          db.execute('''
      create table $table_name(
      $column_id INTEGER PRIMARY KEY  ,
      $column_name text not null)
       
      ''');
        },
      );
      return database;
    } catch (e) {
      print('DatabaseError ${e.toString()}');
      return null;
    }
  }

//this method check the value and add a value
  Future<bool> AddStudent(ModelStudent modelStudent) async {
    try {
      Database? db = await this.database;
      var result = await db.insert(table_name, modelStudent.toMap());
      print('student added database:$result');
      return true;
    } catch (e) {
      print('DatabaseError add function ${e.toString()}');
      return false;
    }
  }

//this method update a value
  Future<bool> UpdateStudent(ModelStudent modelStudent) async {
    try {
      Database? db = await this.database;
      var result = await db.update(table_name, modelStudent.toMap(),
          where: '$column_id=?', whereArgs: [modelStudent.id]);
      print(result);
      return true;
    } catch (e) {
      print('DatabaseError Update function ${e.toString()}');
      return false;
    }
  }

// this method delete a file by its id
  Future<bool> DeleteStudentById(String id) async {
    try {
      Database db = await this.database;
      var result =
          await db.delete(table_name, where: '$column_id=?', whereArgs: [id]);
      return true;
    } catch (e) {
      print('DatabaseError Delete function ${e.toString()}');
      return false;
    }
  }

//this method delete  a values
  Future<bool> DeleteAllStudent() async {
    try {
      Database db = await this.database;
      var result = await db.delete(
        table_name,
      );
      return true;
    } catch (e) {
      print('DatabaseError Deleter  function ${e.toString()}');
      return false;
    }
  }

  Future<List<ModelStudent>> GetAllStudent() async {
    List<ModelStudent> list_student = [];

    try {
      Database db = await this.database;
//this method show all the map values
      List<Map<String, dynamic>> result =
          await db.query(table_name, orderBy: '$column_id DESC');
      if (result.length > 0) {
        for (int i = 0; i < result.length; i++) {
          ModelStudent modelStudent =
              ModelStudent.ModelobjectFromMap(result[i]);
          list_student.add(modelStudent);
        }
      }

      return list_student;
    } catch (e) {
      print('DatabaseError getall student  function ${e.toString()}');
      return list_student;
    }
  }

//this method count the items
  Future<int> getCountStudent() async {
    try {
      Database db = await this.database;
      List<Map<String, dynamic>> result = await db.query(table_name);
      return result.length;
    } catch (e) {
      print('databaseError through some conditions ${e.toString()}');
      return 0;
    }
  }
}
