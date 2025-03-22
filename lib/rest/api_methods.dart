import 'dart:convert';
import 'dart:io';
import 'package:jewellery/model/auth_model/error_model.dart';
import 'package:jewellery/rest/api_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  static Future<http.Response> get({
    required String url,
    required String token,
  }) async {
    try {
      debugPrint(url);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      return response;
    } on SocketException catch (e) {
      return http.Response(
          errorModelToJson(ErrorModel(
              code: 500, msg: "Failed", msgDetail: "No Internet", data: e)),
          500);
    } on HttpException catch (e) {
      return http.Response(
        errorModelToJson(ErrorModel(
            code: 500, msg: "Failed", msgDetail: "Server error", data: e)),
        500,
      );
    } on FormatException catch (e) {
      return http.Response(
          errorModelToJson(ErrorModel(
              code: 500, msg: "Failed", msgDetail: "Format is wrong", data: e)),
          500);
    } catch (e) {
      return http.Response(
          errorModelToJson(ErrorModel(
              code: 500,
              msg: "Failed",
              msgDetail: "Unexpected error",
              data: e)),
          500);
    }
  }

  static Future<http.Response> post({
    required String url,
    required Map<String, dynamic> body,
    String? fileKeyName,
    File? file,
    required String token,
  }) async {
    try {
      debugPrint(url);
      debugPrint(body.toString());
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll({
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      request.fields
          .addAll(body.map((key, value) => MapEntry(key, value.toString())));
      if (file?.path != null) {
        request.files.add(await http.MultipartFile.fromPath(
            fileKeyName ?? '', file?.path ?? ''));
      }
      var streamedResponse = await request.send();
      return await http.Response.fromStream(streamedResponse);
    } on SocketException catch (e) {
      return http.Response(
          errorModelToJson(ErrorModel(
              code: 500, msg: "Failed", msgDetail: "No Internet", data: e)),
          500);
    } on HttpException catch (e) {
      return http.Response(
        errorModelToJson(ErrorModel(
            code: 500, msg: "Failed", msgDetail: "Server error", data: e)),
        500,
      );
    } on FormatException catch (e) {
      return http.Response(
          errorModelToJson(ErrorModel(
              code: 500, msg: "Failed", msgDetail: "Format is wrong", data: e)),
          500);
    } catch (e) {
      return http.Response(
          errorModelToJson(ErrorModel(
              code: 500,
              msg: "Failed",
              msgDetail: "Unexpected error",
              data: e)),
          500);
    }
  }

  static Future<http.Response> put(String url,
      {Map<String, dynamic>? body}) async {
    http.Response response = await http.put(
        Uri.parse(ApiConstants.baseUrl + url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body));
    return response;
  }

  static Future<http.Response> delete(String url) async {
    http.Response response = await http.delete(
      Uri.parse(ApiConstants.baseUrl + url),
    );

    return response;
  }

  static Future<http.Response> postWithoutToken({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      debugPrint(url);
      debugPrint(body.toString());
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json",
        },
      );
      return response;
    // ignore: unused_catch_clause
    } on SocketException catch (e) {
      return http.Response(
          errorModelToJson(ErrorModel(
              code: 500, msg: "Failed", msgDetail: "No Internet", data: [])),
          500);
    } on HttpException catch (e) {
      return http.Response(
        errorModelToJson(ErrorModel(
            code: 500, msg: "Failed", msgDetail: "Server error", data: e)),
        500,
      );
    } on FormatException catch (e) {
      return http.Response(
          errorModelToJson(ErrorModel(
              code: 500, msg: "Failed", msgDetail: "Format is wrong", data: e)),
          500);
    } catch (e) {
      return http.Response(
          errorModelToJson(ErrorModel(
              code: 500,
              msg: "Failed",
              msgDetail: "Unexpected error",
              data: e)),
          500);
    }
  }
}
