import 'package:diarist/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'common_ui.dart';
import 'in_app_bar.dart';
import 'notes_list.dart';
import 'text_editor.dart';

class NoteView extends StatefulWidget {
  final Key noteKey;

  const NoteView({
    Key? key,
    required this.noteKey,
    required this.noteItem,
    required this.isSmallScreen,
    required this.onUpdate,
  }) : super(key: noteKey);

  final bool isSmallScreen;
  final NoteItem noteItem;
  final Function onUpdate;

  @override
  NoteViewState createState() => NoteViewState();
}

class NoteViewState extends State<NoteView> {
  late NoteItem _noteItem;
  bool _isOn = false;

  @override
  void initState() {
    super.initState();
    _noteItem = widget.noteItem;
  }

  void toggle() {
    setState(() {
      _isOn = !_isOn;
    });
  }

  void onTextChange(text) {
    _noteItem.text = text;
    widget.onUpdate(_noteItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: ToggleAppBar(
              title: toDateString(_noteItem.createdAt),
              isOn: _isOn,
              onToggle: (e) {
                toggle();
              },
            )),
        body: _isOn
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
