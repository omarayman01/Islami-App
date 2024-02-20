import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/features/hadeth/hadeth_model.dart';
import 'package:islami/features/settings/settings.dart';
import 'package:provider/provider.dart';

class HadethDetailsView extends StatefulWidget {
  const HadethDetailsView({super.key});

  @override
  State<HadethDetailsView> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetailsView> {
  @override
  Widget build(BuildContext context) {
    final Hadeth args = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Provider.of<SettingsProvider>(context).bckGround),
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
              const SizedBox(height: 80),
              Text(args.title, style: Theme.of(context).textTheme.bodyMedium),
              Divider(
                  thickness: 3,
                  color: AppTheme.primarylight.withOpacity(0.4),
                  endIndent: 30,
                  indent: 40),
              Padding(
                padding: const EdgeInsets.all(29),
                child: Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Provider.of<SettingsProvider>(context)
                            .groundColor
                            .withOpacity(0.6),
                        borderRadius: BorderRadius.circular(24)),
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Text(
                            '${args.content}',
                            textAlign: TextAlign.right,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 20),
                          );
                        })),
              ),
            ],
          )),
    );
  }
}
