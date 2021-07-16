import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/login_screen.dart';
import 'package:search_app/screens/service_screen/register_screen.dart';
import 'package:search_app/screens/user_screens/register_screen.dart';
import 'package:transitioner/transitioner.dart';

class WhoAreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraint) {
          double localHeight = constraint.maxHeight;
          double localWidth = constraint.maxWidth;
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      width: localWidth,
                      height: localHeight / 2.3,
                      child: Image.asset('assets/images/accept_request.png'),
                    ),
                    Column(
                      textDirection:
                          SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                              ? TextDirection.rtl
                              : SharedHelper.getCacheData(key: LANGUAGES) ==
                                      'KR'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          '${LanguagesCubit.get(context).whoAreYou()}',
                          textDirection:
                              SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                                  ? TextDirection.rtl
                                  : SharedHelper.getCacheData(key: LANGUAGES) ==
                                          'KR'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        AutoSizeText(
                          '${LanguagesCubit.get(context).whoAreYouDescription()}',
                          style: TextStyle(
                            color: mPrimaryDarkGrey,
                            fontFamily: SharedHelper.getCacheData(
                                        key: LANGUAGES) ==
                                    'AR'
                                ? 'Cairo'
                                : SharedHelper.getCacheData(key: LANGUAGES) ==
                                        'EN'
                                    ? 'Poppins'
                                    : 'AlKshrl',
                          ),
                          textDirection:
                              SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                                  ? TextDirection.rtl
                                  : SharedHelper.getCacheData(key: LANGUAGES) ==
                                          'KR'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                          maxLines: 4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: localHeight / 6,
                    ),
                    MaterialButton(
                      onPressed: () {
                        SharedHelper.cacheData(
                          key: USERTYPE,
                          value: 'user',
                        ).then(
                          (value) {
                            Transitioner(
                              context: context,
                              child: RegisterUserScreen(),
                              animation:
                                  AnimationType.slideTop, // Optional value
                              duration: Duration(
                                  milliseconds: 1000), // Optional value
                              replacement: true, // Optional value
                              curveType: CurveType.ease, // Optional value
                            );
                          },
                        );
                      },
                      child: AutoSizeText(
                        '${LanguagesCubit.get(context).searchForProduct()}',
                        style: TextStyle(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      color: mPrimaryBlue,
                      minWidth: localWidth,
                      height: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      onPressed: () {
                        SharedHelper.cacheData(
                          key: USERTYPE,
                          value: 'store',
                        ).then(
                          (value) {
                            Transitioner(
                              context: context,
                              child: RegisterScreen(),
                              animation:
                                  AnimationType.slideTop, // Optional value
                              duration: Duration(
                                  milliseconds: 1000), // Optional value
                              replacement: true, // Optional value
                              curveType: CurveType.ease, // Optional value
                            );
                          },
                        );
                      },
                      child: AutoSizeText(
                        '${LanguagesCubit.get(context).serviceProvider()}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      textColor: Colors.white,
                      color: mPrimaryGreen,
                      minWidth: localWidth,
                      height: 50,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 50),
                child: IconButton(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                      (route) => false,
                    );
                  },
                  icon: Icon(Icons.arrow_back_ios_outlined),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
