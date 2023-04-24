import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            child: Column(
      children: [DashboardTile()],
    )));
  }
}

class DashboardTile extends StatelessWidget {
  const DashboardTile();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(8),
      child: Column(children: [Text("Hello")]),
    ));
  }
}
