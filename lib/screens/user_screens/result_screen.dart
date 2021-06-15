import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text('${HomeCubit.get(context).userModel[index].email}');
              },
              itemCount: HomeCubit.get(context).userModel.length,
            ),
          ),
        );
      },
    );
  }
}
