// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_states.dart';
import 'package:e_consulting_flutter/presentation/pages/auth/login_screen.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/consultants_cards.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_button.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:e_consulting_flutter/presentation/widgets/select_consultations.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:e_consulting_flutter/shared/constants/global_constants.dart';
import 'package:e_consulting_flutter/utils/helpers/images_converter_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import '../../../business-logic/bloc/locale_cubit/locale_cubit.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var t = S.of(context);
        var cubit = BlocProvider.of<AuthCubit>(context).authLogin.user;
        return ConditionalBuilder(
            condition: cubit.role == 1,
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text(
                  t.profile,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              drawer: Drawer(
                backgroundColor: AppColors.backgroundColor,
                elevation: 0.0,
                child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
                  builder: (context, state) {
                    if (state is ChangeLocaleState) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top:100),
                        child: Expanded(
                          child: Column(
                            children: [
                              Text(
                                t.applicationLanguage,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,

                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<LocaleCubit>(context)
                                        .changeLanguage('en');
                                  },
                                  child: Text(
                                      'ENGLISH',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<LocaleCubit>(context)
                                        .changeLanguage('ar');
                                  },
                                  child: Text(
                                      'Arabic',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              myDivider(),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                t.calendar,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,

                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {

                                  },
                                  child: Text(
                                      t.calendar,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          bottom: 10
                                      ),
                                      child: defaultButton(
                                          text: t.logout,
                                          function: ()
                                          {
                                            showToast(text: t.logoutSuccess, state: ToastStates.SUCCESS);
                                            navigateAndFinish(context, LoginScreen());
                                          },
                                          width: 200,
                                          color: AppColors.errorColor,
                                          radius: 50
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
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
                                    ? "${STORAGE_URL}${cubit.image}"
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
                    ],
                  ),
                ),
              ),
            ),
          fallback: (context) => Scaffold(
            appBar: AppBar(
              title: Text(
                t.profile,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            drawer: Drawer(
              backgroundColor: AppColors.backgroundColor,
              elevation: 0.0,
              child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
                builder: (context, state) {
                  if (state is ChangeLocaleState) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top:100),
                      child: Expanded(
                        child: Column(
                          children: [
                            Text(
                              t.applicationLanguage,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,

                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<LocaleCubit>(context)
                                      .changeLanguage('en');
                                },
                                child: Text(
                                    'ENGLISH',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<LocaleCubit>(context)
                                      .changeLanguage('ar');
                                },
                                child: Text(
                                    'Arabic',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 10
                                    ),
                                    child: defaultButton(
                                        text: t.logout,
                                        function: ()
                                        {
                                          showToast(text: t.logoutSuccess, state: ToastStates.SUCCESS);
                                          navigateAndFinish(context, LoginScreen());
                                        },
                                        width: 200,
                                        color: AppColors.errorColor,
                                        radius: 50
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
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
                                  ? "${STORAGE_URL}${cubit.image}"
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
