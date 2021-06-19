import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/cubit/shopCubit/cubit.dart';
import 'package:myshop/cubit/shopCubit/states.dart';
import 'package:myshop/shared/Colors.dart';


class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ShopLoadingGetFavoritesState|| ShopCubit.get(context).favoritesModel== null) {
          return Center(child: CircularProgressIndicator());
        } else
          return ListView.separated(
            itemBuilder: (context, index) => buildFavItem(
                ShopCubit.get(context).favoritesModel.data.data[index],
                context),
            separatorBuilder: (context, index) => Divider(),
            itemCount: ShopCubit.get(context).favoritesModel.data.data.length,
          );
      },
    );
  }

  Widget buildFavItem( model, context) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 120.0,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.product.image),
                    width: 120.0,
                    height: 120.0,
                  ),
                  if (model.product.discount != 0)
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      child: Text(
                        'DISCOUNT',
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 1.3,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          model.product.price.toString(),
                          style: TextStyle(
                            fontSize: 12.0,
                            color: defaultColor,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        if (model.product.discount != 0)
                          Text(
                            model.product.oldPrice.toString(),
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            ShopCubit.get(context)
                                .changeFavorites(model.product.id);
                          },
                          icon: Icon(Icons.favorite,color: ShopCubit
                              .get(context)
                              .favorites[model.product.id]?Colors.red:Colors.grey,)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}



/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/cubit/shopCubit/cubit.dart';
import 'package:myshop/cubit/shopCubit/states.dart';
import 'package:myshop/shared/Colors.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=ShopCubit.get(context);
          return ListView.builder(
              itemCount:cubit.getFavouriteModel.data.data.length,
              itemBuilder: (context,index)=>buildFavourite(cubit.getFavouriteModel.data.data[index],context));
        });
  }

  Widget buildFavourite( model,context) {
    return Container(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              width: 170,
              height: 170,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image(
                    image: NetworkImage(
                        model.product.image),
                    // fit: BoxFit.fitHeight,
                    width: 170,
                    height: 170,
                  ),
                  if (model.product.discount != 0)
                  Container(
                      alignment: Alignment.bottomLeft,
                      color: Colors.red.withOpacity(.5),
                      width: 50,
                      height: 15,
                      padding: EdgeInsets.all(2),
                      child: Text("DISCOUNT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 8,
                              fontFamily: "Quicksand Bold",
                              color: Colors.white)))
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model.product.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Quicksand Bold",
                      ),
                      maxLines: 2),
                  Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("${model.product.price}",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Quicksand Bold",
                              height: 1.5,
                              color: defaultColor)),
                      SizedBox(width: 9),
                       if (model.product.discount != 0)
                      Text("${model.product.oldPrice}",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Quicksand Bold",
                              height: 1.5,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough)),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                               ShopCubit.get(context).changeFavorite(model.id);
                          },
                          icon: Icon(
                            Icons.favorite,
                             color: ShopCubit
                                    .get(context)
                                    .favourites[model.id]
                                    ? Colors.red
                                    : Colors.grey,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ]),
          SizedBox(height: 30),
          Divider()
        ],
      ),
    );
  }
}
*/