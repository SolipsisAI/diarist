import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:sidebarx/sidebarx.dart';
import 'components/common_ui.dart';
import 'components/sidebar.dart';
import 'views/home_screen.dart';
import 'models/note.dart';
import 'utils/isolate_utils.dart';

class DiaristApp extends StatelessWidget {
  DiaristApp(
      {Key? key,
      required this.interpreters,
      required this.vocab,
      required this.isolateUtils})
      : super(key: key);

  final Map<String, int> interpreters;
  final Map<String, dynamic> vocab;
  final IsolateUtils isolateUtils;

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diarist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: canvasColor,
                    title: Text(getTitleByIndex(_controller.selectedIndex)),
                    leading: IconButton(
                      onPressed: () {
                        // if (!Platform.isAndroid && !Platform.isIOS) {
                        //   _controller.setExtended(true);
                        // }
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: Sidebar(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) Sidebar(controller: _controller),
                Expanded(
                  child: Center(
                    child: HomeScreen(
                      controller: _controller,
                      isSmallScreen: isSmallScreen,
                      interpreters: interpreters,
                      vocab: vocab,
                      isolateUtils: isolateUtils,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
