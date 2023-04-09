import 'package:diarist/views/notes_screen.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:sidebarx/sidebarx.dart';
import '../components/common_ui.dart';
import '../models/note.dart';
import '../utils/isolate_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {Key? key,
      required this.controller,
      required this.isSmallScreen,
      required this.isar,
      required this.notes,
      required this.interpreters,
      required this.vocab,
      required this.isolateUtils})
      : super(key: key);

  final SidebarXController controller;
  final bool isSmallScreen;
  final Isar isar;
  final List<Note> notes;
  final Map<String, int> interpreters;
  final Map<String, dynamic> vocab;
  final IsolateUtils isolateUtils;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            // TODO: Show list of entries here
            return const Text("Home");
          case 1:
            // Main text-editing view
            return NotesScreen(
                controller: controller,
                isSmallScreen: isSmallScreen,
                isar: isar,
                notes: notes,
                interpreters: interpreters,
                vocab: vocab,
                isolateUtils: isolateUtils);
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}
