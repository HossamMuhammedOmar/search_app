import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/register/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isEmailScreen = true;

  void changeToEmailScreen() {
    isEmailScreen = true;
    emit(RegisterUserEmailScreenState());
  }

  void changeToPhoneScreen() {
    isEmailScreen = false;
    emit(RegisterUserPhoneScreenState());
  }
}
