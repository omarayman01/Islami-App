import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/constants.dart';
import 'package:islami/features/hadeth/hadeth_details.dart';
import 'package:islami/features/hadeth/hadeth_view.dart';
import 'package:islami/features/quran/quran_view.dart';
import 'package:islami/features/quran/sura_details.dart';
import 'package:islami/features/radio/radio_view.dart';
import 'package:islami/features/sebha/sebha_view.dart';
import 'package:islami/features/settings/settings.dart';
import 'package:islami/features/settings/settings_view.dart';
import 'package:islami/home_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<SettingsProvider>(context).themeMode,
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
      title: 'Localizations Sample App',
      locale: Locale(Provider.of<SettingsProvider>(context).language),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // const [
      //   // AppLocalizations.delegate, // Add this line
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      supportedLocales: AppLocalizations.supportedLocales,
      //  const [
//         Locale('en'),
//         Locale('ar'), // Arabic
// // English
//       ],
    );
  }
}
