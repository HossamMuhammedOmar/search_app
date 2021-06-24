import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/widgets/navigation_store_widget.dart';

class EditProfileScreen extends StatelessWidget {
  final _nameContoroller = TextEditingController();
  final _phoneContoroller = TextEditingController();
  final _streetContoroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryIconTheme: IconThemeData(color: mPrimaryLightBlue),
      ),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is GetDataByIdSuccess) {
            _nameContoroller.text = HomeCubit.get(context).myData.first['shop']['address']['storeName'];
            _phoneContoroller.text = HomeCubit.get(context).myData.first['shop']['address']['storePhone'];
            _streetContoroller.text = HomeCubit.get(context).myData.first['shop']['address']['street'];
          }

          if (state is UpdateProfileSuccess) {
            Fluttertoast.showToast(
                msg: "Update Successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: mPrimaryGreen,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          HomeCubit _cubit = HomeCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            drawerScrimColor: Colors.black.withOpacity(0.7),
            endDrawer: SharedHelper.getCacheData(key: LANGUAGES) == 'AR' ? NavigationStoreWidget() : null,
            drawer: SharedHelper.getCacheData(key: LANGUAGES) != 'AR' ? NavigationStoreWidget() : null,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                '${LanguagesCubit.get(context).editProfile()}',
                style: TextStyle(
                  color: mPrimaryDarkGrey,
                  fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR' ? 'Cairo' : 'Poppins',
                ),
              ),
            ),
            body: state is! GetDataByIdLoading
                ? SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/edit.png',
                              width: MediaQuery.of(context).size.width / 1.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '${LanguagesCubit.get(context).thisFeildIsRequired()}';
                                        }
                                      },
                                      controller: _nameContoroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '${LanguagesCubit.get(context).thisFeildIsRequired()}';
                                        }
                                      },
                                      controller: _phoneContoroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '${LanguagesCubit.get(context).thisFeildIsRequired()}';
                                        }
                                      },
                                      controller: _streetContoroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    MaterialButton(
                                      minWidth: double.infinity,
                                      height: 50,
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _cubit.updateProfile(
                                            id: _cubit.myId,
                                            name: _nameContoroller.text,
                                            phone: _phoneContoroller.text,
                                            street: _streetContoroller.text,
                                          );
                                        }
                                      },
                                      child: state is! UpdateProfileLoading
                                          ? Text('${LanguagesCubit.get(context).update()}')
                                          : Center(child: CircularProgressIndicator(color: Colors.white)),
                                      textColor: Colors.white,
                                      color: mPrimaryLightBlue,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
