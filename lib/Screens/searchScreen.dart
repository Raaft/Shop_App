import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/cubit/search_cubit/cubit.dart';
import 'package:myshop/cubit/search_cubit/states.dart';
import 'package:myshop/cubit/shopCubit/cubit.dart';
import 'package:myshop/shared/Colors.dart';
import 'package:myshop/shared/shaerd_ui.dart';
class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'enter text to search';
                        }

                        return null;
                      },
                      onSubmit: (String text) {
                        SearchCubit.get(context).search(text);
                      },
                      label: 'Search',
                      prefix: Icons.search,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchLoadingState) LinearProgressIndicator(),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => buildFavItem(
                            SearchCubit.get(context).model.data.data[index],
                            context,

                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount:
                          SearchCubit.get(context).model.data.data.length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}


Widget buildFavItem( model, context) {
  return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 120.0,
                  height: 120.0,
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
                    model.name,
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
                        model.price.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: defaultColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),

                      Spacer(),
                      IconButton(
                          onPressed: () {
                            ShopCubit.get(context)
                                .changeFavorites(model.id);
                          },
                          icon: Icon(Icons.favorite,color: ShopCubit
                              .get(context)
                              .favorites[model.id]?Colors.red:Colors.grey,)
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

