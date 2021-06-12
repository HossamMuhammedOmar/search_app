import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/bloc/login/cubit.dart';
import 'package:search_app/bloc/login/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/who_are_screen.dart';
import 'package:transitioner/transitioner.dart';

class LoginScreen extends StatelessWidget {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameEmailController = TextEditingController();
  final _namePhoneController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formEmailKey = GlobalKey<FormState>();
  final _formPhoneKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, states) {},
      builder: (context, states) {
        final _cubit = LoginCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          body: LayoutBuilder(
            builder: (context, constrains) {
              double localHeight = constrains.maxHeight;

              return LayoutBuilder(
                builder: (context, constraint) {
                  double localWidth = constrains.maxWidth;
                  return Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: localHeight / 4,
                            child: Image.asset(
                              'assets/icons/chhhose.png',
                              filterQuality: FilterQuality.low,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 50,
                              left: 50,
                              bottom: 50,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  '${LanguagesCubit.get(context).loginToYourAccount()}',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: mPrimaryDarkGrey,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            _cubit.changeToEmailScreen();
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                          color: _cubit.isEmailScreen
                                              ? mPrimaryBlue
                                              : mPrimaryGrey,
                                          textColor: Colors.white,
                                          child: AutoSizeText(
                                            '${LanguagesCubit.get(context).withEmail()}',
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            _cubit.changeToPhoneScreen();
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                          color: _cubit.isEmailScreen
                                              ? mPrimaryGrey
                                              : mPrimaryBlue,
                                          textColor: Colors.white,
                                          child: AutoSizeText(
                                            '${LanguagesCubit.get(context).withPhone()}',
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                                _cubit.isEmailScreen
                                    ? _emailScreen(context)
                                    : _phoneScreen(context),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _emailScreen(context) {
    return Column(
      children: [
        Form(
          key: _formEmailKey,
          child: Column(
            children: [
              // User Name

              TextFormField(
                validator: (String? value) {
                  if (value == null || !value.contains('@')) {
                    return 'Enter a valid email';
                  }
                },
                controller: _emailController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '${LanguagesCubit.get(context).emailAddress()}',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Enter your password';
                  }
                },
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '${LanguagesCubit.get(context).password()}',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {},
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () {
            if (_formEmailKey.currentState!.validate()) {
              print(_nameEmailController.text);
              print(_emailController.text);
              print(_passwordController.text);
            }
          },
          minWidth: double.infinity,
          textColor: Colors.white,
          height: 50,
          color: mPrimaryYellow,
          child: AutoSizeText(
            '${LanguagesCubit.get(context).login()}',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
              ? TextDirection.rtl
              : TextDirection.ltr,
          children: [
            AutoSizeText(
              '${LanguagesCubit.get(context).dontHaveAccount()}',
              style: TextStyle(color: mPrimaryDarkGrey),
              textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              maxLines: 1,
            ),
            SizedBox(
              width: 3,
            ),
            TextButton(
              onPressed: () {
                Transitioner(
                  context: context,
                  child: WhoAreScreen(),
                  animation: AnimationType.scale, // Optional value
                  duration: Duration(milliseconds: 500), // Optional value
                  replacement: true, // Optional value
                  curveType: CurveType.decelerate, // Optional value
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: AutoSizeText(
                '${LanguagesCubit.get(context).createNew()}',
                textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                style: TextStyle(color: mPrimaryBlue),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _phoneScreen(context) {
    return Column(
      children: [
        Form(
          key: _formPhoneKey,
          child: Column(
            children: [
              // User Name
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Enter your phone';
                  }
                },
                controller: _phoneController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '${LanguagesCubit.get(context).phoneNumber()}',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () {
            if (_formPhoneKey.currentState!.validate()) {
              print(_phoneController.text);
              print(_namePhoneController.text);
            }
          },
          minWidth: double.infinity,
          textColor: Colors.white,
          height: 50,
          color: mPrimaryYellow,
          child: AutoSizeText(
            '${LanguagesCubit.get(context).login()}',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        Row(
          textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
              ? TextDirection.rtl
              : TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              '${LanguagesCubit.get(context).dontHaveAccount()}',
              style: TextStyle(color: mPrimaryDarkGrey),
              textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              maxLines: 1,
            ),
            SizedBox(
              width: 3,
            ),
            TextButton(
              onPressed: () {
                Transitioner(
                  context: context,
                  child: WhoAreScreen(),
                  animation: AnimationType.scale, // Optional value
                  duration: Duration(milliseconds: 500), // Optional value
                  replacement: true, // Optional value
                  curveType: CurveType.decelerate, // Optional value
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: AutoSizeText(
                '${LanguagesCubit.get(context).createNew()}',
                style: TextStyle(color: mPrimaryBlue),
                textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
