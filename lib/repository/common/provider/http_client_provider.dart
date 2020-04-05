import 'package:dio/dio.dart';

class HttpClientProvider {
  Dio _dio;

  String _endPoint;

  HttpClientProvider._internal();

  static final HttpClientProvider _httpClientProvider =
      HttpClientProvider._internal();

  factory HttpClientProvider({String endPoint}) {
    _httpClientProvider._endPoint = endPoint;
    return _httpClientProvider;
  }

  Future<Dio> get client async {
    if (_dio != null) {
      return _dio;
    }

    BaseOptions baseOptions = BaseOptions(
      baseUrl: _endPoint,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    _dio = Dio(baseOptions);
    return _dio;
  }
}
