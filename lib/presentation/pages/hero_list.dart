import 'package:flutter/material.dart';

import 'package:e_consulting_flutter/presentation/pages/settings.dart';

import 'package:e_consulting_flutter/presentation/widgets/hero_card.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';

class HeroList extends StatefulWidget {
  const HeroList({super.key, this.title});

  final String? title;

  @override
  State<HeroList> createState() => _HeroListState();
}

class _HeroListState extends State<HeroList> {
  final String title = "hello Heros";

  @override
  Widget build(BuildContext context) {
    var t = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Open settings',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(t.heroCount(6)),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                HeroCard(
                  name: 'Grace Hopper',
                  born: '9 December 1906',
                  bio: 'Devised theory of machine-independent '
                      'programming languages.',
                  imagePath: 'assets/images/man.png',
                ),

                HeroCard(
                  name: t.alanTuring,
                  born: '23 June 1912',
                  bio: t.wozniakBio('Apple I', 'Apple II'),
                  imagePath: 'assets/images/man.png',
                ),

                // ...
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
