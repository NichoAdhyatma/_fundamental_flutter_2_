import 'package:flutter/material.dart';
import 'package:flutter_2/providers/all_products.dart';
import 'package:flutter_2/providers/cart.dart';
import 'package:flutter_2/screens/cart_screen.dart';
import 'package:flutter_2/widgets/badge.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    // ...
    final product = Provider.of<Products>(context).getProductById(productId);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
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
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.network(
              "${product.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "${product.title}",
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "\$ ${product.price}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "${product.description}",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Berhasil ditambahkan",
                  ),
                  duration: Duration(
                    milliseconds: 500,
                  ),
                ),
              );
              cart.addItem(
                productId,
                product.id!,
                product.price!,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add_shopping_cart),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Add to cart"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
