import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/bloc/languages/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguagesCubit, LanguagesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            child: Center(
              child: Text(LanguagesCubit.get(context).homeScreenText()),
            ),
          ),
        );
      },
    );
  }
}
