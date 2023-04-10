import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:sidebarx/sidebarx.dart';

import '../models/note.dart';
import '../models/prediction.dart';
import '../utils/helpers.dart';
import '../utils/isolate_utils.dart';
import '../components/common_ui.dart';
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
  bool isEditing = false;
  final ValueNotifier<NoteItem?> selected = ValueNotifier(null);
  void selectValue(NoteItem? item) => selected.value = item;
  void clearValue() => selected.value = null;

  late Stream<void> notesChanged;
  late List<NoteItem> noteItems;

  @override
  void initState() {
    super.initState();
    setState(() {
      noteItems = widget.notes.map((Note note) => note.toItem()).toList();
    });
    //initStateAsync();
  }

  void initStateAsync() async {
    notesChanged = widget.isar.notes.watchLazy();

    notesChanged.listen((event) async {
      // Watch for latest updated
      final updatedNote =
          await widget.isar.notes.where().sortByUpdatedAtDesc().findFirst();
      final IsolateData isolateData = IsolateData(
        updatedNote!.text,
        updatedNote.id!,
        widget.interpreters['emotion']!,
        widget.interpreters['sentiment']!,
        widget.vocab['emotion'],
        widget.vocab['sentiment'],
      );

      final result = await inference(isolateData);
      updatePrediction(result, updatedNote);
    });
  }

  void makePrediction() {
    print('makePrediction');
  }

  void updatePrediction(Map<String, Object> result, Note note) async {
    final String emotionLabel = result['emotion'] as String;
    final String sentimentLabel = result['sentiment'] as String;
    final double emotionScore = result['emotionScore'] as double;
    final double sentimentScore = result['sentimentScore'] as double;

    final prediction = Prediction()
      ..id = note.id
      ..createdAt = currentTimestamp()
      ..emotion = emotionLabel
      ..emotionScore = emotionScore
      ..sentiment = sentimentLabel
      ..sentimentScore = sentimentScore
      ..noteUuid = note.uuid;

    await widget.isar.writeTxn((isar) async {
      await isar.predictions.put(prediction);
    });

    debugPrint(
        'P ${prediction.id} ${prediction.emotion} ${prediction.sentiment}');
  }

  Future<Map<String, Object>> inference(IsolateData isolateData) async {
    ReceivePort responsePort = ReceivePort();
    widget.isolateUtils.sendPort
        .send(isolateData..responsePort = responsePort.sendPort);
    final result = await responsePort.first;
    return result;
  }

  Future<void> addNote() async {
    final timestamp = currentTimestamp();
    final newNote = Note()
      ..createdAt = timestamp
      ..updatedAt = timestamp
      ..uuid = randomString()
      ..text = ""
      ..title = toDateString(timestamp);

    await widget.isar.writeTxn((_isar) async {
      await _isar.notes.put(newNote);
    });

    debugPrint('Added note ${newNote.id}');

    setState(() {
      noteItems.insert(0, newNote.toItem());
    });
  }

  Future<void> updateNote(NoteItem item) async {
    debugPrint('updated ${item.id}');

    final note = item.toNote();
    note.updatedAt = currentTimestamp();

    await widget.isar.writeTxn((_isar) async {
      await _isar.notes.put(note);
    });
  }

  void refreshNotes() {
    debugPrint('Refresh');
  }

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
    if (!isEditing) {
      makePrediction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          return NotesView(
            items: noteItems,
            isSmallScreen: widget.isSmallScreen,
            onAdd: addNote,
            onUpdate: updateNote,
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
