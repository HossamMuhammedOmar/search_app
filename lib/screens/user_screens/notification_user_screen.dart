import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/user_screens/search_history.dart';
import 'package:transitioner/transitioner.dart';

class NotificationUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xffF5F5F5),
          appBar: AppBar(
            iconTheme: IconThemeData(color: mPrimaryDarkGrey),
            title: Text(
              '${LanguagesCubit.get(context).notification()}',
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
          body: state is! GetUserNotificationLoading
              ? _cubit.userNotificationModel.length != 0
                  ? ListView.separated(
                      itemBuilder: (context, index) => _buildItem(
                        _cubit.userNotificationModel[index],
                        _cubit,
                        context,
                      ),
                      separatorBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey),
                      itemCount: _cubit.userNotificationModel.length,
                    )
                  : Center(
                      child: Image.asset(
                        'assets/images/empty_notiif.png',
                        width: 150,
                      ),
                    )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildItem(item, HomeCubit cubit, context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 150,
      color: Color(0xffecf0f1),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                  ? TextDirection.rtl
                  : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                      ? TextDirection.ltr
                      : TextDirection.rtl,
              children: [
                Text(
                  '${LanguagesCubit.get(context).haveBeenFound()}',
                  textDirection:
                      SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                          ? TextDirection.rtl
                          : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                  style: TextStyle(
                    fontFamily:
                        SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                            ? 'Cairo'
                            : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                                ? 'Poppins'
                                : 'AlKshrl',
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '${item.decription}',
                  style: TextStyle(
                    fontFamily:
                        SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                            ? 'Cairo'
                            : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                                ? 'Poppins'
                                : 'AlKshrl',
                    color: Color(0xffc0392b),
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '${LanguagesCubit.get(context).inT()}',
                  textDirection:
                      SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                          ? TextDirection.rtl
                          : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                  style: TextStyle(
                    fontFamily:
                        SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                            ? 'Cairo'
                            : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                                ? 'Poppins'
                                : 'AlKshrl',
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: AutoSizeText(
              '${item.storeName}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                mini: true,
                heroTag: item.storeName + item.decription,
                onPressed: () {
                  cubit.markAsReadingUser(id: item.id);
                },
                child: Icon(Icons.done),
              ),
              FloatingActionButton(
                heroTag: item.storeName + item.decription + 'hero',
                mini: true,
                backgroundColor: mPrimaryGreen,
                onPressed: () {
                  HomeCubit.get(context).getMyOrder();
                  Transitioner(
                    context: context,
                    child: SearchHistory(),
                    animation: AnimationType.fadeIn, // Optional value
                    duration: Duration(milliseconds: 200), // Optional value
                    replacement: true, // Optional value
                    curveType: CurveType.decelerate, // Optional value
                  );
                },
                child: Icon(Icons.arrow_circle_up),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
