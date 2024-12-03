import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cachHelper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes.dart';

import 'layout/newsapp/cubit/cubit.dart';
import 'layout/newsapp/newslayout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await CashHelper.init();
  DioHelper.init();
  SimpleBlocObserver();

  bool  ? isDarkMode = CashHelper.getBool(key: "isDark");
  print(isDarkMode);
  runApp( MyApp(isDarkMode,));
}

class MyApp extends StatelessWidget {
   bool ? isDarkMode;
   MyApp(this.isDarkMode, {super.key}) ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(

      providers: [
        BlocProvider(create:(context) => NewsCubit()..getPublic(),
        ),
        BlocProvider( create: (BuildContext context)  => AppCubit()..onChangeMode(fromShared: isDarkMode),

        ),


      ],
      child:  BlocBuilder<AppCubit,AppStates>(
        builder: (context,state)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: AppCubit.get(context).isDarkMode ? MyTheme.lightTheme : MyTheme.darkTheme ,

          home: const NewsLayout(),
        ),
      ),
    );
  }
}


