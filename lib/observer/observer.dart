import 'package:flutter/cupertino.dart';

class Observer extends ChangeNotifier {

  // Strings
  String _decimalObserver = '';
  String _binaryObserver = '';
  String _octalObserver = '';
  String _hexadecimalObserver = '';

  // Consumer
  String get decimalObserver => _decimalObserver;
  String get binaryObserver => _binaryObserver;
  String get octalObserver => _octalObserver;
  String get hexadecimalObserver => _hexadecimalObserver;

  // Change Notifiers
  void updateDecimalStr(String str){
    this._decimalObserver = str;
    notifyListeners();
  }

  void updateBinaryStr(String str){
    this._binaryObserver = str;
    notifyListeners();
  }

  void updateOctalStr(String str){
    this._octalObserver = str;
    notifyListeners();
  }

  void updateHexadecimalStr(String str){
    this._hexadecimalObserver = str;
    notifyListeners();
  }
}