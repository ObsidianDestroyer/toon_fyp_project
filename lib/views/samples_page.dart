import 'package:flutter/material.dart';

import 'package:toon_fyp_project/files/files.dart';


class SamplesPage extends StatefulWidget with FilesService {
  const SamplesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  State<SamplesPage> createState() => _SamplesPageState();
}


class _SamplesPageState extends State<SamplesPage> {
  String folderName = 'samples';
  List<String> samplesList = [];

  @override
  void initState() {
    FilesService.listSamples(folderName).then(
          (samples) {
            samplesList.addAll(samples);
            super.setState(() {});
            },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      body: Center(
        child: samplesList.isEmpty ? Center(
            child: Container(
              alignment: Alignment.topCenter,
              child: Card(
                child: ListTile(
                  title: Text(
                    'Empty',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ) : ListView.builder(
              itemCount: samplesList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(samplesList[index]),
                  ),
                );
                },
        ),
      ),
    );
  }
}
