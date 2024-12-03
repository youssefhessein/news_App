

// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cachHelper.dart';





class AppCubit extends Cubit<AppStates> {
  AppCubit() :super(AppInitialStatue());
  static AppCubit get(context) => BlocProvider.of(context);


bool isDarkMode = false;

void onChangeMode ({bool? fromShared}){

  if(fromShared != null)
  {
    isDarkMode =fromShared;
    emit(AppChangeMode());

  }
  else{

    isDarkMode = !isDarkMode;
    CashHelper.putBool(key: "isDark", value: isDarkMode).then((value){
      emit(AppChangeMode());

    });

  }

}







}