import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key, required this.stats}) : super(key: key);

  final List<StatData> stats;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: StaggeredGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          children: [
            ...stats.mapIndexed((index, stat) {
              return StaggeredGridTile.count(
                  crossAxisCellCount: stat.crossAxisCount,
                  mainAxisCellCount: stat.mainAxisCount,
                  child: DashboardTile(count: stat.count, name: stat.name));
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
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              AutoSizeText('$count', style: const TextStyle(fontSize: 20)),
              AutoSizeText(name, style: const TextStyle(fontSize: 10))
            ])));
  }
}

class StatData {
  const StatData(
      this.crossAxisCount, this.mainAxisCount, this.name, this.count);
  final int crossAxisCount;
  final int mainAxisCount;
  final String name;
  final int count;
}
