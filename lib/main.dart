import 'package:flutter/material.dart';
import 'package:flutter_fundamental/presenter/ui/todo/todo_detail/detail_controller.dart';
import 'package:provider/provider.dart';

import 'gen/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailController>(
      create: (BuildContext context) => DetailController(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4),
          useMaterial3: true,
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
