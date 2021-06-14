import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';
import '../../model/categories_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<CategoriesModel> categories = [];

  // GET ALL CATEGORIES
  void getAllCategories() {
    emit(HomeLoadingCategoriesState());
    FirebaseFirestore.instance.collection('categories').get().then(
      (value) {
        value.docs.forEach(
          (element) {
            categories.add(CategoriesModel.fromJson(element.data()));
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
}
