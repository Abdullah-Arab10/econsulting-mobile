// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/data/models/home_model/home_data_model.dart';
import 'package:e_consulting_flutter/data/models/home_model/home_model.dart';
import 'package:e_consulting_flutter/presentation/widgets/consultants_cards.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/list_view_cards.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:e_consulting_flutter/shared/constants/categories_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_consulting_flutter/generated/l10n.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var t=S.of(context);
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10
                  ),
                  child: defaultFormField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      label: 'Search a consultant',
                      prefix: Icons.search,
                      validate: (value) {
                        if(value!.isEmpty)
                        {
                          showToast(
                              text: 'Search must not be empty',
                              state: ToastStates.ERROR
                          );
                        }
                      },
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'Categories',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 125,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildCategoriesItem(
                        type[index],
                        icon[index],
                        widgets[index],
                        context,
                      ),
                      separatorBuilder: (context, index) => SizedBox(width: 10,),
                      itemCount: 7
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                    child: title(t.consultantsList)),
                SizedBox(
                  height: 15,
                ),
                title(t.doctors),
                listViewCard(screen: HomeDataModel.doctors),
                title(t.dentists),
                listViewCard(screen: HomeDataModel.dentists),
                title(t.therapists),
                listViewCard(screen: HomeDataModel.therapists),
                title(t.lawyers),
                listViewCard(screen: HomeDataModel.lawyers),
                title(t.economics),
                listViewCard(screen: HomeDataModel.economists),
                title(t.softwareEngineers),
                listViewCard(screen: HomeDataModel.software_engineers),
                title(t.civilEngineers),
                listViewCard(screen: HomeDataModel.civil_engineers),
              ],
            ),
          ),
        );
      },
    );
  }
}