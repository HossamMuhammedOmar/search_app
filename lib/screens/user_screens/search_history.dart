import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/model/order_model.dart';
import 'package:search_app/widgets/navigation_widget.dart';
import 'package:transitioner/transitioner.dart';
import '../../constant/constant.dart';
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
                : null,
            drawer: SharedHelper.getCacheData(key: LANGUAGES) != 'AR'
                ? NavigationDrawerWidget()
                : null,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Your Search Proccess',
                style: TextStyle(color: mPrimaryDarkGrey),
              ),
            ),
            body: states is! HomeGetMyOrdersLoadingState
                ? LayoutBuilder(
                    builder: (context, constraint) {
                      double localHeigh = constraint.maxHeight;
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: localHeigh / 1.2,
                            child: ListView.separated(
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
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Center(
                              child: AutoSizeText(
                                'لديك ١٠ عمليات بحث نشطه فقط، الرجاء حذف البحث بعد الوصول إلي المنتج المطلوب حتي تسطيع البحث مجدداً',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: mPrimaryDarkGrey,
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : Center(
                    child: LoadingBouncingGrid.square(
                      backgroundColor: mPrimaryYellow,
                    ),
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
        textDirection: TextDirection.rtl,
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
          SizedBox(width: 20),
          MaterialButton(
            onPressed: () {
              cubit.getStoresWhereGovernmentDetails(
                governName: item.government,
                category: item.categories,
              );
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
              'Show',
            ),
            color: mPrimaryGreen,
            textColor: Colors.white,
            minWidth: 20,
          ),
          SizedBox(width: 5),
          MaterialButton(
            onPressed: () {
              cubit.deleteMyOrder(oId: item.oId);
            },
            child: Text('Delete'),
            color: Color(0xffe74c3c),
            textColor: Colors.white,
            minWidth: 20,
          ),
        ],
      ),
    );
  }
}
