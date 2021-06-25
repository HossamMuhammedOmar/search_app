import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:search_app/screens/service_screen/change_language_store.dart';
import 'package:search_app/screens/service_screen/edite_profile_screen.dart';
import 'package:search_app/screens/service_screen/oreder_traking.dart';
import 'package:search_app/screens/service_screen/sugg_store_screen.dart';
import '../bloc/home/cubit.dart';
import '../bloc/languages/cubit.dart';
import '../screens/login_screen.dart';
import '../screens/service_screen/home_screen.dart';
import 'package:transitioner/transitioner.dart';
import '../constant/constant.dart';
import '../helpers/shared_helper.dart';

class NavigationStoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'موجود',
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Almarai',
                          ),
                        ),
                        AutoSizeText(
                          'وين',
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40,
                            color: mPrimaryBlue,
                            fontFamily: 'Almarai',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'دليلك للبحث عما تريد',
                          maxLines: 1,
                          style: TextStyle(
                            color: mPrimaryBlue,
                            fontSize: 16,
                            fontFamily: 'Almarai',
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.search,
                          size: 26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Divider(color: mPrimaryGrey.withOpacity(.5)),
              const SizedBox(height: 24),
              _buildMenuItem(
                text: '${LanguagesCubit.get(context).home()}',
                icon: Icons.home_filled,
                onClick: () => _selectedItem(context, 0),
              ),
              const SizedBox(height: 16),
              _buildMenuItem(
                text: '${LanguagesCubit.get(context).changeLanguage()}',
                icon: Icons.language,
                onClick: () => _selectedItem(context, 1),
              ),
              const SizedBox(height: 16),
              _buildMenuItem(
                text: '${LanguagesCubit.get(context).orderTracking()}',
                icon: Icons.history,
                onClick: () => _selectedItem(context, 2),
              ),
              const SizedBox(height: 16),
              _buildMenuItem(
                text:
                    '${LanguagesCubit.get(context).complaintsAndsuggestions()}',
                icon: Icons.beenhere_outlined,
                onClick: () => _selectedItem(context, 3),
              ),
              const SizedBox(height: 16),
              _buildMenuItem(
                text: '${LanguagesCubit.get(context).editProfile()}',
                icon: Icons.edit,
                onClick: () => _selectedItem(context, 5),
              ),
              const SizedBox(height: 16),
              _buildMenuItem(
                text: '${LanguagesCubit.get(context).logout()}',
                icon: Icons.logout,
                onClick: () => _selectedItem(context, 4),
              ),
              const SizedBox(height: 24),
              Divider(color: mPrimaryGrey.withOpacity(.5)),
              const SizedBox(height: 24),
              Image(
                image: AssetImage('assets/images/undraw_search.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClick,
  }) {
    return ListTile(
      title: AutoSizeText(
        '$text',
        textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
            ? TextDirection.rtl
            : TextDirection.ltr,
        maxLines: 3,
        style: TextStyle(
          fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
              ? 'Cairo'
              : 'Poppins',
        ),
      ),
      trailing: SharedHelper.getCacheData(key: LANGUAGES) == 'AR'
          ? Icon(
              icon,
              color: mPrimaryBlue,
            )
          : Icon(null),
      leading: SharedHelper.getCacheData(key: LANGUAGES) != 'AR'
          ? Icon(
              icon,
              color: mPrimaryBlue,
            )
          : Icon(null),
      onTap: onClick,
      hoverColor: mPrimaryLightBlue,
    );
  }

  void _selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        HomeCubit.get(context).getAllAds();
        Transitioner(
          context: context,
          child: HomeStoreScreen(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 800), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        break;
      case 1:
        Transitioner(
          context: context,
          child: ChangeLanguageStore(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 800), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        break;
      case 2:
        HomeCubit.get(context).getAllOrdersWhereGovernAndCategorie(
            gov: HomeCubit.get(context).userById[0].governorate,
            cat: HomeCubit.get(context).userById[0].categories);
        Transitioner(
          context: context,
          child: OrderTracking(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 300), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        break;
      case 3:
        Transitioner(
          context: context,
          child: SuggStoreScreen(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 300), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        break;
      case 4:
        SharedHelper.removeCacheData(key: TOKEN);
        SharedHelper.removeCacheData(key: USERTYPE);
        Transitioner(
          context: context,
          child: LoginScreen(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 300), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        break;
      case 5:
        HomeCubit.get(context)
            .getMyData(uId: SharedHelper.getCacheData(key: TOKEN));
        Transitioner(
          context: context,
          child: EditProfileScreen(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 300), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        break;
    }
  }
}
