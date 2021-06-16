import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/model/order_model.dart';
import 'package:search_app/model/user_model.dart';
import 'states.dart';
import '../../model/categories_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<CategoriesModel> categories = [];
  List cate = [];
  String selectedCategories = 'الصيدليات';
  TextEditingController governController = TextEditingController();
  List<UserModel> userModel = [];
  List<OrderModel> orderModel = [];

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
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        userModel.add(UserModel.fromJson(element.data()));
      });
      emit(HomeGetStoresSuccessWhereGoverState());
    });
  }

  void getStoresWhereGovernmentDetails(
      {required governName, required category}) {
    userModel = [];
    emit(HomeGetStoresLoadingWhereGoverDetailsState());
    FirebaseFirestore.instance
        .collection('user')
        .where("shop.address.governorate", isEqualTo: governName)
        .where("shop.categories", isEqualTo: category)
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        userModel.add(UserModel.fromJson(element.data()));
      });
      emit(HomeGetStoresSuccessWhereGoverDetailsState());
    });
  }

  // CREATE NEW ORDER
  void createNewOrder({
    required String categories,
    required String date,
    required String description,
    required String image,
    required String uId,
    required String state,
    required String government,
  }) {
    OrderModel orderModel = OrderModel(
      categories: categories,
      date: date,
      description: description,
      image: image,
      uId: uId,
      state: state,
      government: government,
    );
    emit(HomeCreateOrderLoadingState());
    FirebaseFirestore.instance
        .collection('orders')
        .doc()
        .set(orderModel.toMap())
        .then(
      (value) {
        emit(HomeCreateOrderSuccessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(HomeCreateOrderErorrState());
      },
    );
  }

  // GET MY ORDERS
  void getMyOrder() {
    orderModel = [];
    emit(HomeGetMyOrdersLoadingState());
    FirebaseFirestore.instance
        .collection('orders')
        .where("uId", isEqualTo: SharedHelper.getCacheData(key: TOKEN))
        .snapshots()
        .listen((event) {
      event.docs.forEach(
        (element) {
          orderModel.add(OrderModel.fromJson(element.data(), element.id));
        },
      );
      emit(HomeGetMyOrdersSuccessState());
    });
  }

  // DELETE MY ORDER BY ID
  void deleteMyOrder({required oId}) {
    emit(HomeDeleteMyOrderLoadingState());
    FirebaseFirestore.instance.collection('orders').doc(oId).delete().then(
      (value) {
        getMyOrder();
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(HomeDeleteMyOrderErrorState());
      },
    );
  }
}
