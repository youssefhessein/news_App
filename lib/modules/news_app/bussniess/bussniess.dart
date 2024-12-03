// ignore: unused_import
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/newsapp/cubit/cubit.dart';
import '../../../layout/newsapp/cubit/statue.dart';
import '../../../shared/components/components.dart';


class PublicScreen extends StatelessWidget {
  const PublicScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getPublic(),
      child: BlocBuilder<NewsCubit,NewsStates>(
        builder: (context,state){
          var list = NewsCubit.get(context).public;
          return articleBuilder(list,context);

        },


      ),
    );

    }
}
