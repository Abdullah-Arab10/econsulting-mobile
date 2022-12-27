// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder/conditional_builder.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/data/models/search/search_data_model.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/list_view_cards.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var t = S.of(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0.0,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: AppColors.backgroundColor),
            title: Text(
              t.searchPage,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 10),
                    child: defaultFormField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      label: t.search,
                      prefix: Icons.search,
                      onSubmit: (value) {
                        if (value!.isEmpty) {
                          showToast(
                              text: t.searchRequired, state: ToastStates.ERROR);
                        } else {
                          SearchDataModel.search = [];
                          HomeCubit.get(context).postSearch(value: value);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                    condition: state is! SearchGetConsultantLoading,
                    builder: (context) => listViewCard(
                      screen: SearchDataModel.search,
                    ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
