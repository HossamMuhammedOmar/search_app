import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/screens/user_screens/home_screen.dart';
import 'package:transitioner/transitioner.dart';

class NoResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/images/something_went_wrong.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
              ),
              SizedBox(height: 30),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      '${LanguagesCubit.get(context).noStoresInThisGovernorateInThisTime()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mPrimaryDarkGrey,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(height: 10),
                    AutoSizeText(
                      '${LanguagesCubit.get(context).pleaseTryAgainLater()}',
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mPrimaryGrey,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    MaterialButton(
                      onPressed: () {
                        Transitioner(
                          context: context,
                          child: HomeUserScreen(),
                          animation: AnimationType.slideTop, // Optional value
                          duration:
                              Duration(milliseconds: 500), // Optional value
                          replacement: true, // Optional value
                          curveType: CurveType.decelerate, // Optional value
                        );
                      },
                      child: AutoSizeText(
                        '${LanguagesCubit.get(context).home()}',
                        maxLines: 1,
                      ),
                      textColor: Colors.white,
                      color: mPrimaryLightBlue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
