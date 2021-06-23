class SuggModel {
  String? message;
  SuggModel(this.message);

  SuggModel.fromJson(Map<String, dynamic>? json) {
    message = json?['message'];
  }
}
