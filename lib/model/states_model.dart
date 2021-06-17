class StatesModel {
  String? state;
  String? storeId;

  StatesModel({this.state, this.storeId});
  StatesModel.fromJson(Map<String, dynamic>? json) {
    state = json?['state'];
    storeId = json?['storeId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'state': state,
      'storeId': storeId,
    };
  }
}
