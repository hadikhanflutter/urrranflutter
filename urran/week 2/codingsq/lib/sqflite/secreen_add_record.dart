import 'package:codingsq/sqflite/database_student.dart';
import 'package:codingsq/sqflite/model_student.dart';
import 'package:flutter/material.dart';

class ScreenAddRecord extends StatefulWidget {
  const ScreenAddRecord({Key? key}) : super(key: key);

  @override
  State<ScreenAddRecord> createState() => _ScreenAddRecordState();
}

class _ScreenAddRecordState extends State<ScreenAddRecord> {
  String id = '';
  String name = '';
  DatabaseStudent databaseStudent = DatabaseStudent();
  @override
  void initState() {
    super.initState();
    setState(() {
      databaseStudent.initializeDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Record'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (String value) {
                setState(() {
                  id = value;
                  print(id);
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  name = value;
                  print(name);
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    if (id.isNotEmpty) {
                      ModelStudent modelStudent =
                          ModelStudent(id: int.parse(id), name: name);
                      databaseStudent.UpdateStudent(modelStudent).then((value) {
                        if (value) {
                          print('record update successfully');
                        } else {
                          print('record updation faild');
                        }
                      });
                    } else {
                      print('plesase provide id');
                    }
                  },
                  child: const Text(
                    'update record',
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    ModelStudent modelStudent =
                        ModelStudent(id: int.parse(id), name: name);
                    // bool isAdded =
                    //   await databaseStudent.AddStudent(modelStudent);
                    databaseStudent.AddStudent(modelStudent)
                        .then((bool isAdded) {
                      if (isAdded) {
                        print('Record added successfully');
                      } else {
                        print('record insertion failed');
                      }
                    });
                  },
                  child: const Text('Add record'),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    if (id.isNotEmpty) {
                      databaseStudent.DeleteStudentById(id).then((value) {
                        if (value) {
                          print('record deleted successfully');
                        } else {
                          print('record updation faild');
                        }
                      });
                    } else {
                      print('plesase provide id');
                    }
                  },
                  child: const Text(
                    'Delete Single record',
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    databaseStudent.DeleteAllStudent().then((bool isAdded) {
                      if (isAdded) {
                        print('Record deleted successfully');
                      } else {
                        print('record deletion failed');
                      }
                    });
                  },
                  child: const Text('Delete all record'),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    if (id.isNotEmpty) {
                      databaseStudent.getCountStudent().then((value) {
                        print('Total Record = $value');
                      });
                    } else {
                      print('Error found record ');
                    }
                  },
                  child: Text('count Record'),
                ),
                TextButton(
                  onPressed: () async {
                    databaseStudent.GetAllStudent()
                        .then((List<ModelStudent> list) {
                      list.forEach((element) {
                        print('ID:${element.id}, Name:${element.name}');
                      });
                      print('error found');
                    });
                  },
                  child: Text('List of Student'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
