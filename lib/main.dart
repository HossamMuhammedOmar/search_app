import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/bloc/register/cubit.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/temp_screen/choose_language_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedHelper.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguagesCubit()),
        BlocProvider(create: (context) => RegisterCubit()..getAllCategories()),
        BlocProvider(
          create: (context) => HomeCubit()..getAllCategories(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChooseLanguageScreen(),
      ),
    );
  }
}
