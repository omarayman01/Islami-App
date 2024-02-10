import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppTheme.primarylight,
    );
  }
}
