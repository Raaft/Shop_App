import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/cubit/shopCubit/cubit.dart';
import 'package:myshop/cubit/shopCubit/states.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.builder(
              itemCount: ShopCubit.get(context).categoriesModel.data.data.length,
              itemBuilder: (context, index) => buildCategoriesList(
                  ShopCubit.get(context).categoriesModel.data.data[index]));
        });
  }

  Padding buildCategoriesList(dynamic model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              Image(
                  image: NetworkImage(model.image),
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover),
              SizedBox(width: 20),
              Text(model.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Quicksand Bold",
                      fontWeight: FontWeight.w800)),
              Spacer(),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
