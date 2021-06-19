import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/cubit/register_cubit/states.dart';
import 'package:myshop/model/login_model.dart';
import 'package:myshop/network/dio_helper.dart';
import 'package:myshop/network/endpoint.dart';

class ShopRegisterCubit extends Cubit<RegisterState> {
  ShopRegisterCubit() : super(RegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  ShopLoginModel loginModel;

  void userRegister({@required email, @required password,@required name ,@required phone}) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: REGISTER, data: {
      "email": email,
      "password": password,
      "name":name,
      "phone":phone,
    }).then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);

      emit(RegisterSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
}
