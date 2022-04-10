import 'package:flutter/material.dart';

import 'package:toon_fyp_project/views/samples_page.dart';
import 'package:toon_fyp_project/views/recorder_page.dart';


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
        title: Text(this.widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                  width: 100,
                  height: 100,
              ),
              child: ElevatedButton(
                child: Text('Recorder'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RecorderPage(
                        title: 'Recorder',
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(width: 10),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                width: 100,
                height: 100,
              ),
              child: ElevatedButton(
                child: Text(
                  'Recorded samples',
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SamplesPage(
                        title: 'Recorded samples',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )
      )
    );
  }
}
