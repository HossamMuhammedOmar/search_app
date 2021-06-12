import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/register/cubit.dart';
import 'package:search_app/bloc/register/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:transitioner/transitioner.dart';

import '../who_are_screen.dart';

class RegisterUserScreen extends StatelessWidget {
  final _formEmailKey = GlobalKey<FormState>();
  final _formPhoneKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Create your new account...',
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
                                          minWidth: localWidth / 2.3,
                                          child: AutoSizeText(
                                            'with email',
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
                                            'with phone',
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
                                ? _emailScreen(context)
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
      ),
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
                  if (value!.isEmpty) {
                    return 'Enter your name';
                  }
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User name',
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
                  labelText: 'Email address',
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
                  labelText: 'Password',
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
        MaterialButton(
          color: mPrimaryYellow,
          textColor: Colors.white,
          onPressed: () {},
          minWidth: double.infinity,
          height: 50,
          child: AutoSizeText(
            'Register',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText('Have an account?'),
            TextButton(
              onPressed: () {},
              child: Text('Login'),
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
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User name',
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
                  labelText: 'Phone number',
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
          onPressed: () {},
          minWidth: double.infinity,
          height: 50,
          child: AutoSizeText(
            'Register',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText('Have an account?'),
            TextButton(
              onPressed: () {},
              child: Text('Login'),
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
