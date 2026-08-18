import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
Future<List<File>> pickImages() async {
  try {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);
    if (result != null) {
      return result.paths
          .whereType<String>()
          .map((path) => File(path))
          .toList();
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return [];
}