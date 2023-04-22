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

    for (var i = 1; i < csvData.length; i++) {
      final rowData = csvData[i];
      print('row $i added/updated $rowData');
      //addRow(csvData[i]);
    }

    print('[CSVImporter]: ${csvData.length}');
  }

  Future<List<Map>> readCsv(String path) async {
    final csvFile = File(path).openRead();
    final csvData = await csvFile
        .transform(utf8.decoder)
        .transform(const CsvToListConverter(fieldDelimiter: ",", eol: "\n"))
        .toList();

    if (csvData.isEmpty) {
      return [];
    }

    final headers = csvData[0];
    final rowDicts = csvData.map((row) {
      final rowDict = {};
      for (int i = 0; i < headers.length; i++) {
        rowDict[headers[i]] = row[i];
      }
      return rowDict;
    });

    return rowDicts.toList();
  }
}
