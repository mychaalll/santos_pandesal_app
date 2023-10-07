import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  String _activeContainer = '';

  String get activeContainer => _activeContainer;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setActiveContainer(String text) {
    _activeContainer = text;
    notifyListeners();
  }


}