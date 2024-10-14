import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountProvider extends StateNotifier<int> {
  CountProvider() : super(0);

  void increment() {
    state++;
  }
}
