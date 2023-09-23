import 'package:flutter/foundation.dart';

class FavoriteModel extends ChangeNotifier {
  final List _selectItem = [];
  List get selectItem => _selectItem;

  void isFavorite(int index) {
    if (_selectItem.contains(index)) {
      _selectItem.remove(index);
    } else {
      _selectItem.add(index);
    }

    notifyListeners();
  }

  void addItem(int index) {
    _selectItem.add(index);
    notifyListeners();
  }

  void removeItem(int index) {
    _selectItem.remove(index);
    notifyListeners();
  }
}
