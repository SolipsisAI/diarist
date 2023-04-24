import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key, required this.notesCount}) : super(key: key);

  final int notesCount;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [DashboardTile(notesCount: notesCount)],
    ));
  }
}

class DashboardTile extends StatelessWidget {
  const DashboardTile({Key? key, required this.notesCount}) : super(key: key);

  final int notesCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Text("$notesCount", style: const TextStyle(fontSize: 50)),
            const Text("notes", style: TextStyle(fontSize: 25)),
          ])),
    );
  }
}
