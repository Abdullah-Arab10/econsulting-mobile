// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/data/models/home_model/home_data_model.dart';
import 'package:e_consulting_flutter/data/models/home_model/software_engineers_model.dart';
import 'package:e_consulting_flutter/presentation/widgets/consultants_cards.dart';
import 'package:flutter/material.dart';

class SoftwareEngineersScreen extends StatelessWidget {

   SoftwareEngineersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> software_engineers = HomeDataModel.software_engineers;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List of Software Engineers',
          style: TextStyle(
              fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: categoriesBuilder(software_engineers),
    );
  }
}
