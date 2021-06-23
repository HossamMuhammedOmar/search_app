import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/user_screens/add_details_screen.dart';
import 'package:search_app/screens/user_screens/no_result_screen.dart';
import 'package:search_app/widgets/navigation_widget.dart';
import 'package:transitioner/transitioner.dart';

import 'block_screen.dart';

class HomeUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeGetStoresSuccessWhereGoverState) {
          HomeCubit.get(context).userModel.length == 0
              ? Transitioner(
                  context: context,
                  child: NoResultScreen(),
                  animation: AnimationType.scale, // Optional value
                  duration: Duration(milliseconds: 300), // Optional value
                  replacement: false, // Optional value
                  curveType: CurveType.decelerate, // Optional value
                )
              : Transitioner(
                  context: context,
                  child: AddDetaileScreen(),
                  animation: AnimationType.scale, // Optional value
                  duration: Duration(milliseconds: 300), // Optional value
                  replacement: false, // Optional value
                  curveType: CurveType.decelerate, // Optional value
                );
        }
      },
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return Theme(
          data: ThemeData(
            primaryIconTheme: IconThemeData(color: mPrimaryLightBlue),
          ),
          child: Scaffold(
            drawerScrimColor: Colors.black.withOpacity(0.7),
            endDrawer: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                ? NavigationDrawerWidget()
                : null,
            drawer: SharedHelper.getCacheData(key: LANGUAGES) != 'AR'
                ? NavigationDrawerWidget()
                : null,
            appBar: AppBar(
              title: Text(
                '${LanguagesCubit.get(context).homeScreen()}',
                style: TextStyle(
                  color: mPrimaryDarkGrey,
                  fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                      ? 'Cairo'
                      : 'Poppins',
                ),
              ),
              backgroundColor: Colors.white,
            ),
            body: state is! HomeLoadingCategoriesState
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      padding: const EdgeInsets.only(top: 60),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            '${LanguagesCubit.get(context).searchForSomeThing()}',
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily:
                                  SharedHelper.getCacheData(key: LANGUAGES) ==
                                          'AR'
                                      ? 'NotoKufiArabic'
                                      : 'Poppins',
                              color: mPrimaryBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          AutoSizeText(
                            '${LanguagesCubit.get(context).chooseTheGovernorate()}',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily:
                                  SharedHelper.getCacheData(key: LANGUAGES) ==
                                          'AR'
                                      ? 'Cairo'
                                      : 'Poppins',
                              color: mPrimaryDarkGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            width: double.infinity,
                            child: DecoratedBox(
                              decoration: ShapeDecoration(
                                color: Color(0xffe2e8ea),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3.0),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    items: _cubit.gov.map(
                                      (govern) {
                                        return DropdownMenuItem(
                                          value: govern,
                                          child: AutoSizeText(
                                            govern,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      _cubit.selecteGovern(value.toString());
                                    },
                                    value: _cubit.selectedGovern,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: [
                              AutoSizeText(
                                '${LanguagesCubit.get(context).chooseTheSpecialtyYouWant()}',
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: SharedHelper.getCacheData(
                                              key: LANGUAGES) ==
                                          'AR'
                                      ? 'Cairo'
                                      : 'Poppins',
                                  fontSize: 15,
                                  color: mPrimaryDarkGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                width: double.infinity,
                                child: DecoratedBox(
                                  decoration: ShapeDecoration(
                                    color: Color(0xffe2e8ea),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(3.0)),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: _cubit.cate.map(
                                          (category) {
                                            return DropdownMenuItem(
                                              value: category.name,
                                              child: AutoSizeText(
                                                category.name,
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (value) {
                                          _cubit.selecteCategory(
                                              value.toString());
                                        },
                                        value: _cubit.selectedCategories,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: () {
                                if (_cubit.userBlock.first['block']) {
                                  Transitioner(
                                    context: context,
                                    child: BlockScreen(),
                                    animation:
                                        AnimationType.scale, // Optional value
                                    duration: Duration(
                                        milliseconds: 300), // Optional value
                                    replacement: false, // Optional value
                                    curveType:
                                        CurveType.decelerate, // Optional value
                                  );
                                } else {
                                  _cubit.getStoresWhereGovernment(
                                    governName: _cubit.selectedGovern,
                                    category: _cubit.selectedCategories,
                                  );
                                }
                              },
                              child: state
                                      is! HomeGetStoresLoadingWhereGoverState
                                  ? Text(
                                      '${LanguagesCubit.get(context).continueT()}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: SharedHelper.getCacheData(
                                                    key: LANGUAGES) ==
                                                'AR'
                                            ? 'Cairo'
                                            : 'Poppins',
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                              color: mPrimaryGreen,
                              minWidth: MediaQuery.of(context).size.width / 1.9,
                              height: 50,
                              textColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: LoadingBouncingLine.square(
                      backgroundColor: mPrimaryYellow,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
