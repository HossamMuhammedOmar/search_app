import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';

class ReportScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _messageColntoller = TextEditingController();
  final uId;
  ReportScreen({this.uId});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is SendSuggSuccsess) {
          _messageColntoller.text = '';
          Fluttertoast.showToast(
              msg: "${LanguagesCubit.get(context).sendComplete()}",
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
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              '${LanguagesCubit.get(context).report()}',
              style: TextStyle(
                color: mPrimaryDarkGrey,
                fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                    ? 'Cairo'
                    : 'Poppins',
              ),
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: constraint.maxHeight / 3,
                        child: Image.asset('assets/images/report.png'),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(right: 50, left: 50),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '${LanguagesCubit.get(context).thisFeildIsRequired()}';
                              }
                            },
                            controller: _messageColntoller,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(right: 50, left: 50),
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _cubit.sendSugg(
                                message:
                                    '${_messageColntoller.text} \n USER ID : $uId',
                              );
                            }
                          },
                          child: state is! SendSuggLoding
                              ? Text('${LanguagesCubit.get(context).send()}')
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                          height: 50,
                          minWidth: double.infinity,
                          color: mPrimaryLightBlue,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
