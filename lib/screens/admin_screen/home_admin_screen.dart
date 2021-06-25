import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/screens/admin_screen/ads_screen.dart';
import 'package:search_app/screens/admin_screen/sugg_screen.dart';
import 'package:search_app/screens/admin_screen/user_admin_screen.dart';
import 'package:search_app/screens/login_screen.dart';

class HomeAdminScreen extends StatefulWidget {
  @override
  _HomeAdminScreenState createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  @override
  void initState() {
    HomeCubit.get(context).getOrderCount();
    HomeCubit.get(context).getUserCount();
    HomeCubit.get(context).getSearchCount();
    HomeCubit.get(context).getStoreCount();
    HomeCubit.get(context).getCategoriesCount();
    HomeCubit.get(context).getSuggCount();
    super.initState();
  }

  final _fomeKey = GlobalKey<FormState>();
  final _cateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is AdminAddCategoriesSucessState) {
          _cateController.text = '';
          Fluttertoast.showToast(
            msg: "added successfuly",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: mPrimaryGreen,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xff2A2C3F),
          appBar: AppBar(
            backgroundColor: Color(0xff212332),
            title: Text('Welcome To Dashboard'),
          ),
          body: state is! AdminOrderCountLoaingState
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Color(0xff323548),
                        ),
                        Container(
                          color: Color(0xff212332),
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              AutoSizeText(
                                'TOTAL ORDERS :',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  color: Color(0xff02E8FF),
                                ),
                              ),
                              Spacer(),
                              AutoSizeText(
                                '${_cubit.orderCount}',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  color: Color(0xffF4B122),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Color(0xff323548),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Color(0xff323548),
                        ),
                        Container(
                          color: Color(0xff212332),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  AutoSizeText(
                                    'TOTAL USERS :',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      color: Color(0xff02E8FF),
                                    ),
                                  ),
                                  Spacer(),
                                  AutoSizeText(
                                    '${_cubit.userCount}',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      color: Color(0xffF4B122),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'USERS :',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '${_cubit.searchCount}',
                                    style: TextStyle(
                                      color: Color(0xffF07738),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'STORES :',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '${_cubit.storeCount}',
                                    style: TextStyle(
                                      color: Color(0xffF07738),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Color(0xff323548),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Color(0xff323548),
                        ),
                        Container(
                          color: Color(0xff212332),
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              AutoSizeText(
                                'TOTAL CATEGORIES :',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  color: Color(0xff02E8FF),
                                ),
                              ),
                              Spacer(),
                              AutoSizeText(
                                '${_cubit.categoriesCount}',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  color: Color(0xffF4B122),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Color(0xff323548),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Color(0xff323548),
                        ),
                        Container(
                          color: Color(0xff212332),
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              AutoSizeText(
                                'TOTAL SUGGESTIONS :',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  color: Color(0xff02E8FF),
                                ),
                              ),
                              Spacer(),
                              AutoSizeText(
                                '${_cubit.suggCount}',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  color: Color(0xffF4B122),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Color(0xff323548),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        MaterialButton(
                          onPressed: () {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              headerAnimationLoop: false,
                              dialogType: DialogType.NO_HEADER,
                              body: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      AutoSizeText('Enter category name'),
                                      SizedBox(height: 10),
                                      Form(
                                        key: _fomeKey,
                                        child: TextFormField(
                                          controller: _cateController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter name of categories';
                                            }
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      MaterialButton(
                                        onPressed: () {
                                          if (_fomeKey.currentState!
                                              .validate()) {
                                            _cubit.addCategories(
                                                name: _cateController.text);
                                          }
                                        },
                                        child: state
                                                is! AdminAddCategoriesLoaingState
                                            ? Text('ADD')
                                            : Center(
                                                child: LinearProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                        color: Color(0xff0099FA),
                                        textColor: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              title: 'This is Ignored',
                              desc: 'This is also Ignored',
                            )..show();
                          },
                          textColor: Colors.white,
                          child: Text(
                            'Add Categories',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          color: Color(0xffF7B521),
                          minWidth: MediaQuery.of(context).size.width / 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            _cubit.getSuggCount();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => SuggAdimnScreen()),
                            );
                          },
                          textColor: Colors.white,
                          child: Text(
                            'View Suggestions',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          color: Color(0xffE77D40),
                          minWidth: MediaQuery.of(context).size.width / 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            _cubit.getUserCount();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => UserAdminScreen()),
                            );
                          },
                          textColor: Colors.white,
                          child: Text(
                            'View Users',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          color: Color(0xffe0a110),
                          minWidth: MediaQuery.of(context).size.width / 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            _cubit.getAllAds();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => AdsScreen(),
                              ),
                            );
                          },
                          textColor: Colors.white,
                          child: Text(
                            'Ads',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          color: Color(0xff0A99F3),
                          minWidth: MediaQuery.of(context).size.width / 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (_) => LoginScreen(),
                                ),
                                (route) => false);
                          },
                          textColor: Colors.white,
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          color: Colors.red,
                          minWidth: MediaQuery.of(context).size.width / 2,
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
