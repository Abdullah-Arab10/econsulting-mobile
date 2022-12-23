import 'package:bloc/bloc.dart';
import 'package:e_consulting_flutter/business-logic/bloc/admin_cubit/admin_states.dart';
import 'package:e_consulting_flutter/data/remote/dio_helper.dart';
import 'package:e_consulting_flutter/shared/constants/global_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCubit extends Cubit<AdminStates>
{

  AdminCubit() : super(AdminInitialState());

  static AdminCubit get(context) => BlocProvider.of(context);

  void adminTransfer({
    required String email,
    required String moneyAmount,
  }) {
    DioHelper.postData(url: TRANSFER, data: {
      'email': email,
      'cash': moneyAmount,
    });
  }
}