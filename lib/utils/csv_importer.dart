import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

class CSVImporter {
  late List<String> fields;
  double progress = 0;
  int rowsProcessed = 0;
  int totalRows = 0;

  final Function importRow;

  CSVImporter({required this.importRow});

  void importCsv(String path, List<String> headers) async {
    final rowDicts = await readCsv(path);
    print('[CSVImporter]: ${rowDicts.length}');

    if (rowDicts.isEmpty || rowDicts.length <= 2) return;

    for (var i = 1; i < rowDicts.length; i++) {
      importRow(rowDicts[i], headers);
    }

    print('[CSVImporter]: ${rowDicts.length} imported');
  }

  double importRowDict(Map<dynamic, dynamic> rowDict, List<String> headers) {
    importRow(rowDict, headers);
    rowsProcessed += 1;
    progress = rowsProcessed / totalRows;
    return progress;
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

    final rowDictsList = rowDicts.toList();

    rowsProcessed = 0;
    totalRows = rowDictsList.length;

    return rowDictsList;
  }
}
