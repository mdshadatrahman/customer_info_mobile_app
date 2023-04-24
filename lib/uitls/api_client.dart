import 'dart:convert';
import 'dart:io';
import 'package:customer_info/uitls/coloredlog.dart';
import 'package:customer_info/uitls/url.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer show log;

import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = URL.baseUrl;

class ApiClient {
  static final Dio dio = Dio();
  static final ApiClient _instance = ApiClient._internal();
  static ApiClient get instance => _instance;

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal();

  static init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ColoredLog.yellow('Token: ${prefs.getString("token")}', 'Api');
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(milliseconds: 60000);
    dio.options.receiveTimeout = const Duration(milliseconds: 60000);
    dio.options.receiveDataWhenStatusError = true;
    dio.options.headers = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Token ${prefs.getString("token")}",
      // if (prefs.getString("token") != null) "token": "${prefs.getString("token")}",
    };
  }

  Future get({required String url, Map<String, dynamic>? params}) async {
    ColoredLog.blue('url:  $url', 'Api');
    ColoredLog.blue('params: $params', 'Api');
    try {
      final response = await dio.get(url, queryParameters: params);
      ColoredLog.green('response: ${response.data}', 'Api');
      return response.data;
    } catch (e) {
      ColoredLog.red('error: $e', 'Api');
      return null;
    }
  }

  Future post({required String url, Map<String, dynamic>? body}) async {
    ColoredLog.blue('url:  $url', 'Api');
    ColoredLog.blue('body: $body', 'Api');
    try {
      final response = await dio.post(url, data: body);
      ColoredLog.green('response: ${response.data}', 'Api');
      return response.data;
    } catch (e) {
      ColoredLog.red('error: $e', 'Api');
    }

    Future patch({required String url, Map<String, dynamic>? body}) async {
      ColoredLog.blue('url:  $url', 'Api');
      ColoredLog.blue('body: $body', 'Api');
      try {
        final response = await dio.patch(url, data: body);
        ColoredLog.green('response: ${response.data}', 'Api');
        return response.data;
      } catch (e) {
        ColoredLog.red('error: $e', 'Api');
        return null;
      }
    }

    Future put({required String url, Map<String, dynamic>? body}) async {
      ColoredLog.blue('url:  $url', 'Api');
      ColoredLog.blue('body: $body', 'Api');
      try {
        final response = await dio.put(url, data: body);
        ColoredLog.green('response: ${response.data}', 'Api');
        return response.data;
      } catch (e) {
        ColoredLog.red('error: $e', 'Api');
        return null;
      }
    }

    Future delete({required String url, Map<String, dynamic>? body}) async {
      ColoredLog.blue('url:  $url', 'Api');
      ColoredLog.blue('body: $body', 'Api');
      try {
        final response = await dio.delete(url, data: body);
        ColoredLog.green('response: ${response.data}', 'Api');
        return response.data;
      } catch (e) {
        ColoredLog.red('error: $e', 'Api');
        return null;
      }
    }

    Future requestWithFile({
      required String url,
      Map<String, dynamic>? body,
      required List<MapEntry<String, File>> files,
    }) async {
      try {
        ColoredLog.blue('url:  $url', 'Api');
        ColoredLog.blue('body: $body', 'Api');
        ColoredLog.blue('files: $files', 'Api');
        FormData formData = FormData.fromMap(body ?? {});
        for (var fileEntry in files) {
          formData.files.add(
            MapEntry(
              fileEntry.key,
              MultipartFile.fromFileSync(fileEntry.value.path, filename: fileEntry.value.path.split("/").last),
            ),
          );
        }
        ColoredLog.blue('body: ${formData.files}', 'Api');

        await Future.delayed(const Duration(seconds: 1));
        ColoredLog.green('body: ${formData.files.length}', 'Api');
        ColoredLog.green('body: ${files.length}', 'Api');

        final response = await dio.post(url, data: formData);
        return response.data;
      } catch (e) {
        ColoredLog.red('error: $e', 'Api');
        return null;
      }
    }
  }
}
