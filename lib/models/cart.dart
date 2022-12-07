import 'dart:collection';
import 'package:flutter/cupertino.dart';

// Cart model
class Cart {
  final String id;
  final String title;
  final int number;
  final num price;
  final String img;

  Cart(
      {required this.id,
      required this.title,
      required this.number,
      required this.price,
      required this.img});
}

// Cart Provider

class CartDataProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  UnmodifiableMapView<String, Cart> get cartItems =>
      UnmodifiableMapView(_cartItems);

  int get cartItemsCount => _cartItems.length;

  dynamic get totalAmount {
    num total = 0.0;
    _cartItems.forEach((key, item) {
      total += item.price * item.number;
    });

    return total;
  }

  get values => null;

  void addItem({productId, price, title, img}) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (ex) => Cart(
                id: ex.id,
                title: ex.title,
                price: ex.price,
                img: ex.img,
                number: ex.number + 1,
              ));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => Cart(
                id: '${DateTime.now()}',
                title: title,
                price: price,
                img: img,
                number: 1,
              ));
    }
    notifyListeners();
  }

  void deleteItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void updateItemsAddOne(String productId) {
    _cartItems.update(
      productId,
      (ex) => Cart(
          id: ex.id,
          title: ex.title,
          price: ex.price,
          img: ex.img,
          number: ex.number + 1),
    );
    notifyListeners();
  }

  void updateItemsSubOne(String productId) {
    if (_cartItems[productId]!.number < 2) {
      deleteItem(productId);
    } else {
      _cartItems.update(
        productId,
        (ex) => Cart(
            id: ex.id,
            title: ex.title,
            price: ex.price,
            img: ex.img,
            number: ex.number + 1),
      );
    }
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}
