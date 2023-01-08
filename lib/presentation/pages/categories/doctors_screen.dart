// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:e_consulting_flutter/data/models/home_model/home_data_model.dart';
import 'package:e_consulting_flutter/presentation/widgets/consultants_cards.dart';
import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {

   DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>>? doctors =  HomeDataModel.doctors;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List of Doctors',
          style: TextStyle(
              fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: cardsBuilder(doctors, context, 'List of Doctors is empty'),
      ),
    );
  }
}
