class DataResponse<T> {
  T? data;
  dynamic statusCode;
  dynamic statusMessage;

  DataResponse({this.data, this.statusMessage, this.statusCode});

  factory DataResponse.fromJson(Map<String, dynamic> json) {
    return DataResponse(
        statusMessage: json["message"],
        statusCode: json["statusCode"],
        data: json.containsKey("data") ? dataFromJson(json['data'], T) : null);
  }

  factory DataResponse.withError(dynamic error) {
    return DataResponse(
      statusCode: 500,
      statusMessage: error ?? "Une erreur est survenue",
      data: null,
    );
  }

  static dataFromJson(json, Type t) {
    if (t.toString() == "List<FormFieldAssignment>") {
      return List<dynamic>.from(json['data']);
    }
    return json;
  }

  bool get hasErrorStatusCode => statusCode != 200 && statusCode != 2000;

  bool get hasOk => !hasErrorStatusCode && data != null && data != "";
}
