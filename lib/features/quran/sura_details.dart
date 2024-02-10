import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/constants.dart';
import 'package:islami/features/quran/sura_label.dart';
import 'package:islami/progress_indicator.dart';

class SuraDetailsView extends StatefulWidget {
  const SuraDetailsView({super.key});

  @override
  State<SuraDetailsView> createState() => _SuraDetailsViewState();
}

class _SuraDetailsViewState extends State<SuraDetailsView> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    final int args = ModalRoute.of(context)!.settings.arguments as int;
    loadSura(args);
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(29),
                child: Container(
                  width: double.infinity,
                  height: 550,
                  decoration: BoxDecoration(
                      color: AppTheme.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(24)),
                  child: Column(
                    children: [
                      SuraLabel(suraName: suraNames[args]),
                      Divider(
                          thickness: 3,
                          color: AppTheme.primarylight.withOpacity(0.4),
                          endIndent: 30,
                          indent: 40),
                      ayat.isEmpty
                          ? const Center(child: Indicator())
                          : Expanded(
                              child: ListView.builder(
                                itemCount: ayat.length,
                                itemBuilder: ((context, index) {
                                  return Text(
                                    textAlign: TextAlign.right,
                                    ayat[index],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  );
                                }),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> loadSura(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    ayat = sura.split('\n');
    setState(() {});
  }
}
