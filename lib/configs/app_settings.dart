import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  // SharedPreferences _prefs =
  //     SharedPreferences.getInstance() as SharedPreferences;
  SharedPreferences? _prefs;

  Map<String, List<String>> database = {
    'tasks': <String>[],
  };

  AppSettings() {
    _startSettings();
  }

  _startSettings() async {
    // await _startPreferences();
    await _readLocale();
  }

  // Future<void> _startPreferences() async {
  //   // _prefs = await SharedPreferences.getInstance();
  //   if (_prefs == null) {
  //     _prefs = await SharedPreferences.getInstance();
  //   }
  // }

  _readLocale() {
    final taskList = _prefs?.getStringList('tasks') ?? [];

    database = {
      'tasks': taskList,
    };
    notifyListeners();
  }

  setLocale(List<String> tasks) async {
    await _prefs?.setStringList('tasks', tasks);
    await _readLocale();
  }
}
