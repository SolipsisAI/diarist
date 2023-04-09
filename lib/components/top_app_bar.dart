import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text('Thought Log', style: TextStyle(color: Colors.white)),
      iconTheme: const IconThemeData(color: Colors.black54),
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                  color: Colors.black54,
                ))),
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.add,
                  size: 26.0,
                  color: Colors.black54,
                )))
      ],
    );
  }
}
