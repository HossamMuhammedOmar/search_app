class CategoriesModel {
  String? name;

  CategoriesModel(this.name);
  CategoriesModel.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
