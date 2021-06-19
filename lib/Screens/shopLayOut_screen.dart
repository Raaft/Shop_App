import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/Screens/searchScreen.dart';
import 'package:myshop/cubit/shopCubit/cubit.dart';
import 'package:myshop/cubit/shopCubit/states.dart';
import 'package:myshop/shared/shaerd_ui.dart';

class LayOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);


          return Scaffold(
            appBar: AppBar(
              title: Text("Salla"),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                    icon: Icon(Icons.search)),
                signOut(context),
              ],
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottom(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Products"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps), label: "Categories"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favourites"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ],
            ),
          );
        });
  }
}
