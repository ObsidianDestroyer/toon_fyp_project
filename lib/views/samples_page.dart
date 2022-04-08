import 'package:flutter/material.dart';


class SamplesPage extends StatefulWidget {
  const SamplesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  State<SamplesPage> createState() => _SamplesPageState();
}


class _SamplesPageState extends State<SamplesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: AppBar(),
    );
  }
}
