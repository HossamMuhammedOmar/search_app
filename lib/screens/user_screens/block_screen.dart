import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';

class BlockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Image.asset(
              'assets/images/blllo.png',
            ),
          ),
          Center(
            child: AutoSizeText(
              'هذا الحساب تم حظره لإنتهاك سياسه البرنامج',
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cairo',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'الرجوع',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
