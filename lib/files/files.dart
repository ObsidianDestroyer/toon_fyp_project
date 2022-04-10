import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';


class FilesService {

  static Future<Directory> createOrGetFolderInAppDirectory(String folderName) async {
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

  static Future<List<String>> listSamples(String folderName) async {
    final Directory appDirectory = (
        await createOrGetFolderInAppDirectory(folderName)
    );
    List<String> samplesList = [];
    await for (var file in appDirectory.list()) {
      if (!samplesList.contains(file.path)) samplesList.add(file.path);
      continue;
    }
    return samplesList;
  }
}
