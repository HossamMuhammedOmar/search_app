import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/login/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';

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
}
