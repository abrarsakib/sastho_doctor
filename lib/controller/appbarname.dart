import 'package:flutter/material.dart';

class AppbarName extends ChangeNotifier {
  String _val = "Home";

  String get name => _val;

  changename(String name) async {
    _val = name;
    notifyListeners();
  }
}
