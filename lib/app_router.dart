import 'package:e_consulting_flutter/presentation/pages/consultants_page.dart';
import 'package:e_consulting_flutter/presentation/pages/hero_list.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/profile_screen.dart';
import 'package:e_consulting_flutter/shared/constants/routes_path.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (_) => HeroList());
        break;
      case SETTINGS_ROUTE:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
        break;
    }
  }
}
