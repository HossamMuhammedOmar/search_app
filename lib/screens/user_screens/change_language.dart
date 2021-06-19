import 'dart:async';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/widgets/navigation_widget.dart';
import 'package:transitioner/transitioner.dart';
import '../../../constant/constant.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ChangeLanguage extends StatelessWidget {
  final RoundedLoadingButtonController _btnArabicController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _btnEnglishController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryIconTheme: IconThemeData(color: mPrimaryLightBlue),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        drawerScrimColor: Colors.black.withOpacity(0.7),
        endDrawer: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
            ? NavigationDrawerWidget()
            : null,
        drawer: SharedHelper.getCacheData(key: LANGUAGES) != 'AR'
            ? NavigationDrawerWidget()
            : null,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            '${LanguagesCubit.get(context).languageSetting()}',
            style: TextStyle(
              color: mPrimaryDarkGrey,
              fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                  ? 'Cairo'
                  : 'Poppins',
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: constraint.maxHeight / 3,
                    child: Image.asset('assets/images/change_lang.jpg'),
                  ),
                  SizedBox(height: 30),
                  AutoSizeText(
                    'Choose Language',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 30),
                  RoundedLoadingButton(
                    child: Text(
                      'English',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                    controller: _btnEnglishController,
                    onPressed: () => _changeToEnglish(context),
                  ),
                  SizedBox(height: 10),
                  RoundedLoadingButton(
                    color: Color(0xffFFC344),
                    child: Text(
                      'Arabic',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                    controller: _btnArabicController,
                    onPressed: () => _changeToArabic(context),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _changeToArabic(context) async {
    Timer(Duration(seconds: 1), () {
      SharedHelper.cacheData(key: LANGUAGES, value: 'AR');
      _btnArabicController.success();
      if (SharedHelper.getCacheData(key: USERTYPE) == 'user') {
        Transitioner(
          context: context,
          child: ChangeLanguage(),
          animation: AnimationType.scale,
          duration: Duration(milliseconds: 500),
          replacement: true,
          curveType: CurveType.elastic,
        );
      } else if (SharedHelper.getCacheData(key: USERTYPE) == 'store') {
        Transitioner(
          context: context,
          child: ChangeLanguage(),
          animation: AnimationType.scale,
          duration: Duration(milliseconds: 500),
          replacement: true,
          curveType: CurveType.elastic,
        );
      }
    });
  }

  void _changeToEnglish(context) async {
    Timer(Duration(seconds: 1), () {
      SharedHelper.cacheData(key: LANGUAGES, value: 'EN');
      _btnEnglishController.success();
      if (SharedHelper.getCacheData(key: USERTYPE) == 'user') {
        Transitioner(
          context: context,
          child: ChangeLanguage(),
          animation: AnimationType.scale,
          duration: Duration(milliseconds: 500),
          replacement: true,
          curveType: CurveType.elastic,
        );
      } else if (SharedHelper.getCacheData(key: USERTYPE) == 'store') {
        Transitioner(
          context: context,
          child: ChangeLanguage(),
          animation: AnimationType.scale,
          duration: Duration(milliseconds: 500),
          replacement: true,
          curveType: CurveType.elastic,
        );
      }
    });
  }
}
