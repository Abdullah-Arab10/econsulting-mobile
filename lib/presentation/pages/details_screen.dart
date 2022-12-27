// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_button.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/select_consultations.dart';
import 'package:e_consulting_flutter/shared/constants/global_constants.dart';
import 'package:e_consulting_flutter/utils/helpers/images_converter_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  double start = 2;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var t = S.of(context);
        var cubit = BlocProvider.of<HomeCubit>(context).detailsModel.data;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              t.profileDetails,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: AppColors.primaryColor,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: CachedNetworkImage(
                            imageUrl: cubit.image != null
                                ? "$STORAGE_URL${cubit.image}"
                                : "https://www.kindpng.com/picc/m/99-997900_headshot-silhouette-person-placeholder-hd-png-download.png",
                            height: 154,
                            width: 154,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image(
                              image: AssetImage('assets/images/placeHolder.jpg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultFormField(
                          initial: cubit.firstName,
                          enable: false,
                          label: t.firstName,
                          prefix: Icons.first_page,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: defaultFormField(
                          initial: cubit.lastName,
                          enable: false,
                          label: t.lastName,
                          prefix: Icons.last_page,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    initial: cubit.email,
                    enable: false,
                    label: t.emailAddress,
                    prefix: Icons.email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    initial: cubit.address,
                    enable: false,
                    label: t.address,
                    prefix: Icons.house_outlined,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    initial: cubit.phone,
                    enable: false,
                    label: t.phone,
                    prefix: Icons.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultFormField(
                          initial: cubit.shiftStart,
                          enable: false,
                          label: t.shiftStart,
                          prefix: Icons.calendar_today_outlined,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: defaultFormField(
                          initial: cubit.shiftEnd,
                          enable: false,
                          label: t.shiftEnd,
                          prefix: Icons.calendar_today_outlined,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    initial: cubit.bio,
                    enable: false,
                    label: t.bio,
                    prefix: Icons.details,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    initial: selectSkill(cubit.skill),
                    enable: false,
                    label: t.consultationType,
                    prefix: Icons.merge_type,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Rating',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${start.round()}',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 30,
                            ),
                          ],
                        ),
                        Slider(
                            value: start,
                            max: 5,
                            min: 1,
                            onChanged: (value) {
                              setState(() {
                                start = value;
                              });
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        defaultButton(
                          text: 'Submit',
                          color: AppColors.primaryColor,
                          radius: 50,
                          function: (){},
                          width: 330
                        ),
                      ],
                    ),
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
