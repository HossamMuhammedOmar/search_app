class OrderModel {
  String? categories;
  String? date;
  String? description;
  String? image;
  String? uId;
  List<Map>? states;
  String? government;
  String? oId;
  String? state;
  String? storeId;

  OrderModel({
    this.categories,
    this.date,
    this.description,
    this.image,
    this.uId,
    this.government,
    this.oId,
    this.state,
    this.storeId,
    this.states,
  });

  OrderModel.fromJson(Map<String, dynamic>? json, String? oId) {
    categories = json?['categories'];
    date = json?['date'];
    description = json?['description'];
    image = json?['image'];
    uId = json?['uId'];
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
      'government': government,
      'states': states,
    };
  }
}
