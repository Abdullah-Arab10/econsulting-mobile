// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              t.favorite,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: Center(
            child: Text(
                'Favorite Screen',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
        );
      },
    );
  }
}
