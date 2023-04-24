import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'common.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key, required this.stats}) : super(key: key);

  final List<Map<String, dynamic>> stats;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'Dashboard',
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                ...stats.mapIndexed((index, stat) {
                  return StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: DashboardTile(
                          count: stat['count'], name: stat['name']));
                })
              ]),
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
