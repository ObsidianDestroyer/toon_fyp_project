import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class SamplesPage extends StatefulWidget {
  const SamplesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  State<SamplesPage> createState() => _SamplesPageState();
}


class _SamplesPageState extends State<SamplesPage> {
  String folderName = 'samples';
  List<String> samplesList = [];

  Future<Directory> createOrGetFolderInAppDirectory() async {
    final Directory _applicationDirectory = (
        await getApplicationDocumentsDirectory()
    );
    final Directory _applicationSamplesDirectory = Directory(
      '${_applicationDirectory.path}/$folderName/',
    );
    if (await _applicationSamplesDirectory.exists()) {
      return _applicationSamplesDirectory;
    }
    final Directory _applicationSamplesNewDirectory = (
        await _applicationSamplesDirectory.create(recursive: true)
    );
    return _applicationSamplesNewDirectory;
  }

  void listSamples() async {
    final Directory appDirectory = await createOrGetFolderInAppDirectory();
    await for (var file in appDirectory.list()) {
      if (samplesList.contains(file.path)) continue;
      samplesList.add(file.path);
    }
    setState(() {});
  }

  @override
  void initState() {
    listSamples();
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
        child: samplesList.isEmpty ? Container(
          alignment: Alignment.topCenter,
          child: Card(
            child: ListTile(
              title: Text(
                'Empty',
                textAlign: TextAlign.center,
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
