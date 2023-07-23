import 'dart:convert';

class Failure {
  String? message;

  Map<String, dynamic> error = {};

  @override
  String toString() => message ?? "";

  Failure.fromMessage({
    this.message,
  });

  Failure.fromBody({
    required String body,
  }) {
    var jsonData = jsonDecode(body);
    error = jsonData;
  }

  
}
