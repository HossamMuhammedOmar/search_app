import 'package:flutter/material.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/widgets/navigation_widget.dart';
import '../../constant/constant.dart';

class ChangeLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Colors.white,
          title: Text(
            'Language Setting',
            style: TextStyle(color: mPrimaryDarkGrey),
          ),
        ),
        body: Center(
          child: Text('Change Language Screen'),
        ),
      ),
    );
  }
}
