import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
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
import 'package:search_app/screens/user_screens/notification_user_screen.dart';
import 'package:search_app/widgets/navigation_widget.dart';
import 'package:transitioner/transitioner.dart';
import 'block_screen.dart';

class HomeUserScreen extends StatefulWidget {
  @override
  _HomeUserScreenState createState() => _HomeUserScreenState();
}

class _HomeUserScreenState extends State<HomeUserScreen> {
  @override
  void initState() {
    HomeCubit.get(context).getNotificationUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
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
                    : SharedHelper.getCacheData(key: LANGUAGES) == 'KR'
                        ? NavigationDrawerWidget()
                        : null,
                drawer: SharedHelper.getCacheData(key: LANGUAGES) == 'EN' ? NavigationDrawerWidget() : null,
                appBar: AppBar(
                  centerTitle: true,
                  actions: [
                    if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN')
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            IconButton(
                              onPressed: () {
                                HomeCubit.get(context).getNotificationUser();
                                Transitioner(
                                  context: context,
                                  child: NotificationUserScreen(),
                                  animation: AnimationType.slideBottom,
                                  duration: Duration(milliseconds: 300),
                                  replacement: false,
                                  curveType: CurveType.linear,
                                );
                              },
                              icon: Icon(
                                Icons.notifications_none,
                                size: 28,
                              ),
                            ),
                            if (_cubit.userNotificationModel.length != 0)
                              Positioned(
                                right: 8,
                                top: 8,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  // child: CircleAvatar(
                                  //   backgroundColor: Colors.white,
                                  //   child: Text(
                                  //     '${_cubit.storeNotification.length}',
                                  //     style: TextStyle(
                                  //       fontSize: 12,
                                  //       color: Colors.red,
                                  //     ),
                                  //   ),
                                  // ),
                                ),
                              ),
                          ],
                        ),
                      )
                  ],
                  leading: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                      ? Stack(
                          alignment: Alignment.topRight,
                          children: [
                            IconButton(
                              onPressed: () {
                                HomeCubit.get(context).getNotificationUser();
                                Transitioner(
                                  context: context,
                                  child: NotificationUserScreen(),
                                  animation: AnimationType.slideBottom,
                                  duration: Duration(milliseconds: 300),
                                  replacement: false,
                                  curveType: CurveType.linear,
                                );
                              },
                              icon: Icon(
                                Icons.notifications_none,
                                size: 28,
                              ),
                            ),
                            if (_cubit.userNotificationModel.length != 0)
                              Positioned(
                                right: 8,
                                top: 8,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  // child: CircleAvatar(
                                  //   backgroundColor: Colors.white,
                                  //   child: Text(
                                  //     '${_cubit.storeNotification.length}',
                                  //     style: TextStyle(
                                  //       fontSize: 12,
                                  //       color: Colors.red,
                                  //     ),
                                  //   ),
                                  // ),
                                ),
                              ),
                          ],
                        )
                      : SharedHelper.getCacheData(key: LANGUAGES) == 'KR'
                          ? Stack(
                              alignment: Alignment.topRight,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    HomeCubit.get(context).getNotificationUser();
                                    Transitioner(
                                      context: context,
                                      child: NotificationUserScreen(),
                                      animation: AnimationType.slideBottom,
                                      duration: Duration(milliseconds: 300),
                                      replacement: false,
                                      curveType: CurveType.linear,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.notifications_none,
                                    size: 28,
                                  ),
                                ),
                                if (_cubit.userNotificationModel.length != 0)
                                  Positioned(
                                    right: 8,
                                    top: 8,
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      // child: CircleAvatar(
                                      //   backgroundColor: Colors.white,
                                      //   child: Text(
                                      //     '${_cubit.storeNotification.length}',
                                      //     style: TextStyle(
                                      //       fontSize: 12,
                                      //       color: Colors.red,
                                      //     ),
                                      //   ),
                                      // ),
                                    ),
                                  ),
                              ],
                            )
                          : null,
                  title: Text(
                    '${LanguagesCubit.get(context).homeScreen()}',
                    style: TextStyle(
                      color: mPrimaryDarkGrey,
                      fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                          ? 'Cairo'
                          : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                              ? 'Poppins'
                              : 'AlKshrl',
                    ),
                  ),
                  backgroundColor: Colors.white,
                ),
                body: state is! HomeLoadingCategoriesState
                    ? Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 40),
                            width: double.infinity,
                            child: LayoutBuilder(
                              builder: (context, constrant) {
                                return Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        '${LanguagesCubit.get(context).searchForSomeThing()}',
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                                              ? 'Cairo'
                                              : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                                                  ? 'Poppins'
                                                  : 'AlKshrl',
                                          color: mPrimaryBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      AutoSizeText(
                                        '${LanguagesCubit.get(context).chooseTheGovernorate()}',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                                              ? 'Cairo'
                                              : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                                                  ? 'Poppins'
                                                  : 'AlKshrl',
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
                                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                        height: 30,
                                      ),
                                      Column(
                                        children: [
                                          AutoSizeText(
                                            '${LanguagesCubit.get(context).chooseTheSpecialtyYouWant()}',
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                                                  ? 'Cairo'
                                                  : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                                                      ? 'Poppins'
                                                      : 'AlKshrl',
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
                                                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                                            textDirection: TextDirection.rtl,
                                                          ),
                                                        );
                                                      },
                                                    ).toList(),
                                                    onChanged: (value) {
                                                      _cubit.selecteCategory(value.toString());
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
                                        height: 30,
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
                                                animation: AnimationType.scale, // Optional value
                                                duration: Duration(milliseconds: 300), // Optional value
                                                replacement: false, // Optional value
                                                curveType: CurveType.decelerate, // Optional value
                                              );
                                            } else {
                                              if (_cubit.orderModel.length >= 10) {
                                                AwesomeDialog(
                                                  context: context,
                                                  animType: AnimType.SCALE,
                                                  headerAnimationLoop: false,
                                                  dialogType: DialogType.NO_HEADER,
                                                  body: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(15.0),
                                                      child: Column(
                                                        children: [
                                                          AutoSizeText(
                                                            '${LanguagesCubit.get(context).reachedTheMaximumSearchNumber()}',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily: SharedHelper.getCacheData(key: LANGUAGES) ==
                                                                      'AR'
                                                                  ? 'Cairo'
                                                                  : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                                                                      ? 'Poppins'
                                                                      : 'AlKshrl',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  title: 'This is Ignored',
                                                  desc: 'This is also Ignored',
                                                )..show();
                                              } else {
                                                _cubit.getStoresWhereGovernment(
                                                  governName: _cubit.selectedGovern,
                                                  category: _cubit.selectedCategories,
                                                );
                                              }
                                            }
                                          },
                                          child: state is! HomeGetStoresLoadingWhereGoverState
                                              ? Text(
                                                  '${LanguagesCubit.get(context).continueT()}',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                                                        ? 'Cairo'
                                                        : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                                                            ? 'Poppins'
                                                            : 'AlKshrl',
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
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            width: 400,
                            child: CarouselSlider(
                              items: _cubit.adsModel
                                  .map(
                                    (e) => FancyShimmerImage(
                                      imageUrl: e.image.toString(),
                                      boxFit: BoxFit.fill,
                                    ),
                                  )
                                  .toList(),
                              options: CarouselOptions(
                                height: 150,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 5),
                                autoPlayAnimationDuration: Duration(milliseconds: 500),
                                autoPlayCurve: Curves.easeIn,
                                scrollDirection: Axis.horizontal,
                                viewportFraction: 1,
                              ),
                            ),
                          ),
                        ],
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
      },
    );
  }
}
