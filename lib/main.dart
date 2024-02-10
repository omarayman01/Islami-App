import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/constants.dart';
import 'package:islami/features/hadeth/hadeth_details.dart';
import 'package:islami/features/hadeth/hadeth_view.dart';
import 'package:islami/features/quran/quran_view.dart';
import 'package:islami/features/quran/sura_details.dart';
import 'package:islami/features/radio/radio_view.dart';
import 'package:islami/features/sebha/sebha_view.dart';
import 'package:islami/features/settings/settings_view.dart';
import 'package:islami/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      routes: {
        Routes.homeView: (context) => const HomeView(),
        Routes.hadethView: (context) => const HadethView(),
        Routes.quranView: (context) => const QuranView(),
        Routes.radioView: (context) => const RadioView(),
        Routes.sebhaView: (context) => const SebhaView(),
        Routes.settingsView: (context) => const SettingsView(),
        Routes.suraDetails: (context) => const SuraDetailsView(),
        Routes.hadethDetails: (context) => const HadethDetailsView(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeView,
    );
  }
}
