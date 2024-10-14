//stateNotifier
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthanticationProvider extends StateNotifier<AuthSate> {
  AuthanticationProvider() : super(AuthSate());
}

class AuthSate {}
