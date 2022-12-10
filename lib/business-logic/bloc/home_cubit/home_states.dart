abstract class HomeStates {}

class HomeInitialState extends HomeStates{}

class HomeBottomNavState extends HomeStates{}

class HomeGetBusinessSuccessState extends HomeStates{}

class HomeGetBusinessLoadingState extends HomeStates{}

class HomeGetBusinessErrorState extends HomeStates{
  final String error;

  HomeGetBusinessErrorState(this.error);
}