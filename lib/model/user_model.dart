class UserModel {
  // user data
  String? name;
  String? email;
  String? phone;
  String? type;
  String? uId;
  ShopModel? shop;
  // shop data
  String? categories;
  String? storePhone;
  String? storeName;
  String? governorate;
  String? street;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.type,
    this.uId,
    this.street,
    this.storeName,
    this.governorate,
    this.categories,
    this.storePhone,
    this.shop,
  });

  UserModel.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    email = json?['email'];
    phone = json?['phone'];
    type = json?['type'];
    uId = json?['uId'];
    // shop = ShopModel.fromJson(json?['shop']);
    categories = json?['shop']['categories'];
    street = json?['shop']['address']['street'];
    storeName = json?['shop']['address']['storeName'];
    governorate = json?['shop']['address']['governorate'];
    storePhone = json?['shop']['address']['storePhone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'type': type,
      'uId': uId,
      if (type == 'store')
        'shop': {
          'categories': categories,
          'address': {
            'storePhone': storePhone,
            'storeName': storeName,
            'governorate': governorate,
            'street': street,
          },
        },
    };
  }
}

class ShopModel {
  String? categories;
  AddressModel? address;
  ShopModel({
    this.address,
    this.categories,
  });
  ShopModel.fromJson(Map<String, dynamic>? json) {
    categories = json?['categories'];
    address = AddressModel.fromJson(json?['address']);
  }
}

class AddressModel {
  String? storePhone;
  String? storeName;
  String? governorate;
  String? street;

  AddressModel({
    this.storePhone,
    this.governorate,
    this.storeName,
    this.street,
  });

  AddressModel.fromJson(Map<String, dynamic>? json) {
    storePhone = json?['storePhone'];
    storeName = json?['storeName'];
    governorate = json?['governorate'];
    street = json?['street'];
  }
}
