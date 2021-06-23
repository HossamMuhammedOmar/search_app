import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/register/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/model/categories_model.dart';
import 'package:search_app/model/user_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isEmailScreen = true;

  String selectedCategories = 'الصيدليات';
  List gov = [
    'أربيل',
    'الأنبار',
    'بابل',
    'بغداد',
    'البصرة',
    'حلبجة',
    'دهوك',
    'القادسية',
    'ديالى',
    'ذي قار',
    'السليمانية',
    'صلاح الدين',
    'كركوك',
    'كربلاء',
    'المثنى',
    'ميسان',
    'النجف',
    'نينوى',
    'واسط',
  ];
  String selectedGovern = 'بغداد';
  List categories = [];

  void selecteGovern(currentGov) {
    selectedGovern = currentGov;
    emit(HomeChooseGovernState());
  }

  void changeToEmailScreen() {
    isEmailScreen = true;
    emit(RegisterUserEmailScreenState());
  }

  void changeToPhoneScreen() {
    isEmailScreen = false;
    emit(RegisterUserPhoneScreenState());
  }

  void registerWithEmail({
    required email,
    required password,
    String? type,
    String? uId,
    String? categories,
    String? storePhone,
    String? storeName,
    String? governorate,
    String? street,
    String? name,
  }) {
    emit(RegisterLoaingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (value) {
        SharedHelper.cacheData(key: TOKEN, value: value.user?.uid);
        storeNewUserData(
          email: email,
          type: SharedHelper.getCacheData(key: USERTYPE),
          uId: value.user?.uid,
          categories: categories,
          storePhone: storePhone,
          storeName: storeName,
          governorate: governorate,
          street: street,
          name: name,
        );
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(RegisterErorrState(e.toString()));
      },
    );
  }

  void registerWithPhone({required phone, required name}) {}

  // Store User Data
  void storeNewUserData({
    String? name,
    String? email,
    String? phone,
    String? type,
    String? uId,
    String? categories,
    String? storePhone,
    String? storeName,
    String? governorate,
    String? street,
  }) {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      phone: phone,
      type: type,
      uId: uId,
      categories: categories,
      storeName: storeName,
      storePhone: storePhone,
      governorate: governorate,
      street: street,
    );

    emit(RegisterStoreLoaingState());
    FirebaseFirestore.instance
        .collection('user')
        .doc()
        .set(
          userModel.toMap(),
        )
        .then(
      (value) {
        emit(RegisterStoreSucessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(RegisterStoreErorrState());
      },
    );
  }

  void selecteCategory(currentCategory) {
    selectedCategories = currentCategory;
    emit(RegisterChooseCategoriesState());
  }

  void getAllCategories() {
    emit(RegisterGetCategoiresLoadingState());
    FirebaseFirestore.instance.collection('categories').get().then(
      (value) {
        value.docs.forEach(
          (element) {
            categories.add(CategoriesModel.fromJson(element.data()));
          },
        );
        emit(RegisterGetCategoiresSuccessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(RegisterGetCategoiresErorrState());
      },
    );
  }
}
