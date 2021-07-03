import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';

class NotificationUserScreen extends StatelessWidget {
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
          body: ListView.separated(
            itemBuilder: (context, index) => _buildItem(
              _cubit.userNotificationModel[index],
              _cubit,
            ),
            separatorBuilder: (context, index) => Container(
                width: double.infinity, height: 1, color: Colors.grey),
            itemCount: _cubit.userNotificationModel.length,
          ),
        );
      },
    );
  }

  Widget _buildItem(item, HomeCubit cubit) {
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
              ' تم العثور علي ${item.decription}  في ',
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
            children: [
              FloatingActionButton(
                mini: true,
                onPressed: () {},
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
