import 'package:flutter/material.dart';

import '../models/item.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void editItem(int index, Item item) {
    _items[index] = item;
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
