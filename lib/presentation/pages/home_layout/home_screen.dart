// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/data/models/home_model/home_data_model.dart';
import 'package:e_consulting_flutter/data/models/search/search_data_model.dart';
import 'package:e_consulting_flutter/presentation/pages/details_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/search_screen.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/consultants_cards.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/list_view_cards.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:e_consulting_flutter/shared/constants/categories_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_consulting_flutter/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var t = S.of(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeGetConsultantsDetailsSuccessState) {
          navigateTo(context, DetailsScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0.0,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: AppColors.backgroundColor, statusBarIconBrightness: Brightness.dark
                ),
            title: Text(
              t.homePage,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: defaultFormField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      label: t.search,
                      prefix: Icons.search,
                      validate: (value) {
                        if (value!.isEmpty) {
                          showToast(
                              text: t.searchRequired, state: ToastStates.ERROR);
                        }
                      },
                      onTap: () {
                        SearchDataModel.search = [];
                        navigateTo(context, SearchScreen());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    t.categories,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 120,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var t = S.of(context);
                          List<String> type = [
                            t.doctors,
                            t.dentists,
                            t.therapists,
                            t.lawyers,
                            t.economics,
                            t.softwareEngineers,
                            t.civilEngineers,
                          ];
                          return buildCategoriesItem(
                            type[index],
                            icon[index],
                            widgets[index],
                            context,
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        itemCount: 7),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: title(t.consultantsList)),
                  title(t.doctors),
                  listViewCard(
                      screen: HomeDataModel.doctors,
                    scroll: NeverScrollableScrollPhysics(),
                    shrinkWrap: true
                  ),
                  title(t.dentists),
                  listViewCard(
                      screen: HomeDataModel.dentists,
                      scroll: NeverScrollableScrollPhysics(),
                      shrinkWrap: true
                  ),
                  title(t.therapists),
                  listViewCard(
                      screen: HomeDataModel.therapists,
                      scroll: NeverScrollableScrollPhysics(),
                      shrinkWrap: true
                  ),
                  title(t.lawyers),
                  listViewCard(
                      screen: HomeDataModel.lawyers,
                      scroll: NeverScrollableScrollPhysics(),
                      shrinkWrap: true
                  ),
                  title(t.economics),
                  listViewCard(
                      screen: HomeDataModel.economists,
                      scroll: NeverScrollableScrollPhysics(),
                      shrinkWrap: true
                  ),
                  title(t.softwareEngineers),
                  listViewCard(
                      screen: HomeDataModel.software_engineers,
                      scroll: NeverScrollableScrollPhysics(),
                      shrinkWrap: true
                  ),
                  title(t.civilEngineers),
                  listViewCard(
                      screen: HomeDataModel.civil_engineers,
                      scroll: NeverScrollableScrollPhysics(),
                      shrinkWrap: true
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
