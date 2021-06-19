import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/Screens/shopLayOut_screen.dart';
import 'package:myshop/Screens/shopLoginScreen.dart';

import 'package:myshop/cubit/register_cubit/cubit.dart';
import 'package:myshop/cubit/register_cubit/states.dart';
import 'package:myshop/network/chash_helper.dart';
import 'package:myshop/shared/Colors.dart';
import 'package:myshop/shared/shaerd_ui.dart';

class RegisterShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var nameController = TextEditingController();

    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<ShopRegisterCubit, RegisterState>(
        listener: (context, state) {

          if (state is RegisterSuccessState) {
            if (state.registerModel.status) {
              print(state.registerModel.message);
              print("token=>>>>>>>>${state.registerModel.data.token}");
              myToast(state.registerModel.message, Colors.green);

              CacheHelper.saveData(
                  key: "token", value: state.registerModel.data.token)
                  .then((value) {
                token=state.registerModel.data.token;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ShopLoginScreen()));
              });
            } else {
              print(state.registerModel.message);
              myToast(state.registerModel.message, Colors.red);
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
                      Text("Register",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Quicksand Bold")),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Register now to browse our hot Offers",
                          style: TextStyle(
                              fontSize: 16,
                              color: gray,
                              fontFamily: "Quicksand Bold")),
                      SizedBox(height: 40),
                      defaultFormField(
                          controller: nameController,
                          label: "name",
                          type: TextInputType.name,
                          prefix: Icons.person,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "Enter Your Name";
                            } else
                              return null;
                          }),
                      SizedBox(height: 20),
                      defaultFormField(
                          controller: emailController,
                          label: "Email Address",
                          type: TextInputType.emailAddress,
                          prefix: Icons.email_outlined,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "Enter Your email";
                            } else
                              return null;
                          }),
                      SizedBox(height: 20),
                      defaultFormField(
                          controller: phoneController,
                          label: "phone",
                          type: TextInputType.phone,
                          prefix: Icons.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "Enter Your phone";
                            } else
                              return null;
                          }),
                      SizedBox(height: 20),
                      defaultFormField(
                          controller: passwordController,
                          label: "Password",
                          type: TextInputType.visiblePassword,
                          prefix: Icons.vpn_key,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "Enter Your Password";
                            } else
                              return null;
                          }),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 30,
                      ),
                      state is RegisterLoadingState
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 18,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState.validate()) {
                                    ShopRegisterCubit.get(context).userRegister(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                      phone: phoneController.text,
                                    );
                                  }
                                },
                                child: Text("REGISTER",
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
                          Text("Do You have an account ? ",
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
                                            ShopLoginScreen()));
                              },
                              child: Text("SIGNIN",
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
          ));
        });
  }
}

/*    if (state is RegisterSuccessState) {
          if (state.loginModel.status) {
            print(state.loginModel.message);
            print("token=>>>>>>>>${state.loginModel.data.token}");
            myToast(state.loginModel.message, Colors.green);

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
        }  */
