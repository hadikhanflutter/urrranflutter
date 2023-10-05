import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountProvider with ChangeNotifier {
  int count = 50;
  int get _count => count;
  void setCount() {
    count++;
    notifyListeners();
  }
}
