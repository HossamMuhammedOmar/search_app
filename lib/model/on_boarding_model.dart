import 'package:flutter/cupertino.dart';
import 'package:search_app/bloc/languages/cubit.dart';

class OnBoardingModel {
  final String imageUrl;
  final String title;
  final String description;

  OnBoardingModel({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}
