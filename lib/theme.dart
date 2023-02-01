import 'package:flutter/material.dart';

void main() {
  runApp(const ThemeApp());
}

class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        // visualDensity: VisualDensity(horizontal: 4, vertical: 4),
        // primaryColor: Colors.amber,
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.deepPurple,
          secondary: Colors.purple,
          seedColor: Colors.pink,
        ),
        textTheme: const TextTheme(
          labelLarge: TextStyle(fontSize: 60, fontStyle: FontStyle.italic),
          bodyLarge: TextStyle(fontSize: 60, color: Colors.pink),
          bodyMedium: TextStyle(fontSize: 60, color: Colors.pink),
          titleLarge: TextStyle(fontSize: 60, color: Colors.pink),
        ),
      ),
      home: const ThemesItem(),
    );
  }
}

class ThemesItem extends StatelessWidget {
  const ThemesItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Theme App",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Text",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Button",
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.arrow_left,
          size: 35.0,
        ),
      ),
    );
  }
}
