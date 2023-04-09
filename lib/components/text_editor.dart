import 'package:flutter/material.dart';
import '../utils/debouncer.dart';
import 'common_ui.dart';

class TextEditor extends StatefulWidget {
  TextEditor(
      {Key? key,
      required this.onTextChange,
      required this.isSmallScreen,
      this.initialValue})
      : super(key: key);

  final Function onTextChange;
  final bool isSmallScreen;
  final String? initialValue;

  @override
  TextEditorState createState() => TextEditorState();
}

class TextEditorState extends State<TextEditor> {
  final TextEditingController _textController = TextEditingController();
  final _debouncer = Debouncer(delay: 500);

  @override
  void initState() {
    super.initState();
    _textController.text = widget.initialValue ?? "";
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  onTextChangeWrapper(String text) {
    _debouncer.run(() => (widget.onTextChange(text)));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      style: const TextStyle(
        color: white,
        fontFamily: 'Cousine',
        height: 1.5,
      ),
      onChanged: onTextChangeWrapper,
      decoration: InputDecoration(
        hintText: 'Write something',
        contentPadding: EdgeInsets.all(getPadding(widget.isSmallScreen)),
      ),
      expands: true,
      minLines: null,
      maxLines: null,
    );
  }
}
