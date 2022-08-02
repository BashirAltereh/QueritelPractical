// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'general_methods.dart';

enum RequestType { post, get, put, delete }

class ApiProvider {
  static final _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<Map<String, String>> _headersWithToken() async {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }


  ///Base method to request APIs
  static dataLoader(BuildContext context, RequestType requestType, String url,
      {Map<String, dynamic>? body,
      bool isFormData = false,
      bool isNeedToken = false,
      headerOp}) async {
    debugPrint(url);
    Response<dynamic>? response;
    if (requestType == RequestType.post || requestType == RequestType.put) {
      try {
        log('body: ${json.encode(body)}');
      } catch (e) {
        debugPrint('error: $e');
      }

      response = await _dioRequest(url, body ?? {},
          isFormData: isFormData,
          requestType: requestType,
          header: (headerOp != null)
              ? headerOp
              : ((isNeedToken) ? await _headersWithToken() : _headers));
    } else {
      response = await _dioGetRequest(url,
          header: (headerOp != null)
              ? headerOp
              : ((isNeedToken) ? await _headersWithToken() : _headers),
          isDelete: requestType == RequestType.delete);
    }

    debugPrint('status code: ${response?.statusCode}');

    if ((response?.statusCode ?? 0) >= 200 &&
        (response?.statusCode ?? 0) < 300) {
      return response.toString();
    } else if (response?.statusCode == 401) {
      debugPrint('No auth ${response?.statusCode}');
      GeneralHelperMethods.showAlertDialog(context,
          title: 'error', content: 'Not authorized');
    } else {
      debugPrint('response: ${response?.data['message']}');

      String msg = response?.data?['message'] ?? 'Something went wrong';
      GeneralHelperMethods.showAlertDialog(context,
          title: 'error', content: msg);

      return null;
    }
  }

  static _dioRequest(String url, Map<String, dynamic> body,
      {Map<String, String>? header,
      bool isFormData = false,
      RequestType requestType = RequestType.post}) async {
    var dio = Dio();
    header ??= _headers;
    debugPrint('headers: ${json.encode(header)}');

    try {
      var formData = FormData.fromMap(body);
      if (isFormData) {
        debugPrint('form data: ${formData.fields}');
      }
      Response response;
      if (requestType == RequestType.put) {
        response = await dio.put(url,
            data: isFormData ? formData : json.encode(body),
            options: Options(headers: header, responseType: ResponseType.json));
      } else {
        response = await dio.post(url,
            data: isFormData ? formData : json.encode(body),
            options: Options(headers: header, responseType: ResponseType.json));
      }
      debugPrint('response: ${response.data}');

      return response;
    } on DioError catch (error) {
      debugPrint('error: ${error.response?.statusCode}');
      debugPrint('error response: ${error.response}');

      if (error.response != null) {
        return error.response;
      } else {
        if (error.type == DioErrorType.connectTimeout ||
            error.type == DioErrorType.sendTimeout ||
            error.type == DioErrorType.receiveTimeout) {}
        debugPrint('error: ${error.error}');
      }
    }
  }

  static _dioGetRequest(String url,
      {required Map<String, String> header, bool isDelete = false}) async {
    var dio = Dio(BaseOptions(connectTimeout: 30000));
    debugPrint('headers: ${json.encode(header)}');

    try {
      Response response;
      if (isDelete) {
        response = await dio.delete(url,
            options: Options(headers: header, responseType: ResponseType.json));
      } else {
        response = await dio.get(url,
            options: Options(headers: header, responseType: ResponseType.json));
      }
      debugPrint('response: ${response.data}');

      return response;
    } on DioError catch (error) {
      debugPrint('error request:-- $error');
      debugPrint('error response: ${error.response}');

      if (error.response != null) {
        return error.response;
      } else {
        if (error.type == DioErrorType.connectTimeout ||
            error.type == DioErrorType.sendTimeout ||
            error.type == DioErrorType.receiveTimeout) {}
        debugPrint('request error: ${error.error}');
      }
    }
  }
}
