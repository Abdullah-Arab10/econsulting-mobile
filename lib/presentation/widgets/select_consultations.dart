import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';

late int select;

int selectConsultations (context)
{
  var cubit = AuthCubit.get(context);

  if(cubit.selectedConsultation == '1')
  {
    select = 1;
  }else if(cubit.selectedConsultation == '2')
  {
    select = 2;
  }else if(cubit.selectedConsultation == '3')
  {
    select = 3;
  }else if(cubit.selectedConsultation == '4')
  {
    select = 4;
  }else if(cubit.selectedConsultation == '5')
  {
    select = 5;
  }
  return select;
}