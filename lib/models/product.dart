import 'dart:collection';
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String img;
  final dynamic color;

  Product({
    required this.id, 
    required this.title, 
    required this.description,
    required this.price, 
    required this.img, 
    required this.color
});
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
  id: 'p1',
  title: 'Желтый взрыв',
  description: 'Ты получил',
  price: 15.00,
  img: 'assets/images/VKS-011.png',
  color: '0xFFFFF59D',
  ),

  Product(
  id: 'p2',
  title: 'Желтый взрыв',
  description: 'Ты получил',
  price: 15.00,
  img: 'assets/images/VKS-011.png',
  color: '0xFFFFF59D',
  ),

  Product(
  id: 'p3',
  title: 'Желтый взрыв',
  description: 'Ты получил',
  price: 15.00,
  img: 'assets/images/VKS-011.png',
  color: '0xFFFFF59D',
  ),

  Product(
  id: 'p4',
  title: 'Желтый взрыв',
  description: 'Ты получил',
  price: 15.00,
  img: 'assets/images/VKS-011.png',
  color: '0xFFFFF59D',
  ),
  ];

  UnmodifiableListView <Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id) => _items.singleWhere((value) => value.id == id);
}