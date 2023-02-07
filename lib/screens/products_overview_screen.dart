import 'package:flutter/material.dart';
import 'package:flutter_2/providers/cart.dart';
import 'package:flutter_2/screens/cart_screen.dart';
import 'package:flutter_2/widgets/badge.dart';
import 'package:provider/provider.dart';
import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) {
              return BadgeIcon(
                value: value.lengthCart.toString(),
                child: child!,
              );
            },
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
