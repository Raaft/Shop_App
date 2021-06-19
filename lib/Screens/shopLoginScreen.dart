import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/Screens/shopLayOut_screen.dart';
import 'package:myshop/Screens/shop_registerScreen.dart';
import 'package:myshop/cubit/login_cubit/cubit.dart';
import 'package:myshop/cubit/login_cubit/states.dart';
import 'package:myshop/network/chash_helper.dart';
import 'package:myshop/shared/shaerd_ui.dart';

class ShopLoginScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => ShopLogInCubit(),
      child: BlocConsumer<ShopLogInCubit, LogInStates>(
        listener: (context, state) {
          if (state is LogInSuccessState)
          {
            if (state.loginModel.status)
            {
              print(state.loginModel.message);
              print(state.loginModel.data.token);

              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data.token,
              ).then((value)
              {
                token = state.loginModel.data.token;

                navigateAndFinish(
                  context,
                  LayOutScreen(),
                );
              });
            } else {
              print(state.loginModel.message);

              showToast(
                text: state.loginModel.message,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/img/on1.jpg"),
                          fit: BoxFit.fitWidth,
                        //  width: MediaQuery.of(context).size.width,
                          height: 200,
                        ),
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: Icons.vpn_key,
                          onSubmit: (value) {
                            if (formKey.currentState.validate()) {
                              ShopLogInCubit.get(context).userLogIn(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },

                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),

                        state is LogInSuccessLoadingState
                            ? Center(child: CircularProgressIndicator())
                            : Container(
                          width: MediaQuery.of(context).size.width,
                          height:
                          MediaQuery.of(context).size.height / 18,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                ShopLogInCubit.get(context).userLogIn(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            child: Text("LOGIN",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Quicksand Bold")),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            defaultTextButton(
                              function: () {
                                navigateTo(
                                  context,
                                  RegisterShopScreen(),
                                );
                              },
                              text: 'register',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/Screens/shopLayOut_screen.dart';
import 'package:myshop/Screens/shop_registerScreen.dart';
import 'package:myshop/cubit/login_cubit/cubit.dart';
import 'package:myshop/cubit/login_cubit/states.dart';
import 'package:myshop/network/chash_helper.dart';
import 'package:myshop/shared/Colors.dart';
import 'package:myshop/shared/shaerd_ui.dart';

class ShopLogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocConsumer<ShopLogInCubit, LogInStates>(
      listener: (context, state) {
        if (state is LogInSuccessState) {
          if (state.loginModel.status) {
            print(state.loginModel.data.name);
            print("token=>>>>>>>>${state.loginModel.data.token}");
            myToast(state.loginModel.message+state.loginModel.data.name, Colors.green);

            CacheHelper.saveData(
                    key: "token", value: state.loginModel.data.token)
                .then((value) {
                  token=state.loginModel.data.token;
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LayOutScreen()));
            });
          } else {
            print(state.loginModel.message);
            myToast(state.loginModel.message, Colors.red);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          //  appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage("assets/img/on1.jpg"),
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Text("LOGIN",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Quicksand Bold")),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Login now to browse our hot Offers",
                          style: TextStyle(
                              fontSize: 16,
                              color: gray,
                              fontFamily: "Quicksand Bold")),
                      SizedBox(height: 40),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            labelText: 'Email',
                            suffix: Icon(Icons.email_outlined, color: defaultColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter Your Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            suffix: Icon(Icons.lock_open, color: defaultColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        controller: passwordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "The Password Is Too Short";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      state is LogInSuccessLoadingState
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height / 18,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState.validate()) {
                                    ShopLogInCubit.get(context).userLogIn(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                child: Text("LOGIN",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Quicksand Bold")),
                              ),
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ? ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: "Quicksand Bold")),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterShopScreen()));
                              },
                              child: Text("register",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontFamily: "Quicksand Bold")))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
*/