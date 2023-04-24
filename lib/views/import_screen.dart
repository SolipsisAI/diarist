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
  String filePath = "";
  late List<Map<dynamic, dynamic>> csvData;
  double progress = 0;

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
      setState(() {
        file = result.files.first;
        filePath = file.path!;
      });

      csvData = await importer.readCsv(filePath);
    } else {
      // User canceled the picker
    }
  }

  void importFile() {
    for (var i = 1; i < csvData.length; i++) {
      setState(() {
        progress = importer.importRowDict(
            csvData[i], ["uuid", "date", "text", "modifiedDate"]);
      });
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
            Text(
              filePath.isEmpty ? "Select a file" : "Selected $filePath",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            ElevatedButton(
                onPressed: selectFile, child: const Text('Select DayOne CSV')),
            filePath.isNotEmpty
                ? ImportMenu(progress: progress, importFile: importFile)
                : Container()
          ],
        ),
      ),
    );
  }
}

class ImportMenu extends StatelessWidget {
  const ImportMenu({Key? key, required this.progress, required this.importFile})
      : super(key: key);

  final double progress;
  final dynamic importFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LinearProgressIndicator(
          value: progress,
          semanticsLabel: 'Import progress',
          minHeight: 20,
        ),
        ElevatedButton(onPressed: importFile, child: const Text('Import')),
      ],
    );
  }
}
