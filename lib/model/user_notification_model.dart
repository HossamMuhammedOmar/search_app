class UserNotificationModel {
  String? date;
  String? decription;
  bool? seen;
  String? storeName;

  UserNotificationModel.fromJson(Map<String, dynamic>? json) {
    date = json?['date'];
    decription = json?['decription'];
    seen = json?['seen'];
    storeName = json?['storeName'];
  }
}
