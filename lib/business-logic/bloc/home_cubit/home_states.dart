abstract class HomeStates {}

class HomeInitialState extends HomeStates{}

class HomeBottomNavState extends HomeStates{}

class HomeGetConsultantsSuccessState extends HomeStates{}

class HomeGetConsultantsLoadingState extends HomeStates{}

class HomeGetConsultantsErrorState extends HomeStates{
  final String error;

  HomeGetConsultantsErrorState(this.error);
}

class ChangeFavoriteIconState extends HomeStates{}

class HomeGetConsultantsDetailsSuccessState extends HomeStates{}

class HomeGetConsultantsDetailsLoadingState extends HomeStates{}

class HomeGetConsultantsDetailsErrorState extends HomeStates{
  final String error;

  HomeGetConsultantsDetailsErrorState(this.error);
}

class SearchGetConsultantLoading extends HomeStates{}

class SearchGetConsultantSuccess extends HomeStates{}

class SearchGetConsultantError extends HomeStates{}