import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/model/user_model.dart';
import 'package:search_app/screens/user_screens/home_screen.dart';
import 'package:transitioner/transitioner.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: TextButton(
              onPressed: () {
                HomeCubit.get(context).getMyOrder();
                Transitioner(
                  context: context,
                  child: HomeUserScreen(),
                  animation: AnimationType.fadeIn, // Optional value
                  duration: Duration(milliseconds: 300), // Optional value
                  replacement: true, // Optional value
                  curveType: CurveType.decelerate, // Optional value
                );
              },
              child: Text(
                '${LanguagesCubit.get(context).home()}',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.65,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return _buildItem(
                          HomeCubit.get(context).userModel[index], context);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: HomeCubit.get(context).userModel.length,
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey.withOpacity(.2),
              ),
              Expanded(
                child: Container(
                  // color: mPrimaryLightBlue,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, bottom: 10, top: 20),
                      child: Center(
                        child: AutoSizeText(
                          '${LanguagesCubit.get(context).theseStoresThat()}',
                          maxLines: 5,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // color: Colors.white,
                            fontFamily: SharedHelper.getCacheData(
                                        key: LANGUAGES) ==
                                    'AR'
                                ? 'Poppins'
                                : SharedHelper.getCacheData(key: LANGUAGES) ==
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
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(UserModel item, context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.8,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff1EB6FF),
          ),
          child: Center(
            child: AutoSizeText(
              '${LanguagesCubit.get(context).searching()}',
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
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: mPrimaryGrey.withOpacity(0.3),
          ),
          height: 60,
          child: Center(
            child: AutoSizeText(
              '${item.storeName}',
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
