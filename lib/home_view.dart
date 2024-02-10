import 'package:flutter/material.dart';
import 'package:islami/features/hadeth/hadeth_view.dart';
import 'package:islami/features/quran/quran_view.dart';
import 'package:islami/features/radio/radio_view.dart';
import 'package:islami/features/sebha/sebha_view.dart';
import 'package:islami/features/settings/settings_view.dart';

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
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/default_bg.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'إسلامي',
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
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                  label: 'الراديو'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                  label: 'التسبيح'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                  label: 'الأحاديث'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                  label: 'القرآن'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'الأعدادات'),
            ]),
      ),
    );
  }
}
