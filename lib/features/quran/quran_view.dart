import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/constants.dart';
import 'package:islami/progress_indicator.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  Widget build(BuildContext context) {
    loadAyatNum();
    return Scaffold(
      body: Stack(children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/qur2an_screen_logo.png'),
            Divider(thickness: 3, color: AppTheme.primarylight),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('عدد الآيات',
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text('اسم السورة',
                      style: Theme.of(context).textTheme.headlineMedium)
                ],
              ),
            ),
            Divider(thickness: 3, color: AppTheme.primarylight),
            nAyat.isEmpty
                ? const Center(child: Indicator())
                : SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 2.4,
                    child: ListView.builder(
                      itemCount: suraNames.length,
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '${nAyat[index]}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, Routes.suraDetails,
                                    arguments: index),
                                child: Text(
                                  suraNames[index],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              )
                            ]);
                      },
                      shrinkWrap: true,
                    ),
                  )
          ],
        ),
        Center(
          child: VerticalDivider(
              thickness: 5, color: AppTheme.primarylight, indent: 235),
        ),
      ]),
    );
  }

  Future<void> loadAyatNum() async {
    List<String> ayat = [];
    for (int i = 0; i < 114; i++) {
      String sura = await rootBundle.loadString('assets/files/${i + 1}.txt');
      ayat = sura.split('\n');
      nAyat.add(ayat.length);
      ayat.clear();
    }
    setState(() {});
  }
}
