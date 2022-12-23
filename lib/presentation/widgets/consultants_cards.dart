// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder/conditional_builder.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/presentation/pages/details_screen.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:e_consulting_flutter/utils/helpers/images_converter_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildCategoriesItem(
    String type,
    IconData icons,
    Widget widgets,
    context,
    ) => Column(
      children: [
        InkWell(
          child: Container(
            width: 105,
            height: 65,
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
                size: 45,
                  icons,
              ),
            ),
          onTap: (){
            navigateTo(context, widgets);
          },
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 105,
          alignment: Alignment.center,
          child: Text(
            type,
            maxLines: 2,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.grey
            ),
          ),
        ),
      ],
    );

Widget buildCardsItem(
    item,
) =>
    BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var image = ImageConverter.dataFromBase64String('${item['image']}');
        return Container(
          decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                height: 150,
                image: MemoryImage(image),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Container(
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${item['first_name']}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              HomeCubit.get(context).changeFavoriteIcon();
                            },
                            icon: Icon(
                              HomeCubit.get(context).favorite,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${item['skill']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${item['bio']}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(

                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            child: Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text(
                                  'Book',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: AppColors.secondaryColor),
                                ),
                              ),
                            ),
                            onTap: ()
                            {
                              navigateTo(context, DetailsScreen());
                            },
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${item['rating']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                  color: Colors.grey
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                '(135 Reviews)',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                    color: Colors.grey
                                    //color: Colors.grey
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(top: 20, bottom: 20),
      child: Container(
        color: Colors.grey[300],
        width: double.infinity,
        height: 1,
      ),
    );

Widget categoriesBuilder(list) => ConditionalBuilder(
  condition: list.isNotEmpty,
  builder: (context) => ListView.separated(
    itemBuilder: (context, index) => buildCardsItem(list[index],),
    separatorBuilder: (context, index) => SizedBox(height: 20,),
    itemCount: list.length,
  ),
  fallback: (context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            color: Colors.grey,
            size: 100,
          ),
          Text(
            '0',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  },
);