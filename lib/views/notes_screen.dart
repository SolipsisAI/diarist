import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:sidebarx/sidebarx.dart';

import '../models/note.dart';
import '../utils/helpers.dart';
import '../components/text_editor.dart';
import '../utils/isolate_utils.dart';

class NotesScreen extends StatefulWidget {
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

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final ValueNotifier<Note?> selected = ValueNotifier(null);
  void selectValue(Note? note) => selected.value = note;
  void clearValue() => selected.value = null;

  void onTextChange(String text) {
    addNote(text);
  }

  Future<void> addNote(String text) async {
    final newNote = Note()
      ..createdAt = currentTimestamp()
      ..updatedAt = currentTimestamp()
      ..uuid = randomString()
      ..text = text;

    await widget.isar.writeTxn((_isar) async {
      await _isar.notes.put(newNote);
    });

    debugPrint('Added note ${newNote.id}');
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          return TextEditor(
              onTextChange: onTextChange, isSmallScreen: widget.isSmallScreen);
        });
  }
}
