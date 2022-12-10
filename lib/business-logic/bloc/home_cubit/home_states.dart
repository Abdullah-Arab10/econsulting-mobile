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