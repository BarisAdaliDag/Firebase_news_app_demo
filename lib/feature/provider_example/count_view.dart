import 'package:firebase_news_app/feature/provider_example/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountView extends ConsumerStatefulWidget {
  const CountView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<CountView> {
  final loginProvider = StateNotifierProvider<CountProvider, int>((ref) {
    return CountProvider();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(ref.watch(loginProvider).toString()),
    );
  }
}
