import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/temp_screen/choose_language_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChooseLanguageScreen(),
      ),
    );
  }
}
