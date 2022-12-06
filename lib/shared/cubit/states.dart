abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppBottomNavBarState extends AppStates {}

class AppBottomSheetState extends AppStates {}

class AppChangeThemeState extends AppStates {}

class ChangeFavStateState extends AppStates {}

class CarouselHomeCurrentState extends AppStates {}

class CarouselProductCurrentState extends AppStates {}

//HomeData

class HomeGetDataLoading extends AppStates {}

class HomeGetDataSuccess extends AppStates {}

class HomeGetDataError extends AppStates {
  final dynamic error;

  HomeGetDataError(this.error);
}

//CategoryData

class CategoryDataLoading extends AppStates {}

class CategoryDataSuccess extends AppStates {}

class CategoryDataError extends AppStates {
  final dynamic error;

  CategoryDataError(this.error);
}

class NotificationDataLoading extends AppStates {}

class NotificationDataSuccess extends AppStates {}

class NotificationDataError extends AppStates {
  final dynamic error;

  NotificationDataError(this.error);
}

class FavoritesDataLoading extends AppStates {}

class FavoritesDataSuccess extends AppStates {}

class FavoritesDataError extends AppStates {
  final dynamic error;

  FavoritesDataError(this.error);
}

class ProductGetDataLoading extends AppStates {}

class ProductGetDataSuccess extends AppStates {}

class ProductGetDataError extends AppStates {
  final dynamic error;

  ProductGetDataError(this.error);
}

//UserData
class UserDataLoading extends AppStates {}

class UserDataSuccess extends AppStates {}

class UserDataError extends AppStates {
  final dynamic error;

  UserDataError(this.error);
}

//DataBase
class AppCreateDatabaseState extends AppStates {}

class AppInsertDatabaseState extends AppStates {}

class AppUpdateDatabaseState extends AppStates {}

class AppDeleteDatabaseState extends AppStates {}

//Api Search
class AppGetSearchState extends AppStates {}

class AppGetSearchLoadingState extends AppStates {}

class AppGetSearchErrorState extends AppStates {
  final String error;

  AppGetSearchErrorState(this.error);
}
