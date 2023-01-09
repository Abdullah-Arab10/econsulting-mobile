import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';

late int select;

int selectConsultations (context)
{
  var cubit = AuthCubit.get(context);

  var t = S.of(context);

  if(cubit.selectedConsultation == t.doctor)
  {
    select = 0;
  }else if(cubit.selectedConsultation == t.dentist)
  {
    select = 1;
  }else if(cubit.selectedConsultation == t.therapist)
  {
    select = 2;
  }else if(cubit.selectedConsultation == t.lawyer)
  {
    select = 3;
  }else if(cubit.selectedConsultation == t.economic)
  {
    select = 4;
  }else if(cubit.selectedConsultation == t.softwareEngineer)
  {
    select = 5;
  }else if(cubit.selectedConsultation == t.civilEngineer)
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
    skill = t.doctor;
    return skill;
  }
  else if(id == 1)
  {
    skill = t.dentist;
    return skill;
  }
  else if(id == 2)
  {
    skill = t.therapist;
    return skill;
  }
  else if(id == 3)
  {
    skill = t.lawyer;
    return skill;
  }
  else if(id == 4)
  {
    skill = t.economic;
    return skill;
  }
  else if(id == 5)
  {
    skill = t.softwareEngineer;
    return skill;
  }
  else if(id == 6)
  {
    skill = t.civilEngineer;
    return skill;
  }
  else
  {
    return 'gg';
  }

}