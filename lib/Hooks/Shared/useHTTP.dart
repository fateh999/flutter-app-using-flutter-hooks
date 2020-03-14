import 'package:demo_app/Config/Constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HTTPHookType {
  ValueNotifier<bool> loading;
  ValueNotifier<bool> error;
  Function initiateReq;
}

HTTPHookType useHTTP() {
  final loading = useState(false);
  final error = useState(false);

  initiateReq(
    String method,
    String endPoint,
    Map data,
    void Function(dynamic responseData) successCallback,
    void Function(Error error) errorCallback,
  ) async {
    switch (method) {
      case 'GET':
        try {
          loading.value = true;
          error.value = false;
          final responseData = await Dio().get(API_URL + endPoint);
          print(
              '$method ==> $endPoint => ${responseData.statusCode} => $responseData');
          successCallback(responseData);
          loading.value = false;
          error.value = false;
        } on DioError catch (e) {
          loading.value = false;
          error.value = true;
          // The request was made and the server responded with a status code
          // that falls out of the range of 2xx and is also not 304.
          if (e.response != null) {
            print(e.response.data);
            print(e.response.headers);
            print(e.response.request);
          } else {
            // Something happened in setting up or sending the request that triggered an Error
            print(e.request);
            print(e.message);
          }
        }
        break;
      case 'POST':
        try {
          loading.value = true;
          error.value = false;
          final responseData = await Dio().post(API_URL + endPoint, data: data);
          print(
              '$method ==> $endPoint => ${responseData.statusCode} => $responseData');
          successCallback(responseData);
          loading.value = false;
          error.value = false;
        } on DioError catch (e) {
          loading.value = false;
          error.value = true;
          // The request was made and the server responded with a status code
          // that falls out of the range of 2xx and is also not 304.
          if (e.response != null) {
            print(
                '$method ==> $endPoint => ${e.response.statusCode} => ${e.response}');
            print(e.response.data);
            print(e.response.headers);
            print(e.response.request);
          } else {
            // Something happened in setting up or sending the request that triggered an Error
            print(e.request);
            print(e.message);
          }
        }
        break;
    }
  }

  HTTPHookType httpObj = {
    "loading": loading,
    "error": error,
    "initiateReq": initiateReq
  } as HTTPHookType;

  return httpObj;
}
