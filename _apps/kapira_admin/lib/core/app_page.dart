import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'router.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kapira Admin',
      routerConfig: appRouter,
      theme: KapiraTheme.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
