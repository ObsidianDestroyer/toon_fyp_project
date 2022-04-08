import 'package:flutter/material.dart';
import 'package:toon_fyp_project/views/samples_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Mixer'),
      ),
      // body: Container(
      //   alignment: Alignment.topCenter,
      //   child: ElevatedButton(
      //     child: const Text('Home page'),
      //     onPressed: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => const SamplesPage(
      //                 title: 'Recorded sample',
      //               ),
      //           ),
      //       );
      //     },
      //   ),
      // ),
      body: Center(
        child: Container(
          color: Colors.amber,
          child: Row(
            children: [],
          ),
        ),
      )
    );
  }
}
