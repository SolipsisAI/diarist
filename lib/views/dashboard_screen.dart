import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key, required this.stats}) : super(key: key);

  final List<Map<String, dynamic>> stats;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: stats
          .map((s) => DashboardTile(count: s['count'], name: s['name']))
          .toList(),
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
    return SafeArea(
        top: false,
        bottom: false,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                    child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Semantics(
                                label: name,
                                child: Column(
                                  children: [
                                    Text("$count",
                                        style: const TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold)),
                                    Text(name,
                                        style: const TextStyle(fontSize: 30))
                                  ],
                                )))))
              ],
            )));
  }
}
