import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/model/on_boarding_model.dart';
import 'package:search_app/screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transitioner/transitioner.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();

  bool _isLastPage = false;

  // Helper Methods
  void submit() {
    SharedHelper.cacheData(key: ONBOARDING, value: true).then(
      (value) => {
        Transitioner(
          context: context,
          child: LoginScreen(),
          animation: AnimationType.slideTop, // Optional value
          duration: Duration(milliseconds: 1000), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.elastic, // Optional value
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<OnBoardingModel> onBoardingdata = [
      OnBoardingModel(
        imageUrl: 'assets/images/onB1.png',
        title: '${LanguagesCubit.get(context).onBoardingTitle1()}',
        description: '${LanguagesCubit.get(context).onBoardingDescription1()}',
      ),
      OnBoardingModel(
        imageUrl: 'assets/images/onB4.png',
        title: '${LanguagesCubit.get(context).onBoardingTitle2()}',
        description: '${LanguagesCubit.get(context).onBoardingDescription2()}',
      ),
      OnBoardingModel(
        imageUrl: 'assets/images/onB2.png',
        title: '${LanguagesCubit.get(context).onBoardingTitle3()}',
        description: '${LanguagesCubit.get(context).onBoardingDescription3()}',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: submit,
            child: AutoSizeText(
              '${LanguagesCubit.get(context).skipText()}',
              maxLines: 1,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          right: 30,
          left: 30,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == onBoardingdata.length - 1) {
                    setState(() {
                      _isLastPage = true;
                    });
                  } else {
                    setState(() {
                      _isLastPage = false;
                    });
                  }
                },
                controller: pageController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment:
                          SharedHelper.getCacheData(key: LANGUAGES) == 'EN'
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          '${onBoardingdata[index].imageUrl}',
                          width: double.infinity,
                          height: 300,
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          child: Column(
                            children: [
                              AutoSizeText(
                                '${onBoardingdata[index].title}',
                                textDirection:
                                    SharedHelper.getCacheData(key: LANGUAGES) ==
                                            'AR'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              AutoSizeText(
                                '${onBoardingdata[index].description}',
                                maxLines: 4,
                                textDirection:
                                    SharedHelper.getCacheData(key: LANGUAGES) ==
                                            'AR'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: onBoardingdata.length,
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: onBoardingdata.length,
                  effect: JumpingDotEffect(
                    activeDotColor: mPrimaryBlue,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: mPrimaryBlue,
                  onPressed: () {
                    if (_isLastPage) {
                      submit();
                    } else {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Icon(Icons.keyboard_arrow_right),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
