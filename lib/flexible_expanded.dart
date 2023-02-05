import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WidgetItem(),
    );
  }
}

class WidgetItem extends StatelessWidget {
  const WidgetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyApp"),
      ),
      body: Row(
        children: [
          Flexible(
            
            flex: 1,
            child: Container(
              height: 100,
              color: Colors.red,
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              height: 100,
              color: Colors.green,
              child: const Text("akskdjkjlasddddddddddddddddddjsaWDADAFDSFDSFS"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
