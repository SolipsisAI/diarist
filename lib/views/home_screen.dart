import 'package:diarist/views/notes_screen.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:provider/provider.dart';
import '../components/common_ui.dart';
import '../models/note.dart';
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
    return ListenableProvider<NotesProvider>(
      create: (_) => NotesProvider(),
      builder: (context, child) {
        return NotesScreen(
          notes: context.watch<NotesProvider>().notes,
          controller: controller,
          isSmallScreen: isSmallScreen,
          interpreters: interpreters,
          vocab: vocab,
          isolateUtils: isolateUtils,
          onAdd: () {
            context.read<NotesProvider>().addNote();
          },
          onUpdate: () {},
        );
      },
    );
  }
}
