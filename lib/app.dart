import 'package:flutter/material.dart';

import 'package:toon_fyp_project/views/home_page.dart';


class FypApp extends StatelessWidget {
  const FypApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(title: this.title),
    );
  }
}
