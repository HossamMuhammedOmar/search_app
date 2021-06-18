import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/screens/login_screen.dart';
import '../bloc/home/cubit.dart';
import '../bloc/languages/cubit.dart';
import '../bloc/register/cubit.dart';
import '../helpers/shared_helper.dart';
import '../screens/temp_screen/choose_language_screen.dart';

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
        home: SharedHelper.getCacheData(key: LANGUAGES) == null
            ? ChooseLanguageScreen()
            : LoginScreen(),
      ),
    );
  }
}
