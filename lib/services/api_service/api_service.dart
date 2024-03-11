import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:resono/services/apiConstants/api_const.dart';



class ApiService {
  late Dio _dio;

  ApiService() {
    BaseOptions options = BaseOptions(baseUrl: ApiConstant.BASE_URL,receiveTimeout: Duration(seconds: 5), connectTimeout: Duration(seconds: 5),);

    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
    try {
      // options.headers["Authorization"] = "Bearer " + Pref.getValue(KeyWord.USER_TOKEN).toString();
    } catch (e) {
      log("Authorization header error = $e");
    }

    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger());



  }

  Future<dynamic> get(
      String endpoint) async {

    var response;
    try{
      response = await _dio.get(endpoint);
      return response;
    }on DioError catch(e){

      Get.dialog(
        AlertDialog(
          title:  Text('${e.response?.data['message']??"Timeout"}'),
          content:  Text("${e.response?.data['error']??'Server Request Timeout'}"),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () => Get.back(),
            ),
          ],
        ),
      );

    }

  }

  Future<dynamic> put(
      String endpoint,
      Map<String, dynamic> params,{
        Function()? beforeSend,
        required Function(dynamic data) onSuccess,
        required Function(dynamic error) onError,
      }) async {
    await _dio.put(endpoint,data: params).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }


  Future<dynamic> post(
      String endpoint,
      dynamic params, {
        Function()? beforeSend,
        required Function(dynamic data) onSuccess,
        required Function(dynamic error) onError,
      }) async {
    var response;
    try{
      response = await _dio.post(endpoint, data: params);
      onSuccess(response.data);
    }on DioError catch(e){
      onError(e);
      log("check response Repo api service = ${e}");
      log("check response Repo api service = ${e.response?.statusCode}");
      log("check response Repo api service = ${e.message}");
      Get.dialog(
        AlertDialog(
          title:  Text('${e.response?.data['message']??"Timeout"}'),
          content:  Text("${e.response?.data['error']??'Server Request Timeout'}"),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () => Get.back(),
            ),
          ],
        ),
      );

      log("check response Repo api service = ${e.response?.data['error']}");

    }

  }

  String _handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectionTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.unknown:
          errorDescription = "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        // case DioErrorType.response:
        //   errorDescription = "Received invalid status code: ${dioError.response!.statusCode}";
        //   break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
}
