import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/bloc/register/cubit.dart';
import 'package:search_app/bloc/register/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/service_screen/home_screen.dart';
import 'package:search_app/screens/who_are_screen.dart';
import 'package:transitioner/transitioner.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();
    final _passwordController = TextEditingController();
    final _streetController = TextEditingController();

    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, states) {
        if (states is RegisterStoreSucessState) {
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
              builder: (context) => HomeStoreScreen(),
            ),
            (route) => false,
          );
        }

        if (states is RegisterErorrState) {
          Fluttertoast.showToast(
            msg: "${states.e}",
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
        RegisterCubit _cubit = RegisterCubit.get(context);
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
          body: state is! RegisterGetCategoiresLoadingState
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 20,
                      left: 20,
                      bottom: 30,
                    ),
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
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Enter the shop name';
                                  }
                                  return null;
                                },
                                controller: _nameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      '${LanguagesCubit.get(context).shopName()}',
                                  prefixIcon: Icon(Icons.storefront_outlined),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Enter phone number';
                                  }
                                  return null;
                                },
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      '${LanguagesCubit.get(context).phoneNumber()}',
                                  prefixIcon: Icon(Icons.phone),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                validator: (String? value) {
                                  if (value == null || !value.contains('@')) {
                                    return 'Enter a valid email';
                                  }
                                  return null;
                                },
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      '${LanguagesCubit.get(context).emailAddress()}',
                                  prefixIcon: Icon(Icons.email),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a valid password';
                                  }
                                  return null;
                                },
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      '${LanguagesCubit.get(context).password()}',
                                  prefixIcon: Icon(Icons.lock),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.9),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: DecoratedBox(
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        icon: Icon(Icons.my_location),
                                        items: _cubit.gov.map(
                                          (govern) {
                                            return DropdownMenuItem(
                                              value: govern,
                                              child: AutoSizeText(
                                                govern,
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (value) {
                                          _cubit
                                              .selecteGovern(value.toString());
                                        },
                                        value: _cubit.selectedGovern,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a street name';
                                  }
                                  return null;
                                },
                                controller: _streetController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      '${LanguagesCubit.get(context).streetName()}',
                                  prefixIcon: Icon(Icons.streetview),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                textDirection:
                                    SharedHelper.getCacheData(key: LANGUAGES) ==
                                            'AR'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    '${LanguagesCubit.get(context).chooseCategories()}',
                                    textDirection: SharedHelper.getCacheData(
                                                key: LANGUAGES) ==
                                            'AR'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                    maxLines: 1,
                                  ),
                                  DropdownButton(
                                    items: _cubit.categories.map(
                                      (category) {
                                        return DropdownMenuItem(
                                          value: category.name,
                                          child: AutoSizeText(
                                            category.name,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      _cubit.selecteCategory(value.toString());
                                    },
                                    value: _cubit.selectedCategories,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              state is! RegisterLoaingState
                                  ? MaterialButton(
                                      color: mPrimaryBlue,
                                      textColor: Colors.white,
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _cubit.registerWithEmail(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                            type: SharedHelper.getCacheData(
                                                key: USERTYPE),
                                            governorate: _cubit.selectedGovern,
                                            street: _streetController.text,
                                            storePhone: _phoneController.text,
                                            storeName: _nameController.text,
                                            categories:
                                                _cubit.selectedCategories,
                                          );
                                          if (state is RegisterStoreSucessState)
                                            Transitioner(
                                              context: context,
                                              child: HomeStoreScreen(),
                                              animation: AnimationType
                                                  .fadeIn, // Optional value
                                              duration: Duration(
                                                milliseconds: 1000,
                                              ), // Optional value
                                              replacement:
                                                  true, // Optional value
                                              curveType: CurveType
                                                  .decelerate, // Optional value
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: LoadingBouncingLine.square(
                  backgroundColor: mPrimaryYellow,
                )),
        );
      },
    );
  }
}
