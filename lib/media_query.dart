import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   DeviceOrientation.portraitUp as List<DeviceOrientation>,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: const Text("Media Query"),
    );

    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final isLanscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final body1Height = isLanscape ? bodyHeight * 0.5 : bodyHeight * 0.3;
    final body2Height = isLanscape ? bodyHeight * 0.5 : bodyHeight * 0.7;

    return Scaffold(
      appBar: myAppBar,
      body: Center(
        child: Column(
          children: [
            Container(
              height: body1Height,
              width: mediaQueryWidth,
              color: Colors.amber,
            ),
            Container(
              height: body2Height,
              color: Colors.grey[300],
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                    title: Text("Text"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
