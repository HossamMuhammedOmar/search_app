import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          _buildItem(_cubit.myOrders[index], index, _cubit),
                      itemCount: _cubit.myOrders.length,
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

  Widget _buildItem(OrderModel item, int index, HomeCubit cubit) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Text('${item.description}'),
          TextButton(
            onPressed: () {},
            child: Text('متوفر'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('غير متوفر'),
          )
        ],
      ),
    );
  }
}
