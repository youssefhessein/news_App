import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/newsapp/cubit/statue.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import '../../../modules/news_app/bussniess/bussniess.dart';
import '../../../modules/news_app/science/science.dart';
import '../../../modules/news_app/search/news_search_screen.dart';
import '../../../modules/news_app/sports/sports.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.business,),
        label: "Public"
    ),

    const BottomNavigationBarItem(icon: Icon(Icons.sports,),
        label: "Search"
    ),

 /*   const BottomNavigationBarItem(icon: Icon(Icons.science,),
        label: "Science"
    ),*/

  ];
  List<Widget> screens = [
    const PublicScreen(),
    SearchScreen(),

  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;

   /* if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }*/
    emit(NewBottomNavState());
  }

  List<dynamic> public = [];
  int businessSelectedItem = 0;

//https://newsapi.org/v2/everything?q=bitcoin&apiKey=60e05259eb3c4d18b5909df4360c5c51
  void getPublic() {
    emit(NewsGetPublicLoadingState());
    DioHelper.getData(url: 'v2/everything?q=news',
        query: {'apiKey':"60e05259eb3c4d18b5909df4360c5c51"
    }).then((value){
      public= value.data['articles'];

      print(public.first);
emit(NewsGetPublicSuccessState());


    }).catchError((error){

      debugPrint(error.toString());

      emit(NewsGetPublicErrorState(error.toString()));
    });

  }


  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines',
        query: {'country': 'ae', 'category': "sports",'apiKey':"60e05259eb3c4d18b5909df4360c5c51"
        }).then((value){
      sports= value.data['articles'];

      print(sports.first);
      emit(NewsGeSportsSuccessState());


    }).catchError((error){

      debugPrint(error.toString());

      emit(NewsGetSportsErrorState(error.toString()));
    });

  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: 'v2/top-headlines',
        query: {'country': 'ae', 'category': "science",'apiKey':"60e05259eb3c4d18b5909df4360c5c51"
        }).then((value){
      science= value.data['articles'];

      print(science.first);
      emit(NewsGetScienceSuccessState());


    }).catchError((error){

      debugPrint(error.toString());

      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: 'v2/everything?q=$value',
        query: {'apiKey':"60e05259eb3c4d18b5909df4360c5c51"
        }).then((value){
      search= value.data['articles'];

      emit(NewsGetSearchSuccessState());


    }).catchError((error){

      debugPrint(error.toString());

      emit(NewsGetSearchErrorState(error.toString()));
    });

  }
}

