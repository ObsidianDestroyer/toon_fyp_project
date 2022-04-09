import 'package:flutter/material.dart';



class RecorderPage extends StatefulWidget {
  const RecorderPage({Key? key, required this.title}) : super(key: key);

  final String title;

  State<RecorderPage> createState() => _RecorderPageState();
}


class _RecorderPageState extends State<RecorderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
