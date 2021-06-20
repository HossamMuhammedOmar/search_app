import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/model/order_model.dart';
import 'package:search_app/model/states_model.dart';
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
  List myStatesModel = [];
  List<UserModel> userById = [];
  List<StatesModel> myState = [];
  List myOrder = [];
  String? sId = '';
  String? STATE = 'جاري البحث';
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
    OrderModel orderModel = OrderModel(
      categories: categories,
      date: date,
      description: description,
      image: image,
      uId: uId,
      government: government,
    );
    emit(HomeCreateOrderLoadingState());
    FirebaseFirestore.instance
        .collection('user')
        .where("shop.address.governorate", isEqualTo: government)
        .where("shop.categories", isEqualTo: categories)
        .get()
        .then((value) {
      final doc = FirebaseFirestore.instance.collection('orders').doc();
      value.docs.forEach(
        (element) {
          final sId = FirebaseFirestore.instance
              .collection('orders')
              .doc(doc.id)
              .collection('states')
              .doc();

          final statesModel = StatesModel(
            storeId: element.data()['uId'],
            storeName: element.data()['shop']['address']['storeName'],
            governorate: element.data()['shop']['address']['governorate'],
            street: element.data()['shop']['address']['street'],
            storePhone: element.data()['shop']['address']['storePhone'],
            state: 'جاري البحث',
            cat: element.data()['shop']['categories'],
            sId: sId.id,
          );

          doc.set(orderModel.toMap()).then(
            (v) {
              sId.set(statesModel.toMap()).then((value) {}).catchError((e) {
                print(e.toString());
              });
              emit(HomeCreateOrderSuccessState());
            },
          ).catchError(
            (e) {
              emit(HomeCreateOrderErorrState());
            },
          );
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
    String url = imgUrl;
    emit(HomeDeleteMyOrderLoadingState());
    FirebaseFirestore.instance.collection('orders').doc(oId).delete().then(
      (value) {
        orderModel = [];
        getMyOrder();
        emit(HomeDeleteMyOrderSuccessState());
        // Remove Image With Search
        if (url.isNotEmpty) {
          firebase_storage.FirebaseStorage.instance
              .refFromURL(url.toString())
              .delete()
              .then(
                (value) {},
              )
              .catchError(
            (e) {
              print(e.toString());
            },
          );
        }
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
    FirebaseFirestore.instance
        .collection('orders')
        .doc(oId)
        .collection('states')
        .get()
        .then(
      (value) {
        // print(value.docs.first.data());
        value.docs.forEach((element) {
          myStatesModel.add(element.data());
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

  // GET USER BY ID
  void getUserById({required uId}) {
    emit(GetUserByIdLoading());
    FirebaseFirestore.instance
        .collection('user')
        .where("uId", isEqualTo: uId)
        .get()
        .then(
      (value) {
        value.docs.forEach((element) {
          userById.add(UserModel.fromJson(element.data()));
        });
        emit(GetUserByIdSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetUserByIdError());
      },
    );
  }
  /////////////////////// STORE CASES \\\\\\\\\\\\\\\\\\\

  // GET ALL ORDERS WHER GOVERN AND CATEGORIES
  void getAllOrdersWhereGovernAndCategorie({required gov, required cat}) {
    myOrder = [];
    emit(GetAllStoreOrderLoading());
    FirebaseFirestore.instance
        .collection('orders')
        .where('government', isEqualTo: gov)
        .where('categories', isEqualTo: cat)
        .get()
        .then(
      (value) {
        value.docs.forEach(
          (element) {
            FirebaseFirestore.instance
                .collection('orders')
                .doc(element.id)
                .collection('states')
                .where('storeId',
                    isEqualTo: SharedHelper.getCacheData(key: TOKEN))
                .where('state', isEqualTo: 'جاري البحث')
                .get()
                .then(
              (value) {
                print("VALUE ${value.docs.length}");
                if (value.docs.length != 0) {
                  myOrder.add(OrderModel.fromJson(element.data(), element.id));
                }
                emit(GetAllStoreOrderSuccess());
              },
            ).catchError(
              (e) {},
            );
          },
        );
        emit(GetAllStoreOrderSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetAllStoreOrderError());
      },
    );
  }

  // GET ALL STATES WITH ORDER ID
  void getAllStateWihtOrderId({required oId}) {}

  // EDITE STATE
  void editOrderState({
    required oId,
    required newS,
    required cat,
    required gov,
  }) {
    print("RRRRR");
    emit(EditStateLoaing());
    FirebaseFirestore.instance
        .collection('orders')
        .doc(oId)
        .collection('states')
        .where('storeId', isEqualTo: SharedHelper.getCacheData(key: TOKEN))
        .get()
        .then(
      (value) {
        value.docs.forEach((element) {
          sId = element.data()['sId'];
          STATE = element.data()['state'];
          FirebaseFirestore.instance
              .collection('orders')
              .doc(oId)
              .collection('states')
              .doc(sId)
              .update({'state': newS}).then((value) {
            getAllOrdersWhereGovernAndCategorie(cat: cat, gov: gov);
          }).catchError((e) {
            print(e.toString());
          });
        });
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(EditStateError());
      },
    );
  }
}
