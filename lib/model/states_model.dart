class StatesModel {
  String? storeId;
  String? storeName;
  String? governorate;
  String? street;
  String? storePhone;
  String? state;
  String? cat;
  String? sId;
  String? description;

  StatesModel({
    this.storeId,
    this.governorate,
    this.storeName,
    this.storePhone,
    this.street,
    this.state,
    this.cat,
    this.sId,
    this.description,
  });
  StatesModel.fromJson(Map<String, dynamic>? json) {
    storeId = json?['storeId'];
    storeName = json?['storeName'];
    governorate = json?['governorate'];
    street = json?['street'];
    storePhone = json?['storePhone'];
    state = json?['state'];
    cat = json?['cat'];
    sId = json?['sId'];
    description = json?['description'];
  }

  Map<String, dynamic> toMap() {
    return {
      'storeId': storeId,
      'storeName': storeName,
      'governorate': governorate,
      'street': street,
      'storePhone': storePhone,
      'state': state,
      'cat': cat,
      'sId': sId,
      'date': DateTime.now(),
      'description': description,
    };
  }
}
