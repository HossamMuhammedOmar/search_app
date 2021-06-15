import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/screens/user_screens/add_details_screen.dart';
import 'package:search_app/screens/user_screens/no_result_screen.dart';
import 'package:search_app/widgets/navigation_widget.dart';
import 'package:transitioner/transitioner.dart';

class HomeUserScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _governController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeGetStoresSuccessWhereGoverState) {
          HomeCubit.get(context).userModel.length == 0
              ? Transitioner(
                  context: context,
                  child: NoResultScreen(),
                  animation: AnimationType.scale, // Optional value
                  duration: Duration(milliseconds: 300), // Optional value
                  replacement: false, // Optional value
                  curveType: CurveType.decelerate, // Optional value
                )
              : Transitioner(
                  context: context,
                  child: AddDetaileScreen(),
                  animation: AnimationType.scale, // Optional value
                  duration: Duration(milliseconds: 300), // Optional value
                  replacement: false, // Optional value
                  curveType: CurveType.decelerate, // Optional value
                );
        }
      },
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return Theme(
          data: ThemeData(
            primaryIconTheme: IconThemeData(color: mPrimaryLightBlue),
          ),
          child: Scaffold(
            drawerScrimColor: Colors.black.withOpacity(0.7),
            endDrawer: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                ? NavigationDrawerWidget()
                : null,
            drawer: SharedHelper.getCacheData(key: LANGUAGES) != 'AR'
                ? NavigationDrawerWidget()
                : null,
            appBar: AppBar(
              title: Text(
                'Welcome Hossam',
                style: TextStyle(color: mPrimaryDarkGrey),
              ),
              backgroundColor: Colors.white,
            ),
            body: state is! HomeLoadingCategoriesState
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      padding: const EdgeInsets.only(top: 60),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'Search for some thing?',
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              color: mPrimaryDarkGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Form(
                              key: _formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter the governorate';
                                  }
                                },
                                controller: _cubit.governController,
                                decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal),
                                  ),
                                  labelText: 'Enter the governorate',
                                  prefixIcon: const Icon(
                                    Icons.emoji_flags_sharp,
                                    color: Colors.green,
                                  ),
                                  prefixText: ' ',
                                  suffixStyle:
                                      const TextStyle(color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Column(
                            children: [
                              AutoSizeText(
                                'Choose the specialty you want',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: mPrimaryDarkGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DecoratedBox(
                                decoration: ShapeDecoration(
                                  color: Color(0xffe2e8ea),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3.0)),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      items: _cubit.cate.map(
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
                                        _cubit
                                            .selecteCategory(value.toString());
                                      },
                                      value: _cubit.selectedCategories,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _cubit.getStoresWhereGovernment(
                                    governName: _cubit.governController.text,
                                    category: _cubit.selectedCategories,
                                  );
                                }
                              },
                              child:
                                  state is! HomeGetStoresLoadingWhereGoverState
                                      ? Text('Continue')
                                      : Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                              color: mPrimaryGreen,
                              minWidth: MediaQuery.of(context).size.width / 1.9,
                              height: 50,
                              textColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: LoadingBouncingLine.square(
                      backgroundColor: mPrimaryYellow,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
