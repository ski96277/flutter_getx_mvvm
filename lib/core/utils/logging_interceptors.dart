import 'package:dio/dio.dart';

import 'dev_tools/dev_tools.dart';

class LoggingInterceptor extends Interceptor {
  final int _maxCharactersPerLine = 200;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    devPrint(tag: "onRequest", "--> ${options.method} ${options.path}");
    devPrint(tag: "onRequest", "Content type: ${options.contentType}");
    devPrint(tag: "onRequest", "<-- END HTTP");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    devPrint(tag: "onResponse", "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations = (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) endingIndex = responseAsString.length;
        devPrint(tag: "onResponse", responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      devPrint(tag: "onResponse", response.data);
    }
    devPrint(tag: "onResponse", "<-- END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    devPrint(tag: "onError", "<-- Error -->");
    devPrint(tag: "onError", err.type.name);
    return super.onError(err, handler);
  }
}
