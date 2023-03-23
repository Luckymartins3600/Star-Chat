// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

Future<File> fileFromImageUrl({String uri, String name}) async {
  try {
    final response = await http.get(Uri.parse(uri));
    final documentDirectory = await getApplicationDocumentsDirectory();
    final file = File(join(documentDirectory.path, name ?? 'imagetest.txt'));
    file.writeAsBytesSync(response.bodyBytes);
    return file;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<File> pdfAsset() async {
  Directory tempDir = await getTemporaryDirectory();
  File tempFile = File('${tempDir.path}/set_any_name.pdf');
  print(tempFile);
  ByteData bd = await rootBundle.load('assets/en/legal_notes.pdf');
  await tempFile.writeAsBytes(bd.buffer.asUint8List(), flush: true);
  return tempFile;
}
