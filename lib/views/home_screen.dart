import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import '../components/common_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.controller,
    required this.isSmallScreen,
  }) : super(key: key);

  final SidebarXController controller;
  final bool isSmallScreen;

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
            return Text("Placeholder");
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
