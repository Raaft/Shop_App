import 'package:myshop/model/favoutiteModel.dart';
import 'package:myshop/model/login_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {}
class ShopLoadingCategoriesState extends ShopStates {}


class ShopSuccessCategoriesState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates {}

class ShopChangeFavoritesState extends ShopStates {}

class ShopSuccessChangeFavoritesState extends ShopStates
{
final ChangeFavouriteModel model;

 ShopSuccessChangeFavoritesState(this.model);
}

class ShopErrorChangeFavoritesState extends ShopStates {}

class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {}

class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates
{
  final ShopLoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}

class ShopErrorUserDataState extends ShopStates {}

class ShopLoadingUpdateUserState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates
{
  final ShopLoginModel loginModel;

  ShopSuccessUpdateUserState(this.loginModel);
}

class ShopErrorUpdateUserState extends ShopStates {}

/*  import 'package:myshop/model/favoutiteModel.dart';
import 'package:myshop/model/login_model.dart';

abstract class ShopState {}

class ShopInitialState extends ShopState {}

class ShopChangeBottomNavState extends ShopState {}
class ShopLoadingHomeState extends ShopState {}
class ShopSuccessHomeState extends ShopState {}
class ShopErrorHomeState extends ShopState {}

class ShopLoadingCategoryState extends ShopState {}
class ShopSuccessCategoryState extends ShopState {}
class ShopErrorCategoryState extends ShopState {}

class ShopSuccessFavouriteState extends ShopState {}
class ShopSuccessChangeFavouriteState extends ShopState {
  final ChangeFavouriteModel model ;

  ShopSuccessChangeFavouriteState(this.model);
}
class ShopErrorFavouriteState extends ShopState {}

class ShopLoadingGetFavoritesState extends ShopState {}
class ShopSuccessGetFavouriteState extends ShopState {}
class ShopErrorGetFavouriteState extends ShopState {}

class ShopLoadingUserDataState extends ShopState {}
class ShopSuccessUserDataState extends ShopState {
 final ShopLoginModel userModel;

  ShopSuccessUserDataState(this.userModel);
}
class ShopErrorUserDataState extends ShopState {}


class ShopLoadingUpdateState extends ShopState {}
class ShopSuccessUpdateState extends ShopState {}
class ShopErrorGetUpdateState extends ShopState {} */