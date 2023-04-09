import 'package:flutter/material.dart';
import 'common_ui.dart';

class InAppBar extends StatelessWidget {
  const InAppBar({
    Key? key,
    required this.title,
    required this.onAdd,
  }) : super(key: key);

  final String title;
  final Function onAdd;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: accentCanvasColor,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      actions: <Widget>[
        IconButton(
          onPressed: () { onAdd(); },
          icon: const Icon(Icons.add)
        ),
      ],
    );
  }
}

class ToggleAppBar extends StatelessWidget {
  const ToggleAppBar({
    Key? key,
    required this.title,
    required this.onToggle,
    required this.isOn
  }) : super(key: key);

  final String title;
  final onToggle;
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: accentCanvasColor,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      actions: <Widget>[
        Switch(value: isOn, onChanged: onToggle),
      ],
    );
  }
}