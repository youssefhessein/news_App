// ignore_for_file: unused_import

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/newsapp/cubit/cubit.dart';
import '../../../layout/newsapp/cubit/statue.dart';
import '../../../shared/components/components.dart';


class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getSports(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,statue){},
        builder: (context,state){
          var list = NewsCubit.get(context).sports;
          return  articleBuilder(list,context);
        },
      ),
    );

  }
}
