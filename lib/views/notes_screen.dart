import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:sidebarx/sidebarx.dart';

import '../models/note.dart';
import '../utils/helpers.dart';
import '../utils/isolate_utils.dart';
import '../components/common_ui.dart';
import '../components/text_editor.dart';
import '../components/notes_list.dart';
import '../components/note_view.dart';
import '../components/two_columns.dart';

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
  void selectValue(Note? item) => selected.value = item;
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
          return NotesView(items: items, isSmallScreen: isSmallScreen, onAdd: onAdd, onUpdate: onUpdate, onSelect: onSelect, onClear: onClear, selected: selected, onRefresh: onRefresh);
        });
  }
}

class NotesView extends StatelessWidget {
  const NotesView(
      {Key? key,
      required this.items,
      required this.isSmallScreen,
      required this.onAdd,
      required this.onUpdate,
      required this.onSelect,
      required this.onClear,
      required this.selected,
      required this.onRefresh})
      : super(key: key);

  final List<NoteItem> items;
  final bool isSmallScreen;
  final Function onAdd;
  final Function onUpdate;
  final Function onSelect;
  final Function onClear;
  final Function onRefresh;
  final ValueNotifier<NoteItem?> selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: ValueListenableBuilder(
        builder: (context, _, child) {
          return TwoColumns(
            paneProportion: 30,
            showPane2: (selected.value != null) ? true : false,
            onClosePane2Popup: () {
              onClear();
            },
            pane1: NotesList(
              items: items,
              selected: selected.value,
              onSelect: onSelect,
              onAdd: onAdd,
              onRefresh: onRefresh,
            ),
            pane2: (selected.value != null)
                ? NoteView(
                    noteKey: ObjectKey(selected.value!.id),
                    noteItem: selected.value!,
                    isSmallScreen: isSmallScreen,
                    onUpdate: onUpdate,
                  )
                : const Center(
                    child: Text('ThoughtLog',
                        style: TextStyle(color: gray, fontSize: 48))),
          );
        },
        valueListenable: selected,
      ),
    );
  }
}