import 'package:flutter/material.dart';
import 'package:gestion_eglise/shares/globals.dart';

class AdmetHome extends ChangeNotifier {
  get isVisible => _isVisible;
  bool _isVisible = false;

  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }

  get isValid => _isValid;
  bool _isValid = false;

  // get isValidPassword => _isValidPassword;
  // bool _isValidPassword = false;

  void isValidUserName(String input) {
    input == Global.validUserName.first ? _isValid = true : _isValid = false;
    notifyListeners();
  }

  // void isValidPassWord(String input) {
  //   input == Global.validPassword.first ? _isValid = true : false;
  //   notifyListeners();
  // }
}
