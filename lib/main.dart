import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_news_app/feature/home/home_view.dart';
import 'package:firebase_news_app/feature/login/login_view.dart';
import 'package:firebase_news_app/firebase_options.dart';
import 'package:firebase_news_app/product/initialize/application_start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
