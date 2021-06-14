class CategoriesModel {
  String? name;

  CategoriesModel.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
  }
}
