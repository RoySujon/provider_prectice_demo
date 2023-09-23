import 'package:flutter/foundation.dart';

class ProviderDemo extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increement() {
    _count++;
    notifyListeners();
  }

  double _opacity = 1.0;
  double get opacity => _opacity;

  void changOpacity(double value) {
    _opacity = value;
    notifyListeners();
  }
}
