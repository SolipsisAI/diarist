import 'package:diarist/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'common_ui.dart';
import 'in_app_bar.dart';
import 'notes_list.dart';
import 'text_editor.dart';

class NoteView extends StatefulWidget {
  final Key noteKey;

  const NoteView(
      {Key? key,
      required this.noteKey,
      required this.noteItem,
      required this.isSmallScreen,
      required this.onUpdate,
      required this.onAnalyze})
      : super(key: noteKey);

  final bool isSmallScreen;
  final NoteItem noteItem;
  final Function onUpdate;
  final Function onAnalyze;

  @override
  NoteViewState createState() => NoteViewState();
}

class NoteViewState extends State<NoteView> {
  late NoteItem _noteItem;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _noteItem = widget.noteItem;
  }

  void onTextChange(text) {
    _noteItem.text = text;
    widget.onUpdate(_noteItem);
  }

  void toggle() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: ToggleAppBar(
              title: toDateString(_noteItem.createdAt),
              isOn: isEditing,
              onToggle: (e) {
                toggle();
              },
              onAnalyze: () {
                widget.onAnalyze(_noteItem.toNote());
              },
            )),
        body: isEditing
            ? TextEditor(
                onTextChange: onTextChange,
                isSmallScreen: widget.isSmallScreen,
                initialValue: _noteItem.text,
              )
            : Container(
                padding: EdgeInsets.all(getPadding(widget.isSmallScreen)),
                child: SingleChildScrollView(
                    child: Text(_noteItem.text,
                        style: const TextStyle(
                            color: white, height: 1.5, fontSize: 16)))));
  }
}
