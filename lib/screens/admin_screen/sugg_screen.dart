import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/model/sugg_model.dart';

class SuggAdimnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xff2A2D40),
          appBar: AppBar(
            backgroundColor: Color(0xff212332),
            title: Text('suggestions'),
          ),
          body: state is! AdminSuggCountLoaingState
              ? ListView.separated(
                  itemBuilder: (context, index) => _buildItems(
                    _cubit.suggModel[index],
                    _cubit,
                  ),
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 2,
                    color: Color(0xff323548),
                  ),
                  itemCount: _cubit.suggModel.length,
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
        );
      },
    );
  }

  Widget _buildItems(SuggModel item, HomeCubit cubit) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${item.message}',
              style: TextStyle(
                fontSize: 21,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
