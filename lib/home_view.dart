import 'package:flutter/material.dart';
import 'package:islami/features/hadeth/hadeth_view.dart';
import 'package:islami/features/quran/quran_view.dart';
import 'package:islami/features/radio/radio_view.dart';
import 'package:islami/features/sebha/sebha_view.dart';
import 'package:islami/features/settings/settings.dart';
import 'package:islami/features/settings/settings_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> views = const [
    RadioView(),
    SebhaView(),
    HadethView(),
    QuranView(),
    SettingsView()
  ];
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Provider.of<SettingsProvider>(context).bckGround),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.islami,
          ),
        ),
        body: views[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage('assets/images/icon_radio.png')),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage('assets/images/icon_sebha.png')),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage('assets/images/icon_quran.png')),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings),
            ]),
      ),
    );
  }
}
