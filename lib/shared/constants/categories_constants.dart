
// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/presentation/pages/categories/civil_engineers_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/dentists_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/doctors_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/economists_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/lawyers_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/software_engineers_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/therapists_screen.dart';
import 'package:flutter/material.dart';

List<String> type = [
  'Doctors',
  'Dentists',
  'Therapists',
  'Lawyers',
  'Economists',
  'Software Engineers',
  'Civil Engineers',
];

List<IconData> icon = [
  Icons.medical_services_rounded,
  Icons.medication_liquid,
  Icons.medical_information_sharp,
  Icons.admin_panel_settings,
  Icons.manage_accounts,
  Icons.engineering_outlined,
  Icons.engineering
];

List<Widget> widgets = [
  DoctorsScreen(),
  DentistsScreen(),
  TherapistsScreen(),
  LawyersScreen(),
  EconomistsScreen(),
  SoftwareEngineersScreen(),
  CivilEngineersScreen(),
];
