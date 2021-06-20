import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/model/order_model.dart';
import 'package:search_app/widgets/navigation_store_widget.dart';

class OrderTracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryIconTheme: IconThemeData(color: mPrimaryLightBlue),
      ),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit _cubit = HomeCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            drawerScrimColor: Colors.black.withOpacity(0.7),
            endDrawer: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                ? NavigationStoreWidget()
                : null,
            drawer: SharedHelper.getCacheData(key: LANGUAGES) != 'AR'
                ? NavigationStoreWidget()
                : null,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                '${LanguagesCubit.get(context).orderTracking()}',
                style: TextStyle(
                  color: mPrimaryDarkGrey,
                  fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                      ? 'Cairo'
                      : 'Poppins',
                ),
              ),
            ),
            body: state is! GetAllStoreOrderLoading
                ? Center(
                    child: ListView.separated(
                      itemBuilder: (context, index) => _buildItem(
                        _cubit.myOrder[index],
                        _cubit,
                        context,
                      ),
                      separatorBuilder: (context, index) {
                        return Container(
                          color: mPrimaryGrey.withOpacity(.2),
                          height: 1,
                          width: double.infinity,
                        );
                      },
                      itemCount: _cubit.myOrder.length,
                    ),
                  )
                : Center(
                    child: LoadingJumpingLine.circle(
                      borderColor: mPrimaryYellow,
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildItem(OrderModel oItem, HomeCubit cubit, context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (oItem.image!.isNotEmpty)
            Container(
                height: 100,
                child: FullScreenWidget(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      "${oItem.image}",
                    ),
                  ),
                )),
          SizedBox(width: 8),
          Expanded(
            child: AutoSizeText(
              '${oItem.description}',
              maxLines: 10,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(width: 8),
          Row(
            children: [
              Container(
                color: Color(0xff2ecc71),
                child: TextButton(
                  onPressed: () {
                    cubit.editOrderState(
                      oId: oItem.oId,
                      newS: 'متوفر',
                      gov: cubit.userById[0].governorate,
                      cat: cubit.userById[0].categories,
                    );
                  },
                  child: Text(
                    'متوفر',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.red.shade500,
                child: TextButton(
                  onPressed: () {
                    cubit.editOrderState(
                      oId: oItem.oId,
                      newS: 'غير متوفر',
                      gov: cubit.userById[0].governorate,
                      cat: cubit.userById[0].categories,
                    );
                  },
                  child: Text(
                    'غير متوفر',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
