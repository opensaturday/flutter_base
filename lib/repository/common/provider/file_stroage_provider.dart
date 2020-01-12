import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class FileStorageProvider {
  String _tag;

  File _localFile;

  FileStorageProvider._internal();

  static final FileStorageProvider _fileStorageProvider = FileStorageProvider._internal();

  factory FileStorageProvider() {
    return _fileStorageProvider;
  }

  Future<File> getLocalFile({String tag}) async {
    if (tag == null) {
      tag = "default";
    }

    if (_localFile != null && _tag != null && _tag != tag) {
      return _localFile;
    }

    _tag = tag;

//    try {
//
//    } catch (Exception e) {
//
//    }

    final documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, "LimeAppStorage__$_tag.json");

    _localFile = File(path);
    return _localFile;
  }

  Future<FileSystemEntity> clean() async {
    final file = await getLocalFile();

    return file.delete();
  }
}
