import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';

class NotificationStoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: mPrimaryDarkGrey),
            title: Text(
              '${LanguagesCubit.get(context).notification()}',
              style: TextStyle(
                color: mPrimaryDarkGrey,
                fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                    ? 'Cairo'
                    : 'Poppins',
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: state is! StoreNotificationLoading
              ? ListView.separated(
                  itemBuilder: (context, index) => _buildItem(
                    _cubit.storeNotification[index],
                    _cubit.storeNotificationState[index],
                    _cubit,
                  ),
                  separatorBuilder: (context, index) => Container(
                      width: double.infinity, height: 1, color: Colors.grey),
                  itemCount: _cubit.storeNotification.length,
                )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildItem(item, stateItem, HomeCubit cubit) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 150,
      color: Color(0xffecf0f1),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AutoSizeText(
              'هناك شخص يبحث عن هذا المنتج في محافظتك',
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: AutoSizeText(
              '${item.description}',
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
            children: [
              FloatingActionButton(
                heroTag: stateItem['oId'],
                mini: true,
                onPressed: () {
                  cubit.markAsReading(
                    oId: stateItem['oId'],
                    id: stateItem['id'],
                  );
                },
                child: Icon(Icons.done),
              ),
              // MaterialButton(
              //   onPressed: () {},
              //   color: Colors.redAccent,
              //   child: Text(
              //     'تعليم كمقروء',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontFamily: 'Cairo',
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
