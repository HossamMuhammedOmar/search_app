import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/bloc/register/cubit.dart';
import 'package:search_app/bloc/register/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/user_screens/home_screen.dart';
import 'package:transitioner/transitioner.dart';

import '../who_are_screen.dart';

class RegisterUserScreen extends StatelessWidget {
  final _formEmailKey = GlobalKey<FormState>();
  final _formPhoneKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameEmailController = TextEditingController();
  final _namePhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterStoreSucessState) {
          Fluttertoast.showToast(
            msg: "Register Succecfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeUserScreen(),
            ),
            (route) => false,
          );
        }

        if (state is RegisterErorrState) {
          Fluttertoast.showToast(
            msg: "${state.e}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        final _cubit = RegisterCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Transitioner(
                  context: context,
                  child: WhoAreScreen(),
                  animation: AnimationType.slideBottom, // Optional value
                  duration: Duration(milliseconds: 1000), // Optional value
                  replacement: true, // Optional value
                  curveType: CurveType.ease, // Optional value
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraint) {
                double localWidth = constraint.maxWidth;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    textDirection:
                        SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${LanguagesCubit.get(context).register()}',
                        textDirection:
                            SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${LanguagesCubit.get(context).createNewAccount()}',
                        textDirection:
                            SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: mPrimaryGrey,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        minWidth: localWidth / 2.3,
                                        child: AutoSizeText(
                                          '${LanguagesCubit.get(context).withEmail()}',
                                        ),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          _cubit.changeToPhoneScreen();
                                        },
                                        minWidth: localWidth / 2.3,
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
                            ],
                          ),
                          _cubit.isEmailScreen
                              ? _emailScreen(context, _cubit, state)
                              : _phoneScreen(context),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _emailScreen(context, RegisterCubit cubit, RegisterStates state) {
    return Column(
      children: [
        Form(
          key: _formEmailKey,
          child: Column(
            children: [
              // User Name
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Enter your name';
                  }
                },
                controller: _nameEmailController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '${LanguagesCubit.get(context).userName()}',
                  prefixIcon: Icon(Icons.account_circle_outlined),
                ),
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 10,
              ),
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
          height: 30,
        ),
        state is! RegisterLoaingState
            ? MaterialButton(
                color: mPrimaryYellow,
                textColor: Colors.white,
                onPressed: () {
                  if (_formEmailKey.currentState!.validate()) {
                    cubit.registerWithEmail(
                      email: _emailController.text,
                      password: _passwordController.text,
                      name: _nameEmailController.text,
                    );
                    if (state is RegisterStoreSucessState)
                      Transitioner(
                        context: context,
                        child: HomeUserScreen(),
                        animation: AnimationType.fadeIn, // Optional value
                        duration:
                            Duration(milliseconds: 1000), // Optional value
                        replacement: true, // Optional value
                        curveType: CurveType.decelerate, // Optional value
                      );
                  }
                },
                minWidth: double.infinity,
                height: 50,
                child: AutoSizeText(
                  '${LanguagesCubit.get(context).register()}',
                ),
              )
            : Center(child: CircularProgressIndicator()),
        Row(
          textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
              ? TextDirection.rtl
              : TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              '${LanguagesCubit.get(context).haveAnAccount()}',
              textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
            TextButton(
              onPressed: () {},
              child: AutoSizeText(
                '${LanguagesCubit.get(context).login()}',
                textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
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
                    return 'Enter your name';
                  }
                },
                controller: _namePhoneController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '${LanguagesCubit.get(context).userName()}',
                  prefixIcon: Icon(Icons.account_circle_outlined),
                ),
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 10,
              ),

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
          height: 30,
        ),
        MaterialButton(
          color: mPrimaryYellow,
          textColor: Colors.white,
          onPressed: () {
            if (_formPhoneKey.currentState!.validate()) {
              print(_namePhoneController.text);
              print(_phoneController.text);
            }
          },
          minWidth: double.infinity,
          height: 50,
          child: AutoSizeText(
            '${LanguagesCubit.get(context).register()}',
          ),
        ),
        Row(
          textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
              ? TextDirection.rtl
              : TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              '${LanguagesCubit.get(context).haveAnAccount()}',
              textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                '${LanguagesCubit.get(context).login()}',
                textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
