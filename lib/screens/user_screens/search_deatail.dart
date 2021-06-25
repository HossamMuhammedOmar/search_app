import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/user_screens/search_history.dart';
import 'package:transitioner/transitioner.dart';

class SeachDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: TextButton(
              onPressed: () {
                Transitioner(
                  context: context,
                  child: SearchHistory(),
                  animation: AnimationType.fadeIn,
                  duration: Duration(milliseconds: 300), // Optional value
                  replacement: true, // Optional value
                  curveType: CurveType.decelerate, // Optional value
                );
              },
              child: Text(
                '${LanguagesCubit.get(context).back()}',
                style: TextStyle(
                  fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                      ? 'Cairo'
                      : 'Poppins',
                  fontSize: 16,
                  color: mPrimaryGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 20,
                  bottom: 10,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.46,
                  child: states is! HomeGetStatesFromOrderLoadingState
                      ? ListView.separated(
                          itemBuilder: (context, index) {
                            return _buildItem(
                                HomeCubit.get(context).myStatesModel[index],
                                context,
                                states);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10);
                          },
                          itemCount:
                              HomeCubit.get(context).myStatesModel.length,
                        )
                      : Center(child: CircularProgressIndicator()),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey.withOpacity(.2),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Center(
                      child: AutoSizeText(
                        '${LanguagesCubit.get(context).searchingNow()}',
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily:
                              SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                                  ? 'NotoKufiArabic'
                                  : 'Poppins',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(item, context, HomeStates states) {
    return Row(
      children: [
        item['state'] == 'متوفر'
            ? Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.SCALE,
                        headerAnimationLoop: false,
                        dialogType: DialogType.SUCCES,
                        body: Center(
                          child: Column(
                            children: [
                              AutoSizeText(
                                item['storeName'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              SizedBox(height: 20),
                              AutoSizeText(
                                item['governorate'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'NotoKufiArabic',
                                ),
                              ),
                              SizedBox(height: 5),
                              AutoSizeText(
                                item['street'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'NotoKufiArabic',
                                ),
                              ),
                              SizedBox(height: 5),
                              AutoSizeText(
                                item['storePhone'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        title: 'This is Ignored',
                        desc: 'This is also Ignored',
                        btnOkOnPress: () {},
                      )..show();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mPrimaryYellow,
                      ),
                      child: Center(
                        child: AutoSizeText(
                          'تواصل الآن',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: MediaQuery.of(context).size.width / 5.3,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mPrimaryGreen,
                    ),
                    child: Center(
                      child: AutoSizeText(
                        '${item['state']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: item['state'] != 'غير متوفر'
                      ? Color(0xff1EB6FF)
                      : Color(0xffe74c3c),
                ),
                child: Center(
                  child: AutoSizeText(
                    '${item['state']}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
        Spacer(),
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: mPrimaryGrey.withOpacity(0.3),
          ),
          height: 60,
          child: Center(
            child: AutoSizeText(
              '${item['storeName']}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarai',
              ),
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }
}
