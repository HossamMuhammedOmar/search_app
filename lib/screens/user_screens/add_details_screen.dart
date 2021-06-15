import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/user_screens/result_screen.dart';
import 'package:transitioner/transitioner.dart';

class AddDetaileScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeCreateOrderSuccessState) {
          Transitioner(
            context: context,
            child: ResultScreen(),
            animation: AnimationType.fadeIn, // Optional value
            duration: Duration(milliseconds: 500), // Optional value
            replacement: true, // Optional value
            curveType: CurveType.decelerate, // Optional value
          );
        }
      },
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 100),
              child: Column(
                children: [
                  AutoSizeText(
                    'Enter a name or a short description for the item you are looking for',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'this feild is required';
                            }
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          maxLines: 10,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        AutoSizeText(
                          'If you want to add a picture of the item you are looking for',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _urlController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter image URL',
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: AutoSizeText(
                            'Or',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: mPrimaryGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              'Upload image from your device',
                              maxLines: 1,
                              style: TextStyle(
                                color: mPrimaryGrey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Image.asset(
                              'assets/images/upload.png',
                              width: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _cubit.createNewOrder(
                                categories: _cubit.selectedCategories,
                                date: DateTime.now().toString(),
                                description: _nameController.text,
                                image: '',
                                uId: SharedHelper.getCacheData(key: TOKEN),
                                state: 'search',
                                government: _cubit.governController.text,
                              );
                            }
                          },
                          child: state is! HomeCreateOrderLoadingState
                              ? Text('Start Search')
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                          height: 50,
                          minWidth: double.infinity,
                          color: mPrimaryLightBlue,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
