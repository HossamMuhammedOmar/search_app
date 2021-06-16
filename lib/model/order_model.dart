class OrderModel {
  String? categories;
  String? date;
  String? description;
  String? image;
  String? uId;
  String? government;
  String? state;
  String? oId;

  OrderModel({
    this.categories,
    this.date,
    this.description,
    this.image,
    this.uId,
    this.state,
    this.government,
    this.oId,
  });

  OrderModel.fromJson(Map<String, dynamic>? json, String? oId) {
    categories = json?['categories'];
    date = json?['date'];
    description = json?['description'];
    image = json?['image'];
    uId = json?['uId'];
    state = json?['state'];
    government = json?['government'];
    this.oId = oId;
  }

  Map<String, dynamic> toMap() {
    return {
      'categories': categories,
      'date': date,
      'description': description,
      'image': image,
      'uId': uId,
      'state': state,
      'government': government,
    };
  }
}
