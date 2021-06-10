import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/bloc/languages/states.dart';
import 'package:search_app/constant/constant.dart';
import 'on_boarding_scree.dart';

class ChooseLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguagesCubit, LanguagesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    height: 249,
                    child: Image(
                      image: AssetImage('assets/images/search_image.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText(
                    'مرحباً بك ، برجاء قم بإختيار لغة واجهة التطبيق',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    color: mPrimaryBlue,
                    onPressed: () {
                      LanguagesCubit.get(context).changeToArabic();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnBoardingScreen()),
                        (route) => false,
                      );
                    },
                    minWidth: 120,
                    textColor: Colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('assets/icons/ar_icon.png'),
                          width: 18,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'العربية',
                          style: TextStyle(
                            fontFamily: 'Almarai',
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    textColor: Colors.white,
                    color: mPrimaryGreen,
                    onPressed: () {
                      LanguagesCubit.get(context).changeToEnglish();

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnBoardingScreen()),
                        (route) => false,
                      );
                    },
                    minWidth: 120,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'English',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 10),
                        Image(
                          image: AssetImage('assets/icons/us_icon.png'),
                          width: 18,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    color: mPrimaryGrey,
                    width: double.infinity,
                    height: .2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'الآن الوصول للشئ الذي تبحث عنه أصبح أسهل بإستخدام تطبيق وين موجود الذي يساعدك في العثور علي الشئ الذي تبحث عنه',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mPrimaryGrey,
                        fontFamily: 'Almarai',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
