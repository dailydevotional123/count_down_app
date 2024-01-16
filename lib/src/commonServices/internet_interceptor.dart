import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class InternetInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  InternetInterceptor({required this.requestRetrier});

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    log("Shpuld retry==> ${_shouldRetry(err)}");
    if (_shouldRetry(err)) {
      try {
        log('Retry request');
        return requestRetrier.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        print(e);
        super.onError(err, handler);
        return e;
      }
    }
    print(err);
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('On response callback');
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.unknown &&
        err.error != null &&
        err.error is SocketException;
  }
}

class DioConnectivityRequestRetrier {
  final Dio dio;
  final Connectivity connectivity;

  DioConnectivityRequestRetrier({
    required this.dio,
    required this.connectivity,
  });

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    StreamSubscription? streamSubscription;
    final responseCompleter = Completer<Response>();
    ConnectivityResult result = ConnectivityResult.none;

    streamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) async {
        log(connectivityResult.toString());
        result = connectivityResult;
        if (connectivityResult != ConnectivityResult.none) {
          streamSubscription!.cancel();
        }
      },
    );
    log("=================");
    if (result != ConnectivityResult.none) {
      responseCompleter.complete(
        dio.request(
          requestOptions.path,
          cancelToken: requestOptions.cancelToken,
          data: requestOptions.data,
          onReceiveProgress: requestOptions.onReceiveProgress,
          onSendProgress: requestOptions.onSendProgress,
          queryParameters: requestOptions.queryParameters,
          options: Options(
              headers: requestOptions.headers, method: requestOptions.method),
        ),
      );
    }

    return responseCompleter.future;
  }
}
