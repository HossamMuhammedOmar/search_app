import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:transitioner/transitioner.dart';
import '../constant/constant.dart';
import '../helpers/shared_helper.dart';
import '../screens/change_language.dart';
import '../screens/user_screens/home_screen.dart';
import '../screens/user_screens/search_history.dart';

class NavigationDrawerWidget extends StatelessWidget {
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
                text: 'Home',
                icon: Icons.home_filled,
                onClick: () => _selectedItem(context, 0),
              ),
              const SizedBox(height: 16),
              _buildMenuItem(
                text: 'Change Language',
                icon: Icons.language,
                onClick: () => _selectedItem(context, 1),
              ),
              const SizedBox(height: 16),
              _buildMenuItem(
                text: 'Search History',
                icon: Icons.history,
                onClick: () => _selectedItem(context, 2),
              ),
              const SizedBox(height: 16),
              _buildMenuItem(
                text: 'Search History',
                icon: Icons.history,
                onClick: () => _selectedItem(context, 2),
              ),
              const SizedBox(height: 16),
              _buildMenuItem(
                text: 'Search History',
                icon: Icons.history,
                onClick: () => _selectedItem(context, 2),
              ),
              const SizedBox(height: 24),
              Divider(color: mPrimaryGrey.withOpacity(.5)),
              const SizedBox(height: 24),
              Image(
                image: AssetImage('assets/images/my_app.png'),
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
        maxLines: 1,
        style: TextStyle(),
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
        Transitioner(
          context: context,
          child: HomeUserScreen(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 800), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => HomeUserScreen()),
        // );
        break;
      case 1:
        Transitioner(
          context: context,
          child: ChangeLanguage(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 800), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => ChangeLanguage()),
        // );
        break;
      case 2:
        Transitioner(
          context: context,
          child: SearchHistory(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 300), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => SearchHistory()),
        // );
        break;
    }
  }
}
