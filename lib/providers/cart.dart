import 'package:flutter/material.dart';
import 'package:flutter_2/models/cart_item.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get lengthCart {
    return _items.length;
  }

  double get total {
    double total = 0;
    _items.forEach((key, value) {
      total += value.qty * value.price;
    });
    return total;
  }

  List<CartItem> cartItemList() {
    return _items.values.toList();
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          price: value.price,
          qty: value.qty + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          qty: 1,
        ),
      );
    }
    notifyListeners();
  }
}
