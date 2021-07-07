import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/service_screen/oreder_traking.dart';
import 'package:transitioner/transitioner.dart';

class NotificationStoreScreen extends StatelessWidget {
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
                    : 'Poppins',
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: state is! StoreNotificationLoading
              ? _cubit.storeNotification.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (context, index) => _buildItem(
                        _cubit.storeNotification[index],
                        _cubit.storeNotificationState[index],
                        _cubit,
                        context,
                      ),
                      separatorBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey),
                      itemCount: _cubit.storeNotification.length,
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

  Widget _buildItem(item, stateItem, HomeCubit cubit, context) {
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
              '${LanguagesCubit.get(context).thereIsSomeoneLooking()}',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              FloatingActionButton(
                heroTag: stateItem['oId'] + stateItem['oId'],
                mini: true,
                backgroundColor: mPrimaryGreen,
                onPressed: () {
                  HomeCubit.get(context).getAllOrdersWhereGovernAndCategorie(
                      gov: HomeCubit.get(context).userById[0].governorate,
                      cat: HomeCubit.get(context).userById[0].categories);
                  Transitioner(
                    context: context,
                    child: OrderTracking(),
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
