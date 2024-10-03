import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';
import 'package:core/core.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GoRouter _router = GoRouter(routes: coreRoutes());

  @override
  void initState() {
    coreInjections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
