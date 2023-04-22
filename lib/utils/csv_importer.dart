import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:realm/realm.dart';

const FIELD_MAPPING = {'date': 'createdAt', 'modifiedDate': 'updatedAt'};

class CSVImporter {
  late List<String> fields;

  CSVImporter();

  void importCsv(String path, Function addRow, List<String> headers) async {
    final csvData = await readCsv(path);
    print('[CSVImporter]: ${csvData.length}');

    for (var i = 0; i < csvData.length; i++) {
      final rowData = csvData[i];
      print('row $i added/updated $rowData');
      //addRow(csvData[i]);
    }

    print('[CSVImporter]: ${csvData.length}');
  }

  Future<List<List>> readCsv(String path) async {
    final csvFile = File(path).openRead();
    final csvData = await csvFile
        .transform(utf8.decoder)
        .transform(const CsvToListConverter(fieldDelimiter: ",", eol: "\n"))
        .toList();

    return csvData;
  }
}
