import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
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
import 'package:search_app/screens/service_screen/report_screen.dart';
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
                : SharedHelper.getCacheData(key: LANGUAGES) == 'KR'
                    ? NavigationStoreWidget()
                    : null,
            drawer: SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
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
                      : SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                          ? 'Poppins'
                          : 'AlKshrl',
                ),
              ),
            ),
            body: state is! GetAllStoreOrderLoading
                ? Center(
                    child: _cubit.myOrder.isNotEmpty
                        ? ListView.separated(
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
                          )
                        : Center(
                            child: Text(
                              '${LanguagesCubit.get(context).noRequests()}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
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
        children: [
          Expanded(
            child: Text(
              '${oItem.description}',
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 10),
          MaterialButton(
            onPressed: () {
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                headerAnimationLoop: false,
                dialogType: DialogType.INFO_REVERSED,
                body: Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ReportScreen(
                                uId: oItem.uId,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          '${LanguagesCubit.get(context).report()}',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      AutoSizeText(
                        '${oItem.description}',
                        textAlign: TextAlign.center,
                        maxLines: 10,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      if (oItem.image!.isNotEmpty)
                        Container(
                          height: 250,
                          child: FullScreenWidget(
                            child: ClipRRect(
                              child: FancyShimmerImage(
                                imageUrl: '${oItem.image}',
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                title: 'This is Ignored',
                desc: 'This is also Ignored',
                btnCancelText: '${LanguagesCubit.get(context).notAvailable()}',
                btnOkText: '${LanguagesCubit.get(context).available()}',
                btnOkOnPress: () {
                  cubit.editOrderState(
                    oId: oItem.oId,
                    newS: 'متوفر',
                    gov: cubit.userById[0].governorate,
                    cat: cubit.userById[0].categories,
                    uId: cubit.userById[0].uId,
                    decription: oItem.description,
                  );
                },
                btnCancelOnPress: () {
                  cubit.editOrderState(
                    oId: oItem.oId,
                    newS: 'غير متوفر',
                    gov: cubit.userById[0].governorate,
                    cat: cubit.userById[0].categories,
                    uId: cubit.userById[0].uId,
                    decription: oItem.description,
                  );
                },
              )..show();
            },
            child: Text('${LanguagesCubit.get(context).show()}'),
            textColor: Colors.white,
            color: mPrimaryGreen,
          )
        ],
      ),
    );
  }
}
