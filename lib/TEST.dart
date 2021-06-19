import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/Screens/navBar/catigoriesScreen.dart';
import 'package:myshop/Screens/navBar/favouritScreen.dart';
import 'package:myshop/Screens/navBar/prouductScreen.dart';
import 'package:myshop/Screens/splashScreen.dart';
import 'package:myshop/cubit/shopCubit/states.dart';
import 'package:myshop/model/categorymodel.dart';
import 'package:myshop/model/favoutiteModel.dart';
import 'package:myshop/model/getFavouriteModel.dart';
import 'package:myshop/model/homeLayoutModel.dart';
import 'package:myshop/model/login_model.dart';
import 'package:myshop/network/dio_helper.dart';
import 'package:myshop/network/endpoint.dart';
import 'package:myshop/shared/shaerd_ui.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel homeModel;

  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      //print(homeModel.data.banners[0].image);
      //print(homeModel.status);

      homeModel.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });

      //print(favorites.toString());

      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoryModel categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: CATEGORY,
    ).then((value) {
      categoriesModel = CategoryModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  ChangeFavouriteModel changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId];

    emit(ShopChangeFavoritesState());

    DioHelper.postData(
      url: FAVOURITE,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavouriteModel.fromJson(value.data);
      print(value.data);

      if (!changeFavoritesModel.status) {
        favorites[productId] = !favorites[productId];
      } else {
        getFavorites();
      }

      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel));
    }).catchError((error) {
      favorites[productId] = !favorites[productId];

      emit(ShopErrorChangeFavoritesState());
    });
  }

  GetFavourite favoritesModel;

  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVOURITE,
      token: token,
    ).then((value) {
      favoritesModel = GetFavourite.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  ShopLoginModel userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);

      emit(ShopSuccessUserDataState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({
    @required String name,
    @required String email,
    @required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: update_profile,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);


      emit(ShopSuccessUpdateUserState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }
}

