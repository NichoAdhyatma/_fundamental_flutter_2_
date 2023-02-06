import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  DateTime selectedDate = DateTime.now();
  int count = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tanggal di pilih : $count",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            Text(
              DateFormat.yMMMEd().format(selectedDate),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2003),
                  lastDate: DateTime(2025),
                  initialDatePickerMode: DatePickerMode.year,
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  builder: (context, child) => Theme(
                    data: ThemeData.light(),
                    child: child!,
                  ),
                ).then(
                  (value) => setState(
                    () {
                      selectedDate = value!;
                      count++;
                    },
                  ),
                );
              },
              child: const Text("Pilih Tanggal"),
            )
          ],
        ),
      ),
    );
  }
}
