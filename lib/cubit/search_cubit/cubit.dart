import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/cubit/search_cubit/states.dart';
import 'package:myshop/model/searchmodel.dart';
import 'package:myshop/network/dio_helper.dart';
import 'package:myshop/network/endpoint.dart';
import 'package:myshop/shared/shaerd_ui.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel model;

  void search(String text) {
    emit(SearchLoadingState());

    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value)
    {
      model = SearchModel.fromJson(value.data);

      emit(SearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}