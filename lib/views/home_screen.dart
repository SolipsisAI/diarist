import 'package:diarist/views/notes_screen.dart';
import 'package:diarist/views/import_screen.dart';
import 'package:diarist/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:provider/provider.dart';
import '../components/common_ui.dart';
import '../provider/notes_provider.dart';
import '../utils/isolate_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {Key? key,
      required this.controller,
      required this.isSmallScreen,
      required this.interpreters,
      required this.vocab,
      required this.isolateUtils})
      : super(key: key);

  final SidebarXController controller;
  final bool isSmallScreen;
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
            return DashboardScreen(
              stats: [
                StatData(
                    1, 1, 'Notes', context.watch<NotesProvider>().notes.length),
                // Emotion Labels
                StatData(1, 1, 'Sadness',
                    context.watch<NotesProvider>().sadness.length),
                StatData(
                    1, 1, 'Joy', context.watch<NotesProvider>().joy.length),
                StatData(
                    1, 1, 'Love', context.watch<NotesProvider>().love.length),
                StatData(
                    1, 1, 'Anger', context.watch<NotesProvider>().anger.length),
                StatData(
                    1, 1, 'Fear', context.watch<NotesProvider>().fear.length),
                StatData(1, 1, 'Surprise',
                    context.watch<NotesProvider>().surprise.length),
              ],
            );
          case 1:
            // Main text-editing view
            return NotesScreen(
              notes: context.watch<NotesProvider>().notes,
              controller: controller,
              isSmallScreen: isSmallScreen,
              interpreters: interpreters,
              vocab: vocab,
              isolateUtils: isolateUtils,
              onAdd: () {
                return context.read<NotesProvider>().addNote();
              },
              onUpdate: (noteItem) {
                return context
                    .read<NotesProvider>()
                    .updateNote(noteItem.toNote());
              },
              onPredict: (note, result) {
                return context
                    .read<NotesProvider>()
                    .updateNote(note, result: result);
              },
            );
          case 2:
            return ImportScreen(
                importRow: context.read<NotesProvider>().upsertFromDict);
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
