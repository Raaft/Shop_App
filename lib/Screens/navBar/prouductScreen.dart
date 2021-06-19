import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/cubit/shopCubit/cubit.dart';
import 'package:myshop/cubit/shopCubit/states.dart';
import 'package:myshop/model/categorymodel.dart';
import 'package:myshop/model/homeLayoutModel.dart';
import 'package:myshop/shared/Colors.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: BlocConsumer<ShopCubit, ShopStates>(listener: (context, state) {

    }, builder: (context, state) {
      if (state is ShopLoadingHomeDataState ||
          state is ShopLoadingCategoriesState ||
          ShopCubit.get(context).homeModel == null ||
          ShopCubit.get(context).categoriesModel == null) {
        return Center(child: CircularProgressIndicator());
      }
      return buildHome(ShopCubit.get(context).homeModel,
          ShopCubit.get(context).categoriesModel, height, width, context);
    }));
  }

  Widget buildHome(HomeModel homeModel, CategoryModel categoryModel, height,
      width, context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              items: homeModel.data.banners
                  .map((e) => Image(
                        image: NetworkImage("${e.image}"),
                        //  fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                height: height / 4,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              )),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text("Categories",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Quicksand Bold",
                        fontWeight: FontWeight.w800)),
                SizedBox(height: 15),
                Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryModel.data.data.length,
                      itemBuilder: (context, index) =>
                          buildCategoryItem(categoryModel.data.data[index]),
                    )),
                SizedBox(height: 15),
                Text("New Products",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Quicksand Bold",
                        fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1 / 1.67,
              children: List.generate(
                homeModel.data.products.length,
                (index) => buildGridProduct(
                    homeModel.data.products[index], height, width, context),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCategoryItem(model) {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image(
              image: NetworkImage(model.image),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(.5),
              width: 100,
              child: Text(model.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Quicksand Bold",
                      color: Colors.white,
                      backgroundColor: Colors.black.withOpacity(.5))),
            ),
          ],
        ),
        SizedBox(width: 12)
      ],
    );
  }

  Widget buildGridProduct(Product model, height, width, context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image(
                    image: NetworkImage(model.image),
                    // fit: BoxFit.fitHeight,
                    width: width,
                    height: height / 4.5,
                  ),
                  if (model.discount != 0)
                    Container(
                        alignment: Alignment.bottomLeft,
                        color: Colors.red.withOpacity(.5),
                        width: 50,
                        padding: EdgeInsets.all(2),
                        child: Text("DISCOUNT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 8,
                                fontFamily: "Quicksand Bold",
                                color: Colors.white)))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(model.name,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Quicksand Bold",
                            height: 1.3),
                        maxLines: 2),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${model.price.round()}",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Quicksand Bold",
                                height: 1.5,
                                color: defaultColor)),
                        SizedBox(width: 9),
                        if (model.discount != 0)
                          Text("${model.oldPrice.round()}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Quicksand Bold",
                                  height: 1.5,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough)),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              ShopCubit.get(context).changeFavorites(model.id);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: ShopCubit.get(context).favorites[model.id]
                                  ? Colors.red
                                  : Colors.grey,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ]),
      );
}

Widget buildCategoryItem(DataModel model) => Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(
          image: NetworkImage(model.image),
          height: 100.0,
          width: 100.0,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(
            .8,
          ),
          width: 100.0,
          child: Text(
            model.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
