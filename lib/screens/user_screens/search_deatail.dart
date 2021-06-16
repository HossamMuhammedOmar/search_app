import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/model/user_model.dart';
import 'package:search_app/screens/user_screens/search_history.dart';
import 'package:transitioner/transitioner.dart';

class SeachDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.46,
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Center(
                          child: AutoSizeText(
                            'يتم البحث الآن وفي حال توفر المنتج عند أحد المتاجر سيظهر زر التواصل معه',
                            maxLines: 4,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'NotoKufiArabic',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Transitioner(
                              context: context,
                              child: SearchHistory(),
                              animation: AnimationType.fadeIn, // Optional value
                              duration:
                                  Duration(milliseconds: 300), // Optional value
                              replacement: true, // Optional value
                              curveType: CurveType.decelerate, // Optional value
                            );
                          },
                          child: Text(
                            'الرجوع',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              color: mPrimaryGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          textColor: Colors.white,
                          minWidth: 120,
                        )
                      ],
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
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff1EB6FF),
          ),
          child: Center(
            child: AutoSizeText(
              'جاري البحث',
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
          height: 70,
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
