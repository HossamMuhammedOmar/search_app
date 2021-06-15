import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/model/user_model.dart';
import 'states.dart';
import '../../model/categories_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<CategoriesModel> categories = [];
  List cate = [];
  String selectedCategories = 'الصيدليات';
  List<UserModel> userModel = [];

  void selecteCategory(currentCategory) {
    selectedCategories = currentCategory;
    emit(HomeChooseCategoriesState());
  }

  // GET ALL CATEGORIES
  void getAllCategories() {
    emit(HomeLoadingCategoriesState());
    FirebaseFirestore.instance.collection('categories').get().then(
      (value) {
        value.docs.forEach(
          (element) {
            categories.add(CategoriesModel.fromJson(element.data()));
            cate.add(CategoriesModel.fromJson(element.data()));
          },
        );
        emit(HomeSucessCategoriesState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(HomeErorrCategoriesState());
      },
    );

    // FirebaseFirestore.instance.collection('categories').snapshots().forEach(
    //   (element) {
    //     element.docs.forEach((element) {
    //       print(element.data());
    //     });
    //   },
    // ).then((value) {
    //   emit(HomeSucessCategoriesState());
    // });
  }

  void getStoresWhereGovernment({required governName, required category}) {
    userModel = [];
    emit(HomeGetStoresLoadingWhereGoverState());
    FirebaseFirestore.instance
        .collection('user')
        .where("shop.address.governorate", isEqualTo: governName)
        .where("shop.categories", isEqualTo: category)
        .get()
        .then(
      (value) {
        value.docs.forEach((element) {
          userModel.add(UserModel.fromJson(element.data()));
        });
        emit(HomeGetStoresSuccessWhereGoverState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(HomeGetStoresErrorWhereGoverState());
      },
    );
  }
}
