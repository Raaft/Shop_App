import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/Screens/inBoardingScreen.dart';
import 'package:myshop/Screens/shopLoginScreen.dart';
import 'package:myshop/shared/shared_theme.dart';

import 'Screens/shopLayOut_screen.dart';
import 'cubit/bloc_obsirve.dart';
import 'cubit/login_cubit/cubit.dart';
import 'cubit/register_cubit/cubit.dart';
import 'cubit/shopCubit/cubit.dart';
import 'cubit/shopCubit/states.dart';
import 'network/chash_helper.dart';
import 'network/dio_helper.dart';
import 'shared/shaerd_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  bool onBoard = CacheHelper.getData(key: "onBoarding");
  token = CacheHelper.getData(key: "token");

  if (onBoard == true || onBoard != null) {
    if (token != null)
      widget = LayOutScreen();
    else
      widget = ShopLoginScreen();
  } else
    widget = OnBoardingScreen();
  print('on token=====> $token');
  print('onboard======> $onBoard');
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  //final String token;

  MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ShopCubit>(
              create: (BuildContext context) => ShopCubit()
                ..getHomeData()
                ..getCategories()
                ..getUserData()
                ..getFavorites()
                ..getUserData()),
          BlocProvider<ShopLogInCubit>(
            create: (BuildContext context) => ShopLogInCubit(),
          ),
          BlocProvider<ShopRegisterCubit>(
            create: (BuildContext context) => ShopRegisterCubit(),
          )
        ],
        child: BlocConsumer<ShopCubit, ShopStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  darkTheme: darkTheme,
                  theme: lightTheme,
                  themeMode: ThemeMode.light,
                  home: startWidget);
            }));
  }
}
