import 'dart:convert';
import 'dart:io';

import 'package:base_project/core/error/exceptions.dart';
import 'package:base_project/core/error/failure.dart';

import '../interfaces/i_api_service.dart';

import 'package:http/http.dart' as http;

class ApiService implements IApiService {
  @override
  Future<Map<String, dynamic>> getAsync({
    required String url,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: headers);

    try {
      if (!response.statusCode.toString().contains('20')) {
        throw Failure.fromBody(body: response.body);
      }

      var jsonData = jsonDecode(response.body);
      return jsonData;
    } on SocketException {
      throw Failure.fromMessage(message: Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: Exceptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: Exceptions.formatException);
    }
  }

  @override
  Future<Map<String, dynamic>> postAsync({
    required Map<String, dynamic> body,
    required String url,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(url);
    final bodyEncode = json.encode(body);

    final response = await http.post(
      uri,
      headers: headers,
      body: bodyEncode,
    );

    try {
      var jsonData = jsonDecode(response.body);

      if(jsonData["error"] != null){
        throw Failure.fromBody(body: response.body);
      }

      return jsonData;
    } on SocketException {
      throw Failure.fromMessage(message: Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: Exceptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: Exceptions.formatException);
    }
  }

  @override
  Future<Map<String, dynamic>> putAsync({
    required Map<String, dynamic> body,
    required String url,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(url);
    final bodyEncode = json.encode(body);
    final response = await http.put(uri, headers: headers, body: bodyEncode);

    try {
      if (!response.statusCode.toString().contains('20')) {
        throw Failure.fromBody(body: response.body);
      }

      var jsonData = jsonDecode(response.body);
      return jsonData;
    } on SocketException {
      throw Failure.fromMessage(message: Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: Exceptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: Exceptions.formatException);
    }
  }
}
