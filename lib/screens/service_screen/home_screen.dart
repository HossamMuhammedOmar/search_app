import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/bloc/languages/cubit.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/widgets/navigation_store_widget.dart';

class HomeStoreScreen extends StatefulWidget {
  @override
  _HomeStoreScreenState createState() => _HomeStoreScreenState();
}

class _HomeStoreScreenState extends State<HomeStoreScreen> {
  @override
  void initState() {
    HomeCubit.get(context)
        .getUserById(uId: SharedHelper.getCacheData(key: TOKEN));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);

        return Theme(
          data: ThemeData(
            primaryIconTheme: IconThemeData(color: mPrimaryLightBlue),
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            drawerScrimColor: Colors.black.withOpacity(0.7),
            endDrawer: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                ? NavigationStoreWidget()
                : null,
            drawer: SharedHelper.getCacheData(key: LANGUAGES) != 'AR'
                ? NavigationStoreWidget()
                : null,
            appBar: AppBar(
              title: Text(
                '${LanguagesCubit.get(context).homeScreen()}',
                style: TextStyle(
                  color: mPrimaryDarkGrey,
                  fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                      ? 'Cairo'
                      : 'Poppins',
                ),
              ),
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/wwww.png'),
                  SizedBox(height: 20),
                  AutoSizeText(
                    '${LanguagesCubit.get(context).welcome()}',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily:
                          SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
                              ? 'Cairo'
                              : 'Poppins',
                    ),
                  ),
                  AutoSizeText(
                    '${HomeCubit.get(context).userById[0].storeName}',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'NotoKufiArabic',
                      color: mPrimaryLightBlue,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${LanguagesCubit.get(context).followingNewOrdersNow()}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
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
