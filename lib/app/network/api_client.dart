import 'dart:convert';
import 'package:dio/dio.dart';

import 'api_endpoints.dart';

class ApiClient {
  Dio? dio;
  String token = "";

  ApiClient() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  Future<Response?> getAPI(
      String url,
      retry, {
        Map<String, dynamic>? mQueryParameters,
        Map<String, dynamic>? headers,
        bool isHeaderRequired = true,
        bool needLoader = true,
        bool hideKeyboard = true,
      }) async {
    // AppHelper().showLoader(needToShow: needLoader);

    try {

      Response? response = await dio?.get(
        url,
        queryParameters: mQueryParameters,
      );

      return response;
    } on DioException catch (e) {
      return exceptionHandler(e, retry, isHeaderRequired);
    }
  }

  Future<Response?> postAPI(
      String url,
      data,
      retry, {
        Map<String, dynamic>? headers,
        bool isHeaderRequired = true,
        Map<String, dynamic>? mQueryParameters,
        needToShowLoader = true,
        isFormData = true,
        needToHideLoader = true,
        needToShowLogoutMsg = true,
        isJsonContentType = false,
        bool hideKeyboard = true,
      }) async {
    // AppHelper().showLoader(needToShow: needToShowLoader);

    try {

      if (isJsonContentType != null) {
        dio?.options.headers["Content-Type"] = "application/json";
      }
      FormData formData = FormData.fromMap(data);
      Response? response = await dio?.post(
        url,
        data: isFormData ? formData : jsonEncode(data),
        queryParameters: mQueryParameters,
      );
      if (needToHideLoader) {
        // AppHelper().hideLoader();
      }
      print("loginClickHandler");
      return response;
    } on DioException catch (e) {
      return exceptionHandler(e, retry, isHeaderRequired,
          needToShowLogoutMsg: needToShowLogoutMsg);
    }
  }

  Future<Response?> putAPI(
      String url,
      data,
      retry, {
        Map<String, dynamic>? headers,
        bool isHeaderRequired = true,
        Map<String, dynamic>? mQueryParameters,
        bool needLoader = true,
        isFormData = false,
        int? primaryDeskId,
        isJsonContentType = false,
      }) async {
    // AppHelper().showLoader(needToShow: needLoader);
    try {

      FormData formData = FormData.fromMap(data);
      Response? response = await dio?.put(
        url,
        data: isFormData ? formData : jsonEncode(data),
        options: Options(
            contentType: isJsonContentType
                ? Headers.jsonContentType
                : Headers.formUrlEncodedContentType),
        queryParameters: mQueryParameters,
      );
      if (needLoader) {
        // AppHelper().hideLoader();
      }
      return response;
    } on DioException catch (e) {
      return exceptionHandler(e, retry, isHeaderRequired);
    }
  }

  Future<Response?> deleteAPI(
      // BuildContext context,
      String url,
      retry, {
        Map<String, dynamic>? mQueryParameters,
        Map<String, dynamic>? headers,
        bool isHeaderRequired = true,
      }) async {

    try {

      Response? response = await dio?.delete(
        url,
        queryParameters: mQueryParameters,
      );
      // AppHelper().hideLoader();
      return response;
    } on DioException catch (e) {
      return exceptionHandler(e, retry, isHeaderRequired);
    }
  }

  exceptionHandler(DioException e, retry, bool isHeaderRequired,
      {needToShowLogoutMsg}) {
    printCatch(e, retry);
    // AppHelper().hideLoader();
    if (e.error.toString().contains("Connection failed")) {

      return e.response;
    } else if (e.response?.statusCode == 403) {
      return e.response;
    } else if (e.response?.statusCode == 202) {
      return e.response;
    } else if (e.response?.statusCode == 203) {
      return e.response;
    } else if (e.response?.statusCode == 308) {
      return e.response;
    } else if (e.response?.statusCode == 424) {
      return e.response;
    } else if (e.response?.statusCode == 500) {
      return e.response;
    } else {
      if (needToShowLogoutMsg ?? false) {
        printCatch(e, retry);
      }
      return e.response;
    }
  }

  Future<void> printCatch(DioException e, retry) async {
    if (e.response?.statusCode == 401) {
      // await AuthHelper().refreshTokenUsingApiMethod();

    } else {

    }
  }
}
