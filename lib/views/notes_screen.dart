import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:sidebarx/sidebarx.dart';

import '../models/note.dart';
import '../utils/helpers.dart';

import '../components/common_ui.dart';
import '../components/text_editor.dart';
import '../utils/isolate_utils.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen(
      {Key? key,
      required this.controller,
      required this.isSmallScreen,
      required this.isar,
      required this.notes,
      required this.interpreters,
      required this.vocab,
      required this.isolateUtils})
      : super(key: key);

  final SidebarXController controller;
  final bool isSmallScreen;
  final Isar isar;
  final List<Note> notes;
  final Map<String, int> interpreters;
  final Map<String, dynamic> vocab;
  final IsolateUtils isolateUtils;

  void onTextChange(String text) {
    debugPrint("Entered $text");
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return TextEditor(
              onTextChange: onTextChange, isSmallScreen: isSmallScreen);
        });
  }
}
