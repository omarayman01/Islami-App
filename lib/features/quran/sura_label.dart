import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/features/quran/clipOval.dart';

class SuraLabel extends StatelessWidget {
  const SuraLabel({super.key, required this.suraName});
  final String suraName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(suraName, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(width: 30),
          Oval(iconsize: 30, iconColor: AppTheme.white, height: 30)
        ],
      ),
    );
  }
}
