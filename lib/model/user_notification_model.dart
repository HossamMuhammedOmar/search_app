class UserNotificationModel {
  String? date;
  String? decription;
  bool? seen;
  String? storeName;
  String? id;

  UserNotificationModel.fromJson(Map<String, dynamic>? json, id) {
    date = json?['date'];
    decription = json?['decription'];
    seen = json?['seen'];
    storeName = json?['storeName'];
    this.id = id;
  }
}
