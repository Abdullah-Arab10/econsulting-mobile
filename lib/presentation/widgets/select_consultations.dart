import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';

late int select;

int selectConsultations (context)
{
  var cubit = AuthCubit.get(context);

  if(cubit.selectedConsultation == 'Doctors')
  {
    select = 1;
  }else if(cubit.selectedConsultation == 'Dentists')
  {
    select = 2;
  }else if(cubit.selectedConsultation == 'Therapists')
  {
    select = 3;
  }else if(cubit.selectedConsultation == 'Lawyers')
  {
    select = 4;
  }else if(cubit.selectedConsultation == 'Economics')
  {
    select = 5;
  }else if(cubit.selectedConsultation == 'Software Engineers')
  {
    select = 6;
  }else if(cubit.selectedConsultation == 'Civil Engineers')
  {
    select = 7;
  }

  return select;
}

String selectSkill(int id)
{
  String skill;

  if(id == 1)
  {
    skill = 'Doctors';
    return skill;
  }
  else if(id == 2)
  {
    skill = 'Dentists';
    return skill;
  }
  else if(id == 3)
  {
    skill = 'Therapists';
    return skill;
  }
  else if(id == 4)
  {
    skill = 'Lawyers';
    return skill;
  }
  else if(id == 5)
  {
    skill = 'Economics';
    return skill;
  }
  else if(id == 6)
  {
    skill = 'Software Engineers';
    return skill;
  }
  else if(id == 7)
  {
    skill = 'Civil Engineers';
    return skill;
  }
  else
  {
    return 'gg';
  }

}