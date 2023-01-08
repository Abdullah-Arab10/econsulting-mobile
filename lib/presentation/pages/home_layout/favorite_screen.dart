// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder/conditional_builder.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/data/models/favorite/favorite_data_model.dart';
import 'package:e_consulting_flutter/presentation/pages/details_screen.dart';
import 'package:e_consulting_flutter/presentation/widgets/consultants_cards.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if(state is HomeGetConsultantsDetailsSuccessState)
        {
          navigateTo(context, DetailsScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                t.favorite,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: ConditionalBuilder(
                condition: state is! GetFavoriteListLoadingState,
                builder: (context) => cardsBuilder(FavoriteDataModel.favoriteList,
                    context, 'Favorite List is empty'),
                fallback: (context) => Center(child: CircularProgressIndicator()),
              ),
            ));
      },
    );
  }
}
