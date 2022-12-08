import 'package:bloc/bloc.dart';
import 'package:e_consulting_flutter/data/repository/consultants.dart';
import 'package:meta/meta.dart';

import '../../../data/models/consultant/consultants_model.dart';

part 'consultants_state.dart';

class ConsultantsCubit extends Cubit<ConsultantsState> {
  final ConsultantsRepository consultantsRepository;
  late final List<ConsultantsModel> consultants;
  ConsultantsCubit(this.consultantsRepository) : super(ConsultantsInitial());

  List<ConsultantsModel> getAllConsultants() {
    consultantsRepository.getAllConsultants().then((consultants) {
      emit(ConsultantsLoaded(consultants));
      this.consultants = consultants;
    });
    return consultants;
  }
}
