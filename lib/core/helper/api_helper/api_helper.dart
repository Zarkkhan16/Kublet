import 'package:dio/dio.dart';

class ApiHelper {
  final Dio _dio;

  ApiHelper(this._dio);

  Future<T> get<T>(
    String path,
    T Function(dynamic) fromJson, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    // try {
      print('request');
      print(path);
      print(headers);

      final response = await _dio.get(
        path,
        queryParameters: params,
        options: Options(headers: headers),
      );
      print('response');
      print(response);

      if (response.statusCode == 200) {
        final data = fromJson(response.data);
        return data;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          error: 'API Error: ${response.statusCode}',
          response: response,
        );
      }
    // } catch (error) {
    //   throw DioException(
    //     requestOptions: RequestOptions(path: path),
    //     error: 'Failed to fetch data: $error',
    //   );
    // }
  }
}
