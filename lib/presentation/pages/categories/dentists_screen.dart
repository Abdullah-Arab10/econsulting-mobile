// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/data/models/home_model/home_data_model.dart';
import 'package:e_consulting_flutter/presentation/widgets/consultants_cards.dart';
import 'package:flutter/material.dart';

class DentistsScreen extends StatelessWidget {

   DentistsScreen({super.key});

   //HomeDataModel data = HomeDataModel();

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> dentists = HomeDataModel.dentists;
    //print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List of Dentists',
          style: TextStyle(
              fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: cardsBuilder(dentists, context, 'List of Dentists is empty'),
      ),
    );
  }
}
