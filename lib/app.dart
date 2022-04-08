import 'package:flutter/material.dart';


class FypApp extends StatelessWidget {
  const FypApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Mixer',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
