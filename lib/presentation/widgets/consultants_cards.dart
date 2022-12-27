// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/pages/appointment_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/details_screen.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/constants/global_constants.dart';

Widget buildCategoriesItem(
  type,
  IconData icons,
  Widget widgets,
  context,
) {
  return Column(
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
        onTap: () {
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
              color: Colors.grey),
        ),
      ),
    ],
  );
}

Widget buildCardsItem(
  item,
    context,
) =>
    InkWell(
      child: Container(
            decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    imageUrl: item['image'] != null
                        ? "${STORAGE_URL}${item['image']}"
                        : "https://www.kindpng.com/picc/m/99-997900_headshot-silhouette-person-placeholder-hd-png-download.png",
                    height: 125,
                    width: 125,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Image(
                      image: AssetImage('assets/images/placeHolder.jpg'),
                    ),
                  ),
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

                              },
                              icon: Icon(
                                Icons.favorite,
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
                                    t.book,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: AppColors.secondaryColor),
                                  ),
                                ),
                              ),
                              onTap: () {
                                navigateTo(
                                    context, AppointmentScreen(item['id']));
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
                                  width: 3,
                                ),
                                Text(
                                  '${item['rating']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${item['avgRating']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      color: Colors.grey
                                      //color: Colors.grey
                                      ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  t.review,
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
          ),
      onTap: (){
        HomeCubit.get(context).getConsultantDetails(id: item['id']);
      },
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.all(
          20
      ),
      child: Container(
        color: Colors.grey[300],
        width: double.infinity,
        height: 1,
      ),
    );

Widget categoriesBuilder(list,context) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildCardsItem(
          list[index],
          context
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 20,
        ),
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
