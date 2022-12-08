import 'package:e_consulting_flutter/data/models/consultant/consultants_model.dart';
import 'package:e_consulting_flutter/data/services/consultant_service.dart';

class ConsultantsRepository {
  final ConsultantsService consultantsService;

  ConsultantsRepository(this.consultantsService);
  Future<List<ConsultantsModel>> getAllConsultants() async {
    final consultants = await consultantsService.getAllConsultants();
    return consultants
        .map((consultant) => ConsultantsModel.fromJson(consultant))
        .toList();
  }
}
