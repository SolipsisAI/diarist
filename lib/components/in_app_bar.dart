import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            onPressed: () {
              onAdd();
            },
            icon: const Icon(Icons.add)),
      ],
    );
  }
}

class ToggleAppBar extends StatelessWidget {
  const ToggleAppBar(
      {Key? key,
      required this.title,
      required this.onToggle,
      required this.onAnalyze,
      required this.isOn})
      : super(key: key);

  final String title;
  final onToggle;
  final onAnalyze;
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: accentCanvasColor,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              onAnalyze();
            },
            icon: const FaIcon(FontAwesomeIcons.brain)),
        //Switch(value: isOn, onChanged: onToggle),
      ],
    );
  }
}
