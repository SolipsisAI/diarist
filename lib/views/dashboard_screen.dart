import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key, required this.notesCount}) : super(key: key);

  final int notesCount;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [DashboardTile(count: notesCount, name: "Notes")],
    ));
  }
}

class DashboardTile extends StatelessWidget {
  const DashboardTile({Key? key, required this.count, required this.name})
      : super(key: key);

  final int count;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Text("$count", style: const TextStyle(fontSize: 50)),
            Text(name, style: const TextStyle(fontSize: 25)),
          ])),
    );
  }
}
