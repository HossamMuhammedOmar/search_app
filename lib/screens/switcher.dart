import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/service_screen/home_screen.dart';
import 'package:search_app/screens/user_screens/home_screen.dart';

class SwitcherScreen extends StatefulWidget {
  @override
  _SwitcherScreenState createState() => _SwitcherScreenState();
}

class _SwitcherScreenState extends State<SwitcherScreen> {
  @override
  void initState() {
    HomeCubit.get(context).getUserType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return states is! LoginGetUserTypeLoading
            ? SharedHelper.getCacheData(key: USERTYPE) == 'user'
                ? HomeUserScreen()
                : HomeScreen()
            : Scaffold(
                body: Center(
                  child: LoadingJumpingLine.circle(
                    borderColor: mPrimaryYellow,
                  ),
                ),
              );
      },
    );
  }
}
