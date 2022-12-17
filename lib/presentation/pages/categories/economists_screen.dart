// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/data/models/home_model/economists_model.dart';
import 'package:e_consulting_flutter/data/models/home_model/home_data_model.dart';
import 'package:e_consulting_flutter/presentation/widgets/consultants_cards.dart';
import 'package:flutter/material.dart';

class EconomistsScreen extends StatelessWidget {

   EconomistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> economists = HomeDataModel.economists;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List of Economists',
          style: TextStyle(
              fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: categoriesBuilder(economists),
    );
  }
}
