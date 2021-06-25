import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/constant/constant.dart';

class AddNewAdsScreen extends StatelessWidget {
  final _fomeKey = GlobalKey<FormState>();
  final _imageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is AddNewAdsLoading) {
          HomeCubit.get(context).adsImage = null;
          _imageController.text = '';
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
        var adsImage = _cubit.adsImage;
        return Scaffold(
          backgroundColor: Color(0xff2A2C3F),
          appBar: AppBar(
            backgroundColor: Color(0xff212332),
            title: Text('Add New Ads'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Enter Image URL',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Form(
                      key: _fomeKey,
                      child: TextFormField(
                        controller: _imageController,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Image URL';
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    adsImage == null
                        ? MaterialButton(
                            textColor: Colors.white,
                            color: mPrimaryYellow,
                            onPressed: () {
                              _cubit.getAdsImage();
                            },
                            child: Text('Upload Image'),
                          )
                        : Column(
                            children: [
                              Image(
                                width: double.infinity,
                                image: FileImage(adsImage),
                              ),
                              SizedBox(height: 5),
                              MaterialButton(
                                onPressed: () {
                                  adsImage = null;
                                  _cubit.removeAdsImage(
                                    context,
                                  );
                                },
                                textColor: Colors.redAccent,
                                child: Text('Remove'),
                              ),
                            ],
                          ),
                    SizedBox(height: 10),
                    MaterialButton(
                      onPressed: () {
                        if (_cubit.adsImage != null) {
                          _cubit.uploadAdsImage();
                        } else {
                          if (_fomeKey.currentState!.validate()) {
                            _cubit.addNewAds(imageUrl: _imageController.text);
                          }
                        }
                      },
                      child: state is! AddNewAdsLoading
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
          ),
        );
      },
    );
  }
}
