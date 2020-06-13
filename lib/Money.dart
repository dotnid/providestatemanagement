import 'package:flutter/foundation.dart';

class Money with ChangeNotifier{
  int _balance = 1000;

  int get balance => _balance;
  set balance(int value){
    _balance = value;
    notifyListeners();
  }
}