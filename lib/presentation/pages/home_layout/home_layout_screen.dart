// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/data/models/favorite/favorite_data_model.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var t = S.of(context);
        var cubit = HomeCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              if(value == 1)
              {
                FavoriteDataModel.favoriteList.clear();
              }
              cubit.changeIndex(context,value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                  ),
                  label: t.home),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: t.favorite),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: t.profile),
            ],
          ),
        );
      },
    );
  }
}
