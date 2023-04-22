import 'dart:io';

import 'package:diarist/models/note.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../utils/csv_importer.dart';

class ImportScreen extends StatefulWidget {
  const ImportScreen({Key? key, required this.importRow}) : super(key: key);

  final Function importRow;

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late PlatformFile file;
  late CSVImporter importer;
  late String filePath;
  late List<Map<dynamic, dynamic>> csvData;

  @override
  void initState() {
    importer = CSVImporter(importRow: widget.importRow);
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = result.files.first;
      filePath = file.path!;
      csvData = await importer.readCsv(filePath);
    } else {
      // User canceled the picker
    }
  }

  void importFile() {
    for (var i = 1; i < csvData.length; i++) {
      widget.importRow(csvData[i], ["uuid", "date", "text", "modifiedDate"]);
    }
    print('Imported');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Select a file',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            ElevatedButton(
                onPressed: selectFile, child: const Text('Select DayOne CSV')),
            LinearProgressIndicator(
              value: importer.progress,
              semanticsLabel: 'Linear progress indicator',
            ),
            ElevatedButton(onPressed: importFile, child: const Text('Import')),
          ],
        ),
      ),
    );
  }
}
