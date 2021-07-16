import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/service_screen/notification_store_screen.dart';
import 'package:search_app/widgets/navigation_store_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:transitioner/transitioner.dart';

class HomeStoreScreen extends StatefulWidget {
  @override
  _HomeStoreScreenState createState() => _HomeStoreScreenState();
}

class _HomeStoreScreenState extends State<HomeStoreScreen> {
  @override
  void initState() {
    HomeCubit.get(context)
        .getUserById(uId: SharedHelper.getCacheData(key: TOKEN));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            if (state is GetUserByIdSuccess) {
              HomeCubit.get(context).getAllOrdersWhereGovernAndCategorie(
                  gov: HomeCubit.get(context).userById[0].governorate,
                  cat: HomeCubit.get(context).userById[0].categories);
              HomeCubit.get(context).getStoreNotification();
            }
          },
          builder: (context, state) {
            HomeCubit _cubit = HomeCubit.get(context);

            return Theme(
              data: ThemeData(
                primaryIconTheme: IconThemeData(color: mPrimaryLightBlue),
              ),
              child: Scaffold(
                backgroundColor: Colors.white,
                drawerScrimColor: Colors.black.withOpacity(0.7),
                endDrawer: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                    ? NavigationStoreWidget()
                    : SharedHelper.getCacheData(key: LANGUAGES) == 'KR'
                        ? NavigationStoreWidget()
                        : null,
                drawer: SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                    ? NavigationStoreWidget()
                    : null,
                appBar: AppBar(
                  actions: [
                    if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN')
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            IconButton(
                              onPressed: () {
                                Transitioner(
                                  context: context,
                                  child: NotificationStoreScreen(),
                                  animation: AnimationType.slideBottom,
                                  duration: Duration(milliseconds: 300),
                                  replacement: false,
                                  curveType: CurveType.linear,
                                );
                                HomeCubit.get(context).getStoreNotification();
                              },
                              icon: Icon(
                                Icons.notifications_none,
                                size: 28,
                              ),
                            ),
                            if (_cubit.storeNotification.length != 0)
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
                                _cubit.getStoreNotification();
                                Transitioner(
                                  context: context,
                                  child: NotificationStoreScreen(),
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
                            if (_cubit.storeNotification.length != 0)
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
                                    HomeCubit.get(context)
                                        .getStoreNotification();
                                    Transitioner(
                                      context: context,
                                      child: NotificationStoreScreen(),
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
                                if (_cubit.storeNotification.length != 0)
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
                      fontFamily: SharedHelper.getCacheData(key: LANGUAGES) ==
                              'AR'
                          ? 'Cairo'
                          : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                              ? 'Poppins'
                              : 'AlKshrl',
                    ),
                  ),
                  backgroundColor: Colors.white,
                ),
                body: Center(
                  child: Column(
                    children: [
                      Image.asset('assets/images/wwww.png'),
                      SizedBox(height: 20),
                      if (_cubit.userById.isNotEmpty)
                        state is! GetUserByIdLoading
                            ? Expanded(
                                child: LayoutBuilder(
                                  builder: (context, constraint) {
                                    return Column(
                                      children: [
                                        AutoSizeText(
                                          '${LanguagesCubit.get(context).welcome()}',
                                          style: TextStyle(
                                            fontSize: 26,
                                            fontFamily: SharedHelper
                                                        .getCacheData(
                                                            key: LANGUAGES) ==
                                                    'AR'
                                                ? 'Cairo'
                                                : SharedHelper.getCacheData(
                                                            key: LANGUAGES) ==
                                                        'EN'
                                                    ? 'Poppins'
                                                    : 'AlKshrl',
                                          ),
                                        ),
                                        AutoSizeText(
                                          '${_cubit.userById[0].storeName!}',
                                          style: TextStyle(
                                            fontSize: 26,
                                            fontFamily: SharedHelper
                                                        .getCacheData(
                                                            key: LANGUAGES) ==
                                                    'AR'
                                                ? 'Cairo'
                                                : SharedHelper.getCacheData(
                                                            key: LANGUAGES) ==
                                                        'EN'
                                                    ? 'Poppins'
                                                    : 'AlKshrl',
                                            color: mPrimaryLightBlue,
                                          ),
                                        ),
                                        Text(
                                          '${LanguagesCubit.get(context).followingNewOrdersNow()}',
                                          style: TextStyle(
                                            fontFamily: SharedHelper
                                                        .getCacheData(
                                                            key: LANGUAGES) ==
                                                    'AR'
                                                ? 'Cairo'
                                                : SharedHelper.getCacheData(
                                                            key: LANGUAGES) ==
                                                        'EN'
                                                    ? 'Poppins'
                                                    : 'AlKshrl',
                                            fontSize: 22,
                                          ),
                                        ),
                                        Spacer(),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          width: 400,
                                          child: CarouselSlider(
                                            items: _cubit.adsModel
                                                .map(
                                                  (e) => FancyShimmerImage(
                                                    imageUrl:
                                                        e.image.toString(),
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
                                              autoPlayInterval:
                                                  Duration(seconds: 10),
                                              autoPlayAnimationDuration:
                                                  Duration(milliseconds: 500),
                                              autoPlayCurve: Curves.easeIn,
                                              scrollDirection: Axis.horizontal,
                                              viewportFraction: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )
                            : LinearProgressIndicator(),
                    ],
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
