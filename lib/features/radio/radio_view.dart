import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Image(image: AssetImage('assets/images/radio_image.png')),
        const SizedBox(height: 57),
        Text(
          'إذاعة القرآن الكريم',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 57),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.skip_previous, color: AppTheme.primarylight, size: 42),
            const SizedBox(width: 32),
            Icon(Icons.play_arrow_rounded,
                color: AppTheme.primarylight, size: 48),
            const SizedBox(width: 32),
            Icon(Icons.skip_next_rounded,
                color: AppTheme.primarylight, size: 42),
          ],
        )
      ]),
    );
  }
}
