//stf

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthanticationView extends ConsumerStatefulWidget {
  const AuthanticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthanticationViewState();
}

class _AuthanticationViewState extends ConsumerState<AuthanticationView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginView(
        action: AuthAction.signUp,
        providers: FirebaseUIAuth.providersFor(
          FirebaseAuth.instance.app,
        ),
      ),
    );
  }
}
