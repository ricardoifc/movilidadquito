import 'dart:convert';

class Response {
  int? internalCode;
  String? error;
  int? errorCode;
  String? message;
  dynamic dataResponse;

  Response(
      {this.internalCode,
      this.error,
      this.errorCode,
      this.message,
      this.dataResponse});

  String toJson() => json.encode(toMap());

  Response.fromMap(Map<String, dynamic> json) {
    internalCode = json["internalCode"];
    error = json["error"];
    errorCode = json["errorCode"];
    message = json["message"];
    dataResponse = json["data"];
  }

  Map<String, dynamic> toMap() => {
        "internalCode": internalCode,
        "error": error,
        "errorCode": errorCode,
        "message": message,
      };

  @override
  String toString() {
    return 'Response{internalCode: $internalCode, error: $error,  errorCode: $errorCode, message: $message}';
  }
}
