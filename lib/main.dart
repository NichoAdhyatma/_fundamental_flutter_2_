import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyWidget());

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => Count(),
        child: const MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<Count>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Appbar",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Count>(
            builder: (context, value, child) => Text(
              value._count.toString(),
              style: const TextStyle(fontSize: 35),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  count.add();
                },
                icon: const Icon(
                  Icons.add,
                ),
              ),
              IconButton(
                onPressed: () {
                  count.min();
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Count extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void add() {
    _count += 1;
    notifyListeners();
  }

  void min() {
    _count -= 1;
    notifyListeners();
  }
}
