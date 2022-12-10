// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          'Favorite Screen',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
          )
      ),
    );
  }
}
