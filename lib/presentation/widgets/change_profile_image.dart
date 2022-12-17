// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

ImageProvider? changeProfileImage(context)
{
  File? profileImage = AuthCubit.get(context).profileImage;
  if(profileImage == null)
    {
      return AssetImage('assets/images/placeHolder.jpg');
    }else
    {
      return FileImage(profileImage);
    }
}