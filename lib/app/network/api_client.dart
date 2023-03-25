// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'dart:developer' as developer show log;

enum Request { GET, POST, PUT, DELETE, PATCH }

class ApiClient {
  final Dio _dio = Dio();

  final String _baseUrl = 'http://10.0.2.2:3001';

  Future<Response> request(
    Request request,
    String path, {
    int? id,
    Map<String, dynamic>? data,
  }) async {
    final String url = '$_baseUrl/$path${id?.toString() ?? ''}';
    developer.log('url: $url', name: 'ApiClient');

    switch (request) {
      case Request.GET:
        return await _dio.get(url);
      case Request.POST:
        return await _dio.post(url, data: data);
      case Request.PUT:
        return await _dio.put(url);
      case Request.DELETE:
        return await _dio.delete(url);
      case Request.PATCH:
        return await _dio.patch(url, data: data);
    }
  }
}
