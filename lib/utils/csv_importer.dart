import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

void importCsv(String path) async {
  final input = File(path).openRead();
  final fields = await input
      .transform(utf8.decoder)
      .transform(CsvToListConverter())
      .toList();

  print('Rows: ${fields.length}');
}
