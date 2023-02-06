import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
      ),
      body: Center(
        child: CupertinoButton(
          color: Colors.blue,
          onPressed: () {
            showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text("Date Picker"),
                    content: const Text("Are you sure pick a date ? "),
                    actions: [
                      CupertinoDialogAction(
                        /// This parameter indicates this action is the default,
                        /// and turns the action's text to bold text.
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                          showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return Container(
                                  color: Colors.white,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  child: CupertinoDatePicker(
                                      use24hFormat: true,
                                      mode: CupertinoDatePickerMode.date,
                                      initialDateTime: DateTime.now(),
                                      onDateTimeChanged: (date) {}),
                                );
                              });
                        },
                        child: const Text('Yes'),
                      ),
                      CupertinoDialogAction(
                        /// This parameter indicates the action would perform
                        /// a destructive action such as deletion, and turns
                        /// the action's text color to red.
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No'),
                      ),
                    ],
                  );
                });
          },
          child: const Text("Open Dialog"),
        ),
      ),
    );
  }
}
