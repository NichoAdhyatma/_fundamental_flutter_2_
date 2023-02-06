import 'package:flutter/material.dart';

class Product {
  @required
  String title;
  @required
  String description;
  @required
  String imageUrl;
  @required
  int price;

  Product(this.title, this.description, this.imageUrl, this.price);
}
