import 'package:flutter/material.dart';
import 'package:flutter_2/widgets/badge.dart';
import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          BadgeIcon(
            value: "0",
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
