import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/user_screens/home_screen.dart';
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

        var productImage = _cubit.productImage;
        return Scaffold(
          body: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => HomeUserScreen()),
                      (route) => false,
                    );
                  },
                  icon: Icon(Icons.arrow_back_ios_sharp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 40.0, left: 40.0, top: 100, bottom: 5),
                child: SingleChildScrollView(
                  child: Column(
                    textDirection:
                        SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                    children: [
                      AutoSizeText(
                        '${LanguagesCubit.get(context).enterNameOrShortDescriptionForTheItemYouAreLookingFor()}',
                        textDirection:
                            SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily:
                              SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                                  ? 'Cairo'
                                  : 'Poppins',
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
                          textDirection:
                              SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                          children: [
                            TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '${LanguagesCubit.get(context).thisFeildIsRequired()}';
                                }
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            AutoSizeText(
                              '${LanguagesCubit.get(context).ifYouWantToAddPictureOfTheItemYouAreLookingFor()}',
                              maxLines: 2,
                              textDirection:
                                  SharedHelper.getCacheData(key: LANGUAGES) ==
                                          'AR'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
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
                                hintTextDirection:
                                    SharedHelper.getCacheData(key: LANGUAGES) ==
                                            'AR'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                hintText:
                                    '${LanguagesCubit.get(context).enterImageUrl()}',
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: AutoSizeText(
                                '${LanguagesCubit.get(context).or()}',
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
                            productImage == null
                                ? GestureDetector(
                                    onTap: () {
                                      _cubit.getImage();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          '${LanguagesCubit.get(context).uploadImageFromYourDevice()}',
                                          maxLines: 1,
                                          textDirection:
                                              SharedHelper.getCacheData(
                                                          key: LANGUAGES) ==
                                                      'AR'
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
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
                                  )
                                : Center(
                                    child: Column(
                                      children: [
                                        Image(
                                          width: double.infinity,
                                          image: FileImage(productImage),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            _cubit.removeProductImage(
                                              context,
                                              AddDetaileScreen(),
                                            );
                                          },
                                          textColor: Colors.redAccent,
                                          child: Text('Remove'),
                                        ),
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 30,
                            ),
                            MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_cubit.productImage != null) {
                                    _cubit.uploadProductImage(
                                      categories: _cubit.selectedCategories,
                                      date: DateTime.now().toString(),
                                      description: _nameController.text,
                                      image: _cubit.productImageUrl.toString(),
                                      uId:
                                          SharedHelper.getCacheData(key: TOKEN),
                                      government: _cubit.selectedGovern,
                                    );
                                  } else {
                                    _cubit.createNewOrder(
                                      categories: _cubit.selectedCategories,
                                      date: DateTime.now().toString(),
                                      description: _nameController.text,
                                      image: _urlController.text,
                                      uId:
                                          SharedHelper.getCacheData(key: TOKEN),
                                      government: _cubit.selectedGovern,
                                    );
                                  }
                                }
                              },
                              child: _cubit.productImage != null
                                  ? state is! HomeStoreImageLoading
                                      ? Text(
                                          '${LanguagesCubit.get(context).startSearch()}')
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                  : state is! HomeCreateOrderLoadingState
                                      ? Text(
                                          '${LanguagesCubit.get(context).startSearch()}')
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
            ],
          ),
        );
      },
    );
  }
}
