
// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/civil_engineers_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/dentists_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/doctors_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/economists_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/lawyers_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/software_engineers_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/categories/therapists_screen.dart';
import 'package:flutter/material.dart';

List<AssetImage> icon = [
  AssetImage('assets/images/doctor.png'),
  AssetImage('assets/images/dentist.png'),
  AssetImage('assets/images/therapist.png'),
  AssetImage('assets/images/lawyer.png'),
  AssetImage('assets/images/accounting.png'),
  AssetImage('assets/images/programmer.png'),
  AssetImage('assets/images/worker.png'),
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
