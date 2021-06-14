import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/widgets/navigation_widget.dart';

class HomeUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
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
            body: Container(
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
                      child: TextFormField(
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          helperText: 'must be in Arabic.',
                          labelText: 'Enter the governorate',
                          prefixIcon: const Icon(
                            Icons.emoji_flags_sharp,
                            color: Colors.green,
                          ),
                          prefixText: ' ',
                          suffixStyle: const TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text('Continue'),
                      color: mPrimaryLightBlue,
                      minWidth: double.infinity,
                      height: 50,
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
