import 'package:flutter/material.dart';
import 'package:e_consulting_flutter/presentation/pages/settings.dart';
import 'package:e_consulting_flutter/presentation/widgets/hero_card.dart';

class HeroList extends StatelessWidget {
  final String title;
  HeroList({this.title = ''});
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('6 Hereos'),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  HeroCard(
                    name: 'Grace Hopper',
                    born: '9 December 1906',
                    bio: 'Devised theory of machine-independent '
                        'programming languages.',
                    imagePath: 'assets/images/grace_hopper.jpg',
                  ),
                  HeroCard(
                    name: 'Alan Turing',
                    born: '23 June 1912',
                    bio: 'Father of theoretical computer science & '
                        'artificial intelligence.',
                    imagePath: 'assets/images/alan_turing.jpg',
                  ),

                  // ...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
