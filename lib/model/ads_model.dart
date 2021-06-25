class AdsModel {
  String? image;
  String? id;
  AdsModel(this.image);
  AdsModel.fromJson(Map<String, dynamic>? json) {
    image = json?['image'];
    id = json?['id'];
  }

  Map<String, dynamic> toMap(aId) {
    return {
      'image': image,
      'id': aId,
    };
  }
}
