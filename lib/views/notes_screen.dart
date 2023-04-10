import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../models/note.dart';
import '../utils/isolate_utils.dart';
import '../components/common_ui.dart';
import '../components/notes_list.dart';
import '../components/note_view.dart';
import '../components/two_columns.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen(
      {Key? key,
      required this.notes,
      required this.controller,
      required this.isSmallScreen,
      required this.interpreters,
      required this.vocab,
      required this.isolateUtils,
      required this.onAdd,
      required this.onUpdate})
      : super(key: key);

  final List<Note> notes;
  final SidebarXController controller;
  final bool isSmallScreen;
  final Map<String, int> interpreters;
  final Map<String, dynamic> vocab;
  final IsolateUtils isolateUtils;
  final Function onAdd;
  final Function onUpdate;

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  bool isEditing = false;
  final ValueNotifier<NoteItem?> selected = ValueNotifier(null);
  void selectValue(NoteItem? item) => selected.value = item;
  void clearValue() => selected.value = null;

  late Stream<void> notesChanged;

  Future<Map<String, Object>> inference(IsolateData isolateData) async {
    ReceivePort responsePort = ReceivePort();
    widget.isolateUtils.sendPort
        .send(isolateData..responsePort = responsePort.sendPort);
    final result = await responsePort.first;
    return result;
  }

  void refreshNotes() {
    debugPrint('Refresh');
  }

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          return NotesView(
            items: widget.notes.map((Note note) => note.toItem()).toList(),
            isSmallScreen: widget.isSmallScreen,
            onAdd: widget.onAdd,
            onUpdate: widget.onUpdate,
            onSelect: selectValue,
            onClear: clearValue,
            selected: selected,
            onRefresh: refreshNotes,
            onToggle: toggleEditing,
            isEditing: isEditing,
          );
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
      required this.onRefresh,
      required this.onToggle,
      required this.isEditing})
      : super(key: key);

  final List<NoteItem> items;
  final bool isSmallScreen;
  final Function onAdd;
  final Function onUpdate;
  final Function onSelect;
  final Function onClear;
  final Function onRefresh;
  final ValueNotifier<NoteItem?> selected;
  final Function onToggle;
  final bool isEditing;

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
                    isEditing: isEditing,
                    onToggle: onToggle,
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
