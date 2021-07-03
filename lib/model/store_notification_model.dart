class StoreNotificationModel {
  String? government;
  String? categories;
  String? description;
  String? date;
  bool? seen;
  String? sId;
  String? uId;

  StoreNotificationModel({
    this.government,
    this.categories,
    this.description,
    this.date,
    this.seen,
    this.uId,
    this.sId,
  });

  StoreNotificationModel.fromJson(Map<String, dynamic>? json) {
    government = json?['government'];
    categories = json?['categories'];
    description = json?['description'];
    date = json?['date'];
    uId = json?['uId'];
  }
}

class Stores {
  String? sId;
  bool? seen;
  Stores.fromJson(Map<String, dynamic>? json) {
    sId = json?['sId'];
    seen = json?['seen'];
  }
}
