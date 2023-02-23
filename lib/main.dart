import 'package:flutter/material.dart';
import './router/router.dart';
import 'package:provider/provider.dart';
import 'services/todo_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: router,
    );
  }
}
