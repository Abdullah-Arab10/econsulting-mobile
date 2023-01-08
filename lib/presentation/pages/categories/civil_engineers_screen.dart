// ignore_for_file: prefer_const_constructors
import 'package:e_consulting_flutter/data/models/home_model/home_data_model.dart';
import 'package:e_consulting_flutter/presentation/widgets/consultants_cards.dart';
import 'package:flutter/material.dart';

class CivilEngineersScreen extends StatelessWidget {

  CivilEngineersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List of Civil Engineers',
          style: TextStyle(
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: cardsBuilder(HomeDataModel.civil_engineers, context, 'List of Civil Engineers is empty'),
      ),
    );
  }
}
