import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../app_init.dart';
import '../constants.dart';
import '../locator.dart';
import '../models/data_response.dart';
import '../navigation_service.dart';

class ApiProvider {
  final Dio _dio = Dio();
  String token = "";

  ApiProvider({String? jwt}) {
    NavigationService _navigationService = locator<NavigationService>();
    jwt = jwt ?? _navigationService.appRepository.token;
    if (jwt != null) {
      token = jwt;
    } else {
      var tokenPrefString = AppInit.hiveSettingBox
          .get(storageKey + storageTokenSuffix, defaultValue: null);
      // var countryCode = AppInit.hiveSettingBox.get(storageKey + storageCountrySuffix, defaultValue: "ci");
      // var language = translate.currentLanguage;

      if (tokenPrefString != null) {
        token = tokenPrefString;
      }
    }
    if (kDebugMode) {
      print("-----tokenPrefString-----");
      print(token);
    }

    _dio.options = BaseOptions(baseUrl: "");
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: kDebugMode,
        responseHeader: kDebugMode,
        requestHeader: kDebugMode,
        request: kDebugMode,
        requestBody: kDebugMode,
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) {
          // If no token, request token firstly and lock this interceptor
          // to prevent other request enter this interceptor.
          //_dio.interceptors.requestLock.lock();
          // We use a new Dio(to avoid dead lock) instance to request token.
          options.headers["Authorization"] = "Bearer $token";
          options.queryParameters = {
            ...options.queryParameters,
            'lang': "fr",
          };
          handler.next(options);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (error.response != null && error.response?.statusCode == 401 ||
              error.response?.statusCode == 403) {
            /*
              disconnect USER here
             */
            _navigationService.logOut();
            //return dio.request(options.path, options: options);
          } else {
            handler.next(error);
          }
        },
      ),
    );
  }

  Future<DataResponse<List<dynamic>>> getFieldsForm() async {
    try {
      final response =
          await rootBundle.loadString("assets/json/fields_assignment.json");

      final jsonDecode = json.decode(response.toString());

      if (jsonDecode['data'] != null) {
        return DataResponse<List<dynamic>>.fromJson(jsonDecode);
      } else {
        return DataResponse.withError("");
      }
    } catch (error, stacktrace) {
      log("getFieldsForm",
          name: "Exception occured", error: error, stackTrace: stacktrace);
      return DataResponse.withError(error);
    }
  }
}
