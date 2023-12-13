import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  Future<dynamic> get({required String url,@required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await Dio().get(url, options: Options(headers: headers));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('ther was an error ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic data,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response =
        await Dio().post(url, data: data, options: Options(headers: headers));
    if (response.statusCode == 200) {
      return response.data;
      
    } else {
      throw Exception(
          'ther was an error ${response.statusCode} and here is the data${response.data}');
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic data,
      @required String? token}) async {
    Map<String, String> header = {};
    header.addAll({'Content-Type': 'application/x-www-form-urlencoded'}); 
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    Response response =
        await Dio().post(url, data: data, options: Options(headers: header));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'ther was an error ${response.statusCode} and here is the data${response.data}');
    }
  }
}
