import 'package:firebase_news_app/core/kartal/kartal_extension.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({required this.value, super.key, this.color});
  final String value;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: context.textTheme.titleMedium?.copyWith(
        color: color,
      ),
    );
  }
}
