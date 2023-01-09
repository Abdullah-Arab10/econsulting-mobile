// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/data/models/home_model/home_data_model.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/widgets/consultants_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoftwareEngineersScreen extends StatelessWidget {
  SoftwareEngineersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var t = S.of(context);
          List<Map<String, dynamic>> software_engineers =
              HomeDataModel.software_engineers;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                t.listOfSoftwareEngineers,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: cardsBuilder(software_engineers, context,
                  t.listIsEmpty),
            ),
          );
        });
  }
}
