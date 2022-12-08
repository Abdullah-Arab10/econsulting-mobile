// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/app_router.dart';
import 'package:e_consulting_flutter/business-logic/bloc/cubit/locale_cubit.dart';
import 'package:e_consulting_flutter/presentation/pages/auth/login_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/on_boarding_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/auth/register_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'presentation/themes/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(ConsultingApp(
    appRouter: AppRouter(),
  ));
}

class ConsultingApp extends StatelessWidget {
  final AppRouter appRouter;

  const ConsultingApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()..getSavedLanguage()),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
          builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.themeData(),
          onGenerateRoute: appRouter.generateRoute,
          locale: state.locale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''),
            const Locale('ar', ''),
          ],
          localeResolutionCallback: (currentLang, alternativeLang) {
            if (currentLang != null) {
              for (Locale locale in alternativeLang) {
                if (locale.languageCode == currentLang.languageCode) {
                  return currentLang;
                }
              }
            }
            return alternativeLang.first;
          },
          home: OnBoardingScreen(),
        );
      }),
    );
  }
}
