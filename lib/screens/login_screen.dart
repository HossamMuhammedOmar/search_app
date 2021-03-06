import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/bloc/login/cubit.dart';
import 'package:search_app/bloc/login/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/admin_screen.dart';
import 'package:search_app/screens/switcher.dart';
import 'package:search_app/screens/user_screens/otp_screen_login.dart';
import 'package:search_app/screens/who_are_screen.dart';
import 'package:transitioner/transitioner.dart';

class LoginScreen extends StatelessWidget {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formEmailKey = GlobalKey<FormState>();
  final _formPhoneKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SharedHelper.getCacheData(key: TOKEN) == null
        ? BlocProvider(
            create: (context) => LoginCubit(),
            child: BlocConsumer<LoginCubit, LoginStates>(
              listener: (context, states) {
                if (states is LoginSucessState) {
                  Fluttertoast.showToast(
                    msg: "Login Successfuly",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: mPrimaryGreen,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SwitcherScreen(),
                    ),
                    (route) => false,
                  );
                }
                if (states is LoginErorrState) {
                  Fluttertoast.showToast(
                    msg: "email or password incorrect!",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              builder: (context, states) {
                final _cubit = LoginCubit.get(context);

                return Scaffold(
                  backgroundColor: Colors.white,
                  body: LayoutBuilder(
                    builder: (context, constrains) {
                      double localHeight = constrains.maxHeight;

                      return LayoutBuilder(
                        builder: (context, constraint) {
                          // double localWidth = constrains.maxWidth;
                          return Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onLongPress: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (_) => AdminScreen()),
                                          (route) => false);
                                    },
                                    child: Container(
                                      height: localHeight / 4,
                                      child: Image.asset(
                                        'assets/icons/chhhose.png',
                                        filterQuality: FilterQuality.low,
                                        fit: BoxFit.scaleDown,
                                      ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                    _cubit
                                                        .changeToEmailScreen();
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
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
                                                    _cubit
                                                        .changeToPhoneScreen();
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
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
                                            ? _emailScreen(context, states)
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
            ),
          )
        : SwitcherScreen();
  }

  Widget _emailScreen(context, state) {
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
                obscureText: LoginCubit.get(context).hidePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '${LanguagesCubit.get(context).password()}',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(LoginCubit.get(context).icon),
                    onPressed: () {
                      LoginCubit.get(context).changePasswordVisibaility();
                    },
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
        state is! LoginLoaingState
            ? MaterialButton(
                onPressed: () {
                  if (_formEmailKey.currentState!.validate()) {
                    LoginCubit.get(context).loginWithEmail(
                      _emailController.text,
                      _passwordController.text,
                    );
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
              )
            : Center(child: CircularProgressIndicator()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
              ? TextDirection.rtl
              : SharedHelper.getCacheData(key: LANGUAGES) == 'KR'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          children: [
            AutoSizeText(
              '${LanguagesCubit.get(context).dontHaveAccount()}',
              style: TextStyle(color: mPrimaryDarkGrey),
              textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                  ? TextDirection.rtl
                  : SharedHelper.getCacheData(key: LANGUAGES) == 'KR'
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
                  hintText: '*** *** ****',
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      '+964',
                      textAlign: TextAlign.center,
                    ),
                  ),
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => OtpScreenLogin(phone: _phoneController.text),
                ),
              );
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
              : SharedHelper.getCacheData(key: LANGUAGES) == 'KR'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              '${LanguagesCubit.get(context).dontHaveAccount()}',
              style: TextStyle(color: mPrimaryDarkGrey),
              textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                  ? TextDirection.rtl
                  : SharedHelper.getCacheData(key: LANGUAGES) == 'KR'
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
                    : SharedHelper.getCacheData(key: LANGUAGES) == 'KR'
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
