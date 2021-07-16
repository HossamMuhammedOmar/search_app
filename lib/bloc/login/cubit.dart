import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/login/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/model/user_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  // ignore: non_constant_identifier_names
  List<UserModel> USERMODEL = [];
  bool isEmailScreen = true;
  IconData icon = Icons.visibility;
  bool hidePassword = true;

  void changeToEmailScreen() {
    isEmailScreen = true;
    emit(LoginEmailScreenState());
  }

  void changeToPhoneScreen() {
    isEmailScreen = false;
    emit(LoginPhoneScreenState());
  }

  void loginWithPhoneNumber({required phoneNumber}) {
    emit(LoginPhoneLoaingState());
    FirebaseAuth.instance.signInWithPhoneNumber(phoneNumber).then(
      (value) {
        print(value.verificationId);
        // SharedHelper.cacheData(key: TOKEN, value: value.verificationId);
        emit(LoginPhoneSucessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(LoginPhoneErorrState());
      },
    );
  }

  void loginWithEmail(String email, String password) {
    emit(LoginLoaingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (value) {
        SharedHelper.cacheData(key: TOKEN, value: value.user?.uid);
        emit(LoginSucessState());
      },
    ).catchError(
      (e) {
        emit(LoginErorrState());
        print(e.toString());
      },
    );
  }

  void changePasswordVisibaility() {
    hidePassword = !hidePassword;
    icon = hidePassword ? Icons.visibility : Icons.visibility_off;
    emit(LoginChangePasswordVisibility());
  }
}
