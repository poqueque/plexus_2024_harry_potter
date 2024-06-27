import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends ChangeNotifier {
  bool showSubtitles = false;
  int reviewNumber = 0;

  Preferences() {
    init();
  }

  /// Initialize the show subtitles from the SharedPreferences
  Future<void> init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    showSubtitles = preferences.getBool('show_subtitles') ?? false;
    notifyListeners();
  }

  /// Get the show subtitles from the SharedPreferences
  Future<void> setShowSubtitles(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    showSubtitles = value;
    preferences.setBool('show_subtitles', value);
    notifyListeners();
  }

  /// Get the review number from the SharedPreferences
  Future<void> setReviewNumber(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    reviewNumber = value;
    preferences.setInt('review_number', value);
    notifyListeners();
  }
}
