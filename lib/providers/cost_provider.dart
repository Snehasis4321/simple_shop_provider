import 'package:flutter/material.dart';

class CostProvider extends ChangeNotifier {
  int _cost = 0;

  int _totalItems = 0;

  int get getTotalCost => _cost;

  int get getTotalItems => _totalItems;

  void addItem(int amt) {
    _cost += amt;
    _totalItems++;
    notifyListeners();
  }

  void removeItem(int amt) {
    _cost -= amt;
    _totalItems--;
    notifyListeners();
  }
}
