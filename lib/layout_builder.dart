import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;
    final myAppBar = AppBar(
      title: const Text("Flutter"),
    );

    final bodyHeight = heightApp - paddingTop - myAppBar.preferredSize.height;

    return Scaffold(
      appBar: myAppBar,
      body: Container(
        width: widthApp,
        height: bodyHeight * 0.7,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyContainer(widthApp: widthApp, bodyHeight: bodyHeight),
            MyContainer(widthApp: widthApp, bodyHeight: bodyHeight),
            MyContainer(widthApp: widthApp, bodyHeight: bodyHeight),
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
    required this.widthApp,
    required this.bodyHeight,
  });

  final double widthApp;
  final double bodyHeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Container(
        width: widthApp * 0.3,
        height: p1.maxHeight * 0.9,
        color: Colors.amber,
      ),
    );
  }
}
