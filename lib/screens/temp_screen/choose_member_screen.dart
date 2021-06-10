import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:search_app/constant/constant.dart';

class ChooseMemberScreen extends StatelessWidget {
  const ChooseMemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constrains) {
          double localHeight = constrains.maxHeight;
          double localWidth = constrains.maxWidth;
          return Column(
            children: [
              Container(
                height: localHeight / 2,
                child: Image.asset(
                  'assets/icons/chhhose.png',
                  filterQuality: FilterQuality.low,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Choose Member Type',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: mPrimaryDarkGrey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          child: AutoSizeText(
                            'service owner',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: mPrimaryBlue,
                          textColor: Colors.white,
                          height: 50,
                          minWidth: localWidth,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: AutoSizeText(
                            'Normal User',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: mPrimaryGreen,
                          textColor: Colors.white,
                          height: 50,
                          minWidth: localWidth,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AutoSizeText(
                          'You can\'nt change this step',
                          style: TextStyle(color: mPrimaryGrey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
