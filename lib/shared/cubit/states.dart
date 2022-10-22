abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppBottomNavBarState extends AppStates {}

class AppBottomSheetState extends AppStates {}

class AppChangeThemeState extends AppStates {}

class ChangeFavState extends AppStates {}

//DataBase
class AppCreateDatabaseState extends AppStates {}

class AppInsertDatabaseState extends AppStates {}

class AppUpdateDatabaseState extends AppStates {}

class AppDeleteDatabaseState extends AppStates {}




class HomeGetDataLoading extends AppStates {}

class HomeGetDataSuccess extends AppStates {}

class HomeGetDataError extends AppStates {
  final dynamic error;

  HomeGetDataError(this.error);
}

//Api Search
class AppGetSearchState extends AppStates {}

class AppGetSearchLoadingState extends AppStates {}

class AppGetSearchErrorState extends AppStates {
  final String error;

  AppGetSearchErrorState(this.error);
}
