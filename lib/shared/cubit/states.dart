import 'package:shop/models/changeCartsModel.dart';
import 'package:shop/models/changefavorites.dart';
import 'package:shop/modules/completeShopping/visaPayment.dart';

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

//Favourites

class FavoritesDataLoading extends AppStates {}

class FavoritesDataSuccess extends AppStates {}

class FavoritesDataError extends AppStates {
  final dynamic error;

  FavoritesDataError(this.error);
}

class ChangeFavoritesSuccess extends AppStates {}

class AddOrDeleteFavoritesSuccess extends AppStates {
  final ChangeFavoritesModel? model;

  AddOrDeleteFavoritesSuccess(this.model);
}

class AddOrDeleteFavoritesError extends AppStates {
  final dynamic error;

  AddOrDeleteFavoritesError(this.error);
}

//Carts
class CartsDataLoading extends AppStates {}

class CartsDataSuccess extends AppStates {}

class CartsDataError extends AppStates {
  final dynamic error;

  CartsDataError(this.error);
}

class DeleteCartsItemLoading extends AppStates {}

class DeleteCartsItemSuccess extends AppStates {
  ChangeCartsModel? model;
  DeleteCartsItemSuccess.noParms();
  DeleteCartsItemSuccess(this.model);
}

class DeleteCartsItemError extends AppStates {
  final dynamic error;

  DeleteCartsItemError(this.error);
}

class AddOrDeleteCartsItemLoading extends AppStates {}

class AddOrDeleteCartsItemSuccess extends AppStates {
  final ChangeCartsModel? model;

  AddOrDeleteCartsItemSuccess(this.model);
}

class AddOrDeleteCartsItemError extends AppStates {
  final dynamic error;

  AddOrDeleteCartsItemError(this.error);
}

class UpdateCartsItemLoading extends AppStates {}

class UpdateCartsItemSuccess extends AppStates {
  final ChangeCartsModel? model;

  UpdateCartsItemSuccess(this.model);
}

class UpdateCartsItemError extends AppStates {
  final dynamic error;

  UpdateCartsItemError(this.error);
}

//Orders

class GetOrdersLoading extends AppStates {}

class GetOrdersDataSuccess extends AppStates {}

class GetOrdersDataError extends AppStates {
  final dynamic error;

  GetOrdersDataError(this.error);
}

class AddOrdersLoading extends AppStates {}

class AddOrdersSuccess extends AppStates {
  final AddOrderModel addOrderModel;
  AddOrdersSuccess(this.addOrderModel);
}

class AddOrdersError extends AppStates {
  final dynamic error;

  AddOrdersError(this.error);
}

class ChangePaymentMethod1 extends AppStates {}

class ChangePaymentMethod2 extends AppStates {}

//Product
class ProductGetDataLoading extends AppStates {}

class ProductGetDataSuccess extends AppStates {}

class ProductGetDataError extends AppStates {
  final dynamic error;

  ProductGetDataError(this.error);
}

class CategoryProductsGetDataLoading extends AppStates {}

class CategoryProductsGetDataSuccess extends AppStates {}

class CategoryProductsGetDataError extends AppStates {
  final dynamic error;

  CategoryProductsGetDataError(this.error);
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

class CVVSwitchSave extends AppStates {}

class CVVSwitchUnSave extends AppStates {}
