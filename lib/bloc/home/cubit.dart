import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/model/order_model.dart';
import 'package:search_app/model/user_model.dart';
import 'package:transitioner/transitioner.dart';
import 'states.dart';
import '../../model/categories_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  File? productImage;
  final picker = ImagePicker();
  String? productImageUrl;
  List<CategoriesModel> categories = [];
  List cate = [];
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
  String selectedCategories = 'الصيدليات';
  String selectedGovern = 'بغداد';
  TextEditingController governController = TextEditingController();
  List<UserModel> userModel = [];
  List<OrderModel> orderModel = [];
  List? states = [];
  List myStatesModel = [];

  void selecteGovern(currentGov) {
    selectedGovern = currentGov;
    emit(HomeChooseGovernState());
  }

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
  }

  void getStoresWhereGovernment({required governName, required category}) {
    userModel = [];
    print(governName);
    print(category);
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
        productImage = null;
        productImageUrl = null;
        emit(HomeGetStoresSuccessWhereGoverState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(HomeGetStoresErrorWhereGoverState());
      },
    );
  }

  void getStoresWhereGovernmentDetails(
      {required governName, required category}) {
    userModel = [];
    emit(HomeGetStoresLoadingWhereGoverDetailsState());
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
        productImage = null;
        productImageUrl = null;
        emit(HomeGetStoresSuccessWhereGoverDetailsState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(HomeGetStoresErrorWhereGoverDetailsState());
      },
    );
  }

  // CREATE NEW ORDER
  void createNewOrder({
    required String categories,
    required String date,
    required String description,
    required String image,
    required String uId,
    required String government,
  }) {
    states = [];
    OrderModel orderModel = OrderModel(
      categories: categories,
      date: date,
      description: description,
      image: image,
      uId: uId,
      government: government,
      states: states,
    );
    emit(HomeCreateOrderLoadingState());

    FirebaseFirestore.instance
        .collection('user')
        .where("shop.address.governorate", isEqualTo: government)
        .where("shop.categories", isEqualTo: categories)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print("ELEMENT ${element.data()}");
        states?.add({
          'state': 'جاري البحث',
          'storeId': element.data()['uId'],
          'storeName': element.data()['shop']['address']['storeName'],
          'governorate': element.data()['shop']['address']['governorate'],
          'street': element.data()['shop']['address']['street'],
          'storePhone': element.data()['shop']['address']['storePhone'],
        });
      });
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
    }).catchError((e) {
      print(e.toString());
    });
  }

  // GET MY ORDERS
  void getMyOrder() {
    orderModel = [];
    emit(HomeGetMyOrdersLoadingState());
    FirebaseFirestore.instance
        .collection('orders')
        .where("uId", isEqualTo: SharedHelper.getCacheData(key: TOKEN))
        .get()
        .then(
      (value) {
        value.docs.forEach(
          (element) {
            orderModel.add(OrderModel.fromJson(element.data(), element.id));
          },
        );
        emit(HomeGetMyOrdersSuccessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(HomeGetMyOrdersErrorState());
      },
    );
  }

  // DELETE MY ORDER BY ID
  void deleteMyOrder({required oId, required imgUrl}) {
    emit(HomeDeleteMyOrderLoadingState());
    FirebaseFirestore.instance.collection('orders').doc(oId).delete().then(
      (value) {
        orderModel = [];
        getMyOrder();
        emit(HomeDeleteMyOrderSuccessState());
        // Remove Image With Search
        firebase_storage.FirebaseStorage.instance
            .ref('products/$imgUrl')
            .delete();
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(HomeDeleteMyOrderErrorState());
      },
    );
  }

  // GET ORDER WITH STATE
  void getStatesAndStoreFromOrder({required oId}) {
    myStatesModel = [];
    emit(HomeGetStatesFromOrderLoadingState());
    FirebaseFirestore.instance.collection('orders').doc(oId).get().then(
      (value) {
        value.data()!.forEach((key, value) {
          if (key == 'states') {
            for (int x = 0; x < value.length; x++) {
              myStatesModel.add(value[x]);
            }
          }
        });
        emit(HomeGetStatesFromOrderSuccessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(HomeGetStatesFromOrderErrorState());
      },
    );
  }

  void getUserType() {
    emit(LoginGetUserTypeLoading());
    FirebaseFirestore.instance
        .collection('user')
        .where("uId", isEqualTo: SharedHelper.getCacheData(key: TOKEN))
        .get()
        .then(
      (value) {
        value.docs.forEach((element) {
          SharedHelper.cacheData(key: USERTYPE, value: element['type']);
        });
        emit(LoginGetUserTypeSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(LoginGetUserTypeError());
      },
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      productImage = File(pickedFile.path);
      emit(HomeUploadImageSuccess());
    } else {
      print('No image selected.');
      emit(HomeUploadImageError());
    }
  }

  void removeProductImage(context, Widget child) {
    productImage = null;
    productImageUrl = null;

    Transitioner(
      context: context,
      child: child,
      animation: AnimationType.scale,
      duration: Duration(milliseconds: 500),
      replacement: true,
      curveType: CurveType.elastic,
    );
  }

  // UPLOAD IMAGE TO STORAGE
  void uploadProductImage() {
    emit(HomeStoreImageLoading());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('products/${Uri.file(productImage!.path).pathSegments.last}')
        .putFile(productImage!)
        .then(
      (value) {
        value.ref.getDownloadURL().then(
          (value) {
            productImageUrl = value;
            emit(HomeStoreImageSuccess());
          },
        ).catchError(
          (e) {
            emit(HomeStoreImageError());
          },
        );
      },
    ).catchError(
      (e) {
        emit(HomeStoreImageError());
      },
    );
  }
}
