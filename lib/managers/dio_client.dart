// ignore_for_file: prefer_const_constructors
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../main.dart';
import '../utils/api_constants.dart';
import '../utils/shared_pref_instance.dart';
import '../views/auth/login_screen.dart';

class DioClient {
  DioClient._privateConstructor();
  static final DioClient instance = DioClient._privateConstructor();
  final Dio _dio = Dio()
    ..options.baseUrl = APIConstants.baseUrl
    ..options.connectTimeout = Duration(seconds: 30)
    ..options.receiveTimeout = Duration(seconds: 30)
    ..httpClientAdapter
    ..options.headers = {
      'Accept': 'application/json',
      'userToken': "64789b1069ec8420fa813e4a5156bbb8be0de5a86b33091b",
    };
  String? token;

  void setToken(String token) {
    this.token = token;
    debugPrint('token has been set to $token');
    _dio.options.headers = {
      'userToken': token,
      'Accept': 'application/json'
    };
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      log("call get api : ${APIConstants.baseUrl}$uri");
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(
          msg: "No internet Please connect to internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        // ignore: null_argument_to_non_null_type
        return Future.value(null);
      }

      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
       log("response is $response");

      return response;
    } on DioError catch (e) {
      print(e.response?.statusCode);
      if (e.response?.statusCode == 401) {
        SharedPreference.instance.setData(key: "token");
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
      }
      // throw FormatException("Unable to process the data");
      return e.response!;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      log("call post api : ${APIConstants.baseUrl}$uri");
      log("body: $data");
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(
          msg: "No internet Please connect to internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        // ignore: null_argument_to_non_null_type
        return Future.value(null);
      }
      dynamic response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      log("Response from post Api: $response");
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.response?.statusCode);
      }
      if (e.response?.statusCode == 401) {
        log('signing out');
        SharedPreference.instance.setData(key: "token");
        navigatorKey.currentState!
            .pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
      }
      return e.response!;
    } on FormatException catch (e) {
      //print('Formet Exception : $e');
      throw FormatException("Unable to process the data");
    } catch (e) {
      print('Formet Exception : $e');

      rethrow;
    }
  }

  Future<Response?> postWithOutToken(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Dio dio = Dio()
        ..options.baseUrl = APIConstants.baseUrl
        ..options.connectTimeout = Duration(seconds: 30)
        ..options.receiveTimeout = Duration(seconds: 30);
      //  var connectivity= await (Connectivity().checkConnectivity());
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(
          msg: "No internet Please connect to internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        // ignore: null_argument_to_non_null_type
        return Future.value(
          Response(requestOptions: RequestOptions(path: ''), statusCode: 100),
        );
      }

      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
