import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_host.dart';
import 'endpoint.dart';

typedef Failure = void Function(DioException error);
typedef Success = void Function(dynamic response);

class ApiProvider {
  Dio _dio = Dio();

  static final ApiProvider instance = ApiProvider._();

  ApiProvider._({Dio? dio}) {
    final baseOptions = BaseOptions(baseUrl: ApiHost.baseURL);

    _dio = dio ?? Dio(baseOptions);

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger());
    }
  }

  Future<void> request({
    required Endpoint endpoint,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) async {
    _dio.options.queryParameters.addAll(ApiHost.defaultQueryParams);
    final contentTypeValue = endpoint.contentType ?? ContentType.json.value;
    final requestOptions = Options(
      method: endpoint.method,
      contentType: contentTypeValue,
    );

    try {
      final response = await _dio.request(
        endpoint.path,
        data: endpoint.data,
        options: requestOptions,
        queryParameters: endpoint.queryParameters,
      );
      success?.call(response.data);
    } on DioException catch (error) {
      failure?.call(error);
    } finally {
      onComplete?.call();
    }
  }
}
