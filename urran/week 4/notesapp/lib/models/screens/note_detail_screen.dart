import 'package:flutter/material.dart';
import 'package:notesapp/database_helper/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/note.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;
  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return _NoteDetailState(this.note, this.appBarTitle);
  }
}

class _NoteDetailState extends State<NoteDetail> {
  String appBarTitle;
  Note note;
  static var _priority = ['high', 'low'];
  DatabaseHelper helper = DatabaseHelper();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  _NoteDetailState(this.note, this.appBarTitle);
  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    descriptionController.text = note.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
          onPressed: () {
            moveToLastScreen();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton(
                items: _priority.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(
                      dropDownStringItem,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
                style: TextStyle(),
                value: getPriorityAsString(note.priority),
                onChanged: (valueSelectionByUser) {
                  setState(() {
                    debugPrint('User selected$valueSelectionByUser');
                    updatePrrorityAsInt(valueSelectionByUser!);
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: TextField(
                controller: titleController,
                style: TextStyle(),
                onChanged: (value) {
                  debugPrint('Something Change in title text field');
                  updateTitle();
                },
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: TextField(
                controller: descriptionController,
                style: TextStyle(),
                onChanged: (value) {
                  debugPrint('Something Change in title text field');
                  updateDescription();
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint('Save Button Clicked');
                        _save();
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          debugPrint('Delete Button Clicked');
                          _delete();
                        });
                      },
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  //convert the string priority in the form of integer before saving it to database
  void updatePrrorityAsInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

  //covert itn priority to string priority and display it to user in drapdown
  String getPriorityAsString(int value) {
    String? priority;
    switch (value) {
      case 1:
        priority = _priority[0];
        break;
      case 2:
        priority = _priority[1];
    }
    return priority!;
  }

  //update th title of note object
  void updateTitle() {
    note.title = titleController.text;
  }

  //update the description of note object
  void updateDescription() {
    note.description = descriptionController.text;
  }

  //save data to database
  void _save() async {
    moveToLastScreen();
    note.date = DateFormat('yyyy-MM-dd').format(DateTime.now());

    int result;
    if (note.id != null) {
      result = await helper.updateNote(note);
    } else {
      result = await helper.insertNote(note);
    }
    if (result != null) {
      _showAlterDialog('Status', 'Note Saved Successfully');
    } else {
      _showAlterDialog('Status', 'Problem Saving Note');
    }
  }

  //delete  operation
  //case1 trying to delete new note come to deatil page by pressing fab
  //case 2 trynig to delete old..valid id
  void _delete() async {
    moveToLastScreen();
    if (note.id == null) {
      _showAlterDialog('Satus', 'no note was deleted');
      return;
    }
    int result = await helper.deleteNote(note.id);
    if (result != 0) {
      _showAlterDialog('status', 'note deleted successfully');
    } else {
      _showAlterDialog('status', 'error occured while deleting note');
    }
  }

  // display  a dialog
  void _showAlterDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
