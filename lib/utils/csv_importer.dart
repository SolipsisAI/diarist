import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

void importCsv(String path) async {
  final csvFile = File(path).openRead();
  final csvData = await csvFile
      .transform(utf8.decoder)
      .transform(const CsvToListConverter(fieldDelimiter: ",", eol: "\n"))
      .toList();
  print('${csvData.length}');
}
