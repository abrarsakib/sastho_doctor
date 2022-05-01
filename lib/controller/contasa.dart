import 'package:flutter/material.dart';

class Contasa extends ChangeNotifier {
  String _val = "Home";

  String get name => _val;

  changename(String name) async {
    _val = name;
    notifyListeners();
  }
}
