import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/constants.dart';
import 'package:islami/features/hadeth/hadeth_model.dart';
import 'package:islami/progress_indicator.dart';

class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    loadHadeth();
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/images/hadeth_logo.png')),
          Divider(thickness: 3, color: AppTheme.primarylight),
          Text(
            'الأحاديث',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Divider(thickness: 3, color: AppTheme.primarylight),
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return ahadeth.isEmpty
                ? const Center(child: Indicator())
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, Routes.hadethDetails,
                          arguments: ahadeth[index]),
                      child: Text(
                        ahadeth[index].title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  );
          })),
        ],
      ),
    );
  }

  Future<void> loadHadeth() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethStrings = ahadethFileContent.split('#');
    ahadeth = ahadethStrings.map((hadethString) {
      List<String> hadethLines = hadethString.trim().split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return Hadeth(title, content);
    }).toList();
    setState(() {});
  }
}
