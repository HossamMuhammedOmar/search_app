import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/login/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isEmailScreen = true;

  void changeToEmailScreen() {
    isEmailScreen = true;
    emit(LoginEmailScreenState());
  }

  void changeToPhoneScreen() {
    isEmailScreen = false;
    emit(LoginPhoneScreenState());
  }
}
