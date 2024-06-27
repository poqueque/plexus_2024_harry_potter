import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends ChangeNotifier {
  bool showSubtitles = false;

  Preferences() {
    init();
  }

  Future<void> init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    showSubtitles = preferences.getBool('show_subtitles') ?? false;
    notifyListeners();
  }

  Future<void> setShowSubtitles(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    showSubtitles = value;
    preferences.setBool('show_subtitles', value);
    notifyListeners();
  }
}
