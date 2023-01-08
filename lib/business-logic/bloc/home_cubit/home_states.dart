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

class SearchGetConsultantError extends HomeStates{
  final String error;

  SearchGetConsultantError(this.error);
}

class ConsultantRatingLoading extends HomeStates{}

class ConsultantRatingSuccess extends HomeStates{}

class ConsultantRatingError extends HomeStates{
  final String error;

  ConsultantRatingError(this.error);
}

class FavoriteLoadingState extends HomeStates{}

class FavoriteSuccessState extends HomeStates{}

class FavoriteErrorState extends HomeStates{
  final String error;

  FavoriteErrorState(this.error);
}

class GetFavoriteListLoadingState extends HomeStates{}

class GetFavoriteListSuccessState extends HomeStates{}

class GetFavoriteListErrorState extends HomeStates{
  final String error;

  GetFavoriteListErrorState(this.error);
}