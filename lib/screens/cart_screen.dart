import 'package:flutter/material.dart';
import 'package:flutter_2/providers/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final total = cart.total;
    final cartData = cart.cartItemList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Total : \$ $total",
                style: const TextStyle(fontSize: 35),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(cartData[index].title),
                      subtitle: Text(
                        "\$ ${cartData[index].price * cartData[index].qty}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          "x ${cartData[index].qty}",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
