import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
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
                      textDirection:
                          SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                              ? TextDirection.rtl
                              : SharedHelper.getCacheData(key: LANGUAGES) ==
                                      'KR'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mPrimaryDarkGrey,
                        fontFamily: SharedHelper.getCacheData(key: LANGUAGES) ==
                                'AR'
                            ? 'Cairo'
                            : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                                ? 'Poppins'
                                : 'AlKshrl',
                        fontSize: 16,
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(height: 10),
                    AutoSizeText(
                      '${LanguagesCubit.get(context).pleaseTryAgainLater()}',
                      textDirection:
                          SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                              ? TextDirection.rtl
                              : SharedHelper.getCacheData(key: LANGUAGES) ==
                                      'KR'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: SharedHelper.getCacheData(key: LANGUAGES) ==
                                'AR'
                            ? 'Cairo'
                            : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                                ? 'Poppins'
                                : 'AlKshrl',
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
