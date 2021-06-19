import 'package:myshop/model/login_model.dart';

abstract class LogInStates {}

class LogInInitialState extends LogInStates {}


class LogInSuccessLoadingState extends LogInStates {

}

class LogInSuccessState extends LogInStates {
  final ShopLoginModel loginModel;

  LogInSuccessState(this.loginModel);
}

class LogInErrorState extends LogInStates {
  final error;

  LogInErrorState(this.error);

}
class ShopLoadingUpdateState extends LogInStates {}
class ShopSuccessUpdateState extends LogInStates {}
class ShopErrorGetUpdateState extends LogInStates {}

