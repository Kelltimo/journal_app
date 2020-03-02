import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


ThemeData light = ThemeData(
  brightness: Brightness.light, 
  primarySwatch: Colors.indigo, 
  accentColor: Colors.pink,
  scaffoldBackgroundColor: Color(0xfff1f1f1),
  buttonColor: Color(0xfff1f1f1),
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark, 
  primarySwatch: Colors.indigo, 
  accentColor: Colors.pink,
  textTheme: TextTheme(body1: TextStyle(color:Colors.teal[300])), 
  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
  buttonColor: Colors.black
); 

class ThemeNotifier with ChangeNotifier {
  final String key = "theme"; 
  SharedPreferences _prefs; 
  bool _darkTheme; 

  bool get darkTheme => _darkTheme; 

  ThemeNotifier() {
    _darkTheme = false; 
    _loadFromPrefs(); 
  }

  toggleTheme()  {
    _darkTheme = !_darkTheme; 
    _saveToPrefs(); 
    notifyListeners(); 
  }

  _initPrefs() async {
    if(_prefs == null) {
      _prefs = await SharedPreferences.getInstance(); 
    }
  }

  _loadFromPrefs() async {
    await _initPrefs(); 
    _darkTheme = _prefs.getBool(key) ?? true; 
    notifyListeners(); 
  }

  _saveToPrefs() async {
    await _initPrefs(); 
    _prefs.setBool(key, _darkTheme); 
  }


}

