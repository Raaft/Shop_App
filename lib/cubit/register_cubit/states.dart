import 'package:myshop/model/login_model.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final ShopLoginModel registerModel;

  RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends RegisterState {
  final error;

  RegisterErrorState(this.error);
}
