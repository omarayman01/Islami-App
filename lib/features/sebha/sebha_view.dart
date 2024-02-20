import 'package:flutter/material.dart';
import 'package:islami/features/settings/settings.dart';
import 'package:provider/provider.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  int cnt = 0, ind = 0;

  List<String> tasbeh = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
                image: AssetImage(
                    Provider.of<SettingsProvider>(context).sebha2Ground)),
            GestureDetector(
                onTap: () {
                  if (cnt < 33) {
                    cnt++;
                  } else {
                    cnt = 0;
                    if (ind == 2) {
                      ind = 0;
                    } else {
                      ind++;
                    }
                  }
                  setState(() {});
                },
                child: Image(
                    image: AssetImage(
                        Provider.of<SettingsProvider>(context).sebhaGround))),
            const SizedBox(height: 43),
            Text('عدد التسبيحات',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 26),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Provider.of<SettingsProvider>(context)
                    .ground2Color
                    .withOpacity(0.5),
              ),
              child: Center(
                  child: Text('$cnt',
                      style: Theme.of(context).textTheme.bodyMedium)),
            ),
            const SizedBox(height: 22),
            Container(
              height: 51,
              width: 137,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Provider.of<SettingsProvider>(context).sebhagroundColor,
              ),
              child: GestureDetector(
                onTap: () {
                  if (cnt < 33) {
                    cnt++;
                  } else {
                    cnt = 0;
                    if (ind == 2) {
                      ind = 0;
                    } else {
                      ind++;
                    }
                  }
                  setState(() {});
                },
                child: Center(
                    child: Text(tasbeh[ind],
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w500))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
