import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/cubit/login_cubit/states.dart';
import 'package:myshop/model/login_model.dart';
import 'package:myshop/network/dio_helper.dart';
import 'package:myshop/network/endpoint.dart';
import 'package:myshop/shared/shaerd_ui.dart';

class ShopLogInCubit extends Cubit<LogInStates> {
  ShopLogInCubit() : super(LogInInitialState());

  static ShopLogInCubit get(context) => BlocProvider.of(context);

  ShopLoginModel loginModel;

  void userLogIn({@required email, @required password}) {
    emit(LogInSuccessLoadingState());
    DioHelper.postData(url: LOGIN, data: {"email": email, "password": password})
        .then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);

      emit(LogInSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LogInErrorState(error.toString()));
    });
  }

  void updateUserData({
    @required email,
    @required name,
    @required phone,
  }) async {
    emit(ShopLoadingUpdateState());

    await DioHelper.putData(
      url: update_profile,
      token: token,
      data: {
        "email": email,
        "name": name,
        "phone": phone,
      },
    ).then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);

      emit(ShopSuccessUpdateState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetUpdateState());
    });
  }
}
