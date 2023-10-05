import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilsToast {
  void toastmessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 20.0);
  }
}
