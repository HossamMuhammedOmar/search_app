import 'package:flutter/material.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/model/on_boarding_model.dart';
import 'package:search_app/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (c) => HomeScreen()),
          (route) => false,
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: submit,
            child: Text(
              'SKIPE',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 30,
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
                itemBuilder: (BuildContext context, int index) =>
                    _itemBuilder(index),
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

Widget _itemBuilder(int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(
        '${onBoardingdata[index].imageUrl}',
        width: double.infinity,
        height: 300,
      ),
      SizedBox(height: 20.0),
      Text(
        '${onBoardingdata[index].title}',
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 20.0),
      SingleChildScrollView(
        child: Text(
          '${onBoardingdata[index].description}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    ],
  );
}
