import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';
import 'package:search_app/model/order_model.dart';
import 'package:search_app/model/states_model.dart';
import 'package:search_app/model/sugg_model.dart';
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
  // ignore: non_constant_identifier_names
  String? STATE = 'جاري البحث';
  List<SuggModel> suggModel = [];
  List userAdminModle = [];
  List userAdminIDS = [];
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

  void getStoresWhereGovernmentDetails({required governName, required category}) {
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
          final sId = FirebaseFirestore.instance.collection('orders').doc(doc.id).collection('states').doc();

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
        .orderBy('date', descending: true)
        .get()
        .then(
      (value) {
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
  void uploadProductImage({
    required String categories,
    required String date,
    required String description,
    required String image,
    required String uId,
    required String government,
  }) {
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
            createNewOrder(
              categories: categories,
              date: date,
              description: description,
              image: productImageUrl.toString(),
              uId: uId,
              government: government,
            );
            emit(HomeCreateOrderSuccessState());
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
    userById = [];
    emit(GetUserByIdLoading());
    FirebaseFirestore.instance.collection('user').where("uId", isEqualTo: uId).get().then(
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
                .where('storeId', isEqualTo: SharedHelper.getCacheData(key: TOKEN))
                .where('state', isEqualTo: 'جاري البحث')
                .get()
                .then(
              (value) {
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
          FirebaseFirestore.instance.collection('orders').doc(oId).collection('states').doc(sId).update({
            'state': newS,
            if (newS == 'غير متوفر') 'date': DateTime.now().subtract(Duration(days: 10)),
            if (newS == 'متوفر') 'date': DateTime.now(),
          }).then((value) {
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

  // SEND SUGG
  void sendSugg({required message}) {
    emit(SendSuggLoding());
    FirebaseFirestore.instance.collection('sugg').add({'message': message}).then(
      (value) {
        emit(SendSuggSuccsess());
      },
    ).catchError(
      (e) {
        emit(SendSuggErorr());
        print(e.toString());
      },
    );
  }

  ///////////////////// ADMIN \\\\\\\\\\\\\\\\\\\
  void adminLogin(String email, String password) {
    emit(AdminLoginLoaingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (value) {
        emit(AdminLoginSucessState());
      },
    ).catchError(
      (e) {
        emit(AdminLoginErorrState());
        print(e.toString());
      },
    );
  }

  int orderCount = 0;
  int userCount = 0;
  int searchCount = 0;
  int storeCount = 0;
  int categoriesCount = 0;
  int suggCount = 0;

  void getOrderCount() {
    emit(AdminOrderCountLoaingState());
    FirebaseFirestore.instance.collection('orders').get().then(
      (value) {
        orderCount = value.docs.length;
        emit(AdminOrderCountSucessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(AdminOrderCountErorrState());
      },
    );
  }

  void getUserCount() {
    userAdminModle = [];
    userAdminIDS = [];
    emit(AdminUserCountLoaingState());
    FirebaseFirestore.instance.collection('user').get().then(
      (value) {
        userCount = value.docs.length;
        value.docs.forEach((element) {
          userAdminModle.add(element.data());
          userAdminIDS.add(element.id);
        });
        emit(AdminUserCountSucessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(AdminUserCountErorrState());
      },
    );
  }

  void getSearchCount() {
    emit(AdminSearchCountLoaingState());
    FirebaseFirestore.instance.collection('user').where('type', isEqualTo: 'user').get().then(
      (value) {
        searchCount = value.docs.length;
        emit(AdminSearchCountSucessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(AdminSearchCountErorrState());
      },
    );
  }

  void getStoreCount() {
    emit(AdminStoreCountLoaingState());
    FirebaseFirestore.instance.collection('user').where('type', isEqualTo: 'store').get().then(
      (value) {
        storeCount = value.docs.length;
        emit(AdminStoreCountSucessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(AdminStoreCountErorrState());
      },
    );
  }

  void getCategoriesCount() {
    emit(AdminCategoriesCountLoaingState());
    FirebaseFirestore.instance.collection('categories').get().then(
      (value) {
        categoriesCount = value.docs.length;
        emit(AdminCategoriesCountSucessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(AdminCategoriesCountErorrState());
      },
    );
  }

  void getSuggCount() {
    suggModel = [];
    emit(AdminSuggCountLoaingState());
    FirebaseFirestore.instance.collection('sugg').get().then(
      (value) {
        suggCount = value.docs.length;
        value.docs.forEach((element) {
          suggModel.add(SuggModel.fromJson(element.data()));
        });
        emit(AdminSuggCountSucessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(AdminSuggCountErorrState());
      },
    );
  }

  void addCategories({required name}) {
    CategoriesModel categoriesModel = CategoriesModel(name);
    emit(AdminAddCategoriesLoaingState());
    FirebaseFirestore.instance.collection('categories').add(categoriesModel.toMap()).then(
      (value) {
        emit(AdminAddCategoriesSucessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(AdminAddCategoriesErorrState());
      },
    );
  }

  void blockUser({required uId}) {
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .update({'block': true})
        .then(
          (value) {},
        )
        .catchError(
          (e) {
            print(e.toString());
          },
        );
  }

  void unBlockUser({required uId}) {
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .update({'block': false})
        .then(
          (value) {},
        )
        .catchError(
          (e) {
            print(e.toString());
          },
        );
  }

  List myData = [];
  String myId = '';
  void getMyData({required uId}) {
    myData = [];
    emit(GetDataByIdLoading());
    FirebaseFirestore.instance.collection('user').where("uId", isEqualTo: uId).get().then(
      (value) {
        value.docs.forEach((element) {
          myId = element.id;
          myData.add(element.data());
        });
        emit(GetDataByIdSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetDataByIdError());
      },
    );
  }

  void updateProfile({
    required id,
    String? name,
    String? phone,
    String? street,
  }) {
    emit(UpdateProfileLoading());
    FirebaseFirestore.instance.collection('user').doc(id).update({
      'shop.address.storeName': name,
      'shop.address.storePhone': phone,
      'shop.address.street': street,
    }).then(
      (value) {
        emit(UpdateProfileSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(UpdateProfileError());
      },
    );
  }

  List userBlock = [];
  // GET USER BY ID
  void getUserBlock({required uId}) {
    userBlock = [];
    emit(GetUserByIdLoading());
    FirebaseFirestore.instance.collection('user').where("uId", isEqualTo: uId).get().then(
      (value) {
        value.docs.forEach((element) {
          userBlock.add(element.data());
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
}
