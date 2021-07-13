import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/model/order_model.dart';
import 'package:search_app/widgets/navigation_widget.dart';
import 'package:transitioner/transitioner.dart';
import '../../constant/constant.dart';
import 'home_screen.dart';
import 'search_deatail.dart';

class SearchHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryIconTheme: IconThemeData(color: mPrimaryLightBlue),
      ),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, states) {},
        builder: (context, states) {
          HomeCubit _cubit = HomeCubit.get(context);
          return Scaffold(
            drawerScrimColor: Colors.black.withOpacity(0.7),
            endDrawer: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                ? NavigationDrawerWidget()
                : SharedHelper.getCacheData(key: LANGUAGES) == 'KR'
                    ? NavigationDrawerWidget()
                    : null,
            drawer: SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                ? NavigationDrawerWidget()
                : null,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                '${LanguagesCubit.get(context).yourSearchProccess()}',
                style: TextStyle(
                  color: mPrimaryDarkGrey,
                  fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                      ? 'Cairo'
                      : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                          ? 'Poppins'
                          : 'AlKshrl',
                ),
              ),
            ),
            body: LayoutBuilder(
              builder: (context, constraint) {
                double localHeigh = constraint.maxHeight;
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: localHeigh / 1.2,
                      child: states is HomeGetMyOrdersLoadingState
                          ? Center(child: CircularProgressIndicator())
                          : _cubit.orderModel.length != 0
                              ? ListView.separated(
                                  itemBuilder: (context, index) {
                                    return _buildItems(_cubit.orderModel[index],
                                        _cubit, context, states);
                                  },
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.grey.withOpacity(0.5),
                                    );
                                  },
                                  itemCount: _cubit.orderModel.length,
                                )
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${LanguagesCubit.get(context).noRequests()}',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(height: 10),
                                      TextButton(
                                        onPressed: () {
                                          Transitioner(
                                            context: context,
                                            child: HomeUserScreen(),
                                            animation: AnimationType
                                                .scale, // Optional value
                                            duration: Duration(
                                                milliseconds:
                                                    200), // Optional value
                                            replacement: true, // Optional value
                                            curveType: CurveType
                                                .decelerate, // Optional value
                                          );
                                        },
                                        child: Text(
                                          '${LanguagesCubit.get(context).addANewRequest()}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child: AutoSizeText(
                              '${LanguagesCubit.get(context).onlyFiveSearch()}',
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: mPrimaryDarkGrey,
                                fontFamily:
                                    SharedHelper.getCacheData(key: LANGUAGES) ==
                                            'AR'
                                        ? 'Cairo'
                                        : SharedHelper.getCacheData(
                                                    key: LANGUAGES) ==
                                                'EN'
                                            ? 'Poppins'
                                            : 'AlKshrl',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildItems(
      OrderModel item, HomeCubit cubit, context, HomeStates states) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Text(
                '${item.description}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            children: [
              MaterialButton(
                onPressed: () {
                  cubit.getStatesAndStoreFromOrder(oId: item.oId);
                  // cubit.getStoresWhereGovernmentDetails(
                  //   governName: item.government,
                  //   category: item.categories,
                  // );
                  Transitioner(
                    context: context,
                    child: SeachDetails(),
                    animation: AnimationType.fadeIn, // Optional value
                    duration: Duration(milliseconds: 300), // Optional value
                    replacement: true, // Optional value
                    curveType: CurveType.decelerate, // Optional value
                  );
                },
                child: Text(
                  '${LanguagesCubit.get(context).show()}',
                ),
                color: mPrimaryGreen,
                textColor: Colors.white,
                minWidth: 20,
              ),
              SizedBox(width: 5),
              MaterialButton(
                onPressed: () {
                  cubit.deleteMyOrder(oId: item.oId, imgUrl: item.image);
                },
                child: Text('${LanguagesCubit.get(context).delete()}'),
                color: Color(0xffe74c3c),
                textColor: Colors.white,
                minWidth: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
