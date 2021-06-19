import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/Screens/shopLoginScreen.dart';
import 'package:myshop/cubit/login_cubit/cubit.dart';
import 'package:myshop/cubit/login_cubit/states.dart';
import 'package:myshop/cubit/search_cubit/states.dart';
import 'package:myshop/cubit/shopCubit/cubit.dart';
import 'package:myshop/cubit/shopCubit/states.dart';
import 'package:myshop/network/chash_helper.dart';
import 'package:myshop/shared/shaerd_ui.dart';

class SettingScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLogInCubit, LogInStates>(
        listener: (context, state) {
      if (state is LogInSuccessLoadingState ||
          ShopLogInCubit.get(context).loginModel == null)
        return Center(child: CircularProgressIndicator());
    }, builder: (context, state) {
      if (state is LogInSuccessLoadingState ||
          ShopLogInCubit.get(context).loginModel == null) {
        return Center(child: CircularProgressIndicator());
      } else {
        var model = ShopCubit.get(context);
        nameController.text = model.userModel.data.name;
        emailController.text = model.userModel.data.email;
        phoneController.text = model.userModel.data.phone;
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                defaultFormField(
                    controller: nameController,
                    prefix: Icons.person,
                    label: 'Name',
                    type: TextInputType.name,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return "Enter Your Name";
                      }
                    }),
                SizedBox(height: 15),
                defaultFormField(
                    controller: emailController,
                    prefix: Icons.email,
                    label: 'Email Address',
                    type: TextInputType.name,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return "Enter Your Name";
                      }
                    }),
                SizedBox(height: 15),
                defaultFormField(
                    controller: phoneController,
                    prefix: Icons.phone,
                    label: 'Phone',
                    type: TextInputType.name,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return "Enter Your Name";
                      }
                    }),
                SizedBox(height: 40),
                defaultButton(
                    text: "Update",
                    function: () {
                      if (formKey.currentState.validate()) {
                        model.updateUserData(
                            email: emailController.text,
                            name: nameController.text,
                            phone: phoneController.text);
                      }
                    },
                    radius: 15),
              ],
            ),
          ),
        );
      }
    });
  }
}
