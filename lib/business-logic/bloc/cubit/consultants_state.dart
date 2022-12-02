part of 'consultants_cubit.dart';

@immutable
abstract class ConsultantsState {}

class ConsultantsInitial extends ConsultantsState {}

class ConsultantsError extends ConsultantsState {}

class ConsultantsLoaded extends ConsultantsState {
  final List<ConsultantsModel> consultants;

  ConsultantsLoaded(this.consultants);
}
