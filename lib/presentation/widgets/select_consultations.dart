import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';

late int select;

int selectConsultations (context)
{
  var cubit = AuthCubit.get(context);

  if(cubit.selectedConsultation == 'Doctors')
  {
    select = 0;
  }else if(cubit.selectedConsultation == 'Dentists')
  {
    select = 1;
  }else if(cubit.selectedConsultation == 'Therapists')
  {
    select = 2;
  }else if(cubit.selectedConsultation == 'Lawyers')
  {
    select = 3;
  }else if(cubit.selectedConsultation == 'Economics')
  {
    select = 4;
  }else if(cubit.selectedConsultation == 'Software Engineers')
  {
    select = 5;
  }else if(cubit.selectedConsultation == 'Civil Engineers')
  {
    select = 6;
  }

  return select;
}

String selectSkill(context,id)
{
  var t = S.of(context);
  String skill;

  if(id == 0)
  {
    skill = t.doctors;
    return skill;
  }
  else if(id == 1)
  {
    skill = t.dentists;
    return skill;
  }
  else if(id == 2)
  {
    skill = t.therapists;
    return skill;
  }
  else if(id == 3)
  {
    skill = t.lawyers;
    return skill;
  }
  else if(id == 4)
  {
    skill = t.economics;
    return skill;
  }
  else if(id == 5)
  {
    skill = t.softwareEngineers;
    return skill;
  }
  else if(id == 6)
  {
    skill = t.civilEngineers;
    return skill;
  }
  else
  {
    return 'gg';
  }

}