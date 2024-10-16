import 'package:firebase_news_app/core/kartal/kartal_extension.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
//5 vid 26 dk
@immutable
class AppTheme {
  const AppTheme(this.context);

  final BuildContext context;
  ThemeData get theme => ThemeData.light().copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(16),
            ),
            textStyle: WidgetStateProperty.all<TextStyle?>(
              context.textTheme.headlineSmall,
            ),
            backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          ),
        ),
      );
}
