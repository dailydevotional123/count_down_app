import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import '../constants/api_constants.dart';
import '../constants/hive_constants.dart';
import '../helpers/snak_bar_widget.dart';
import '../utils/log_utils.dart';
import 'hive_local_storage.dart';
import 'internet_interceptor.dart';
import 'internet_service.dart';

class DioServices {
  static final DioServices _dioServices = DioServices._internal();

  factory DioServices() {
    return _dioServices;
  }

  DioServices._internal() {
    dio = Dio(BaseOptions(
        baseUrl: Apis.baseUrl, connectTimeout: Duration(milliseconds: 6000)));
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: print,
      retries: 3,
    ));

    InternetInterceptor(
      requestRetrier: DioConnectivityRequestRetrier(
        dio: dio,
        connectivity: Connectivity(),
      ),
    );
  }

  late Dio dio;
  var token = "195|5PxDxxPjHQ8GwVGUYhSKCAR1jNYWHYqPHr2H5pqq";

  Future<Response?> post(String endPoint,
      {dynamic body,
      bool addAuthHeader = true,
      required bool isCheckConnectivity}) async {
    String userToken = await HiveLocalStorage.readHiveValue<String>(
          boxName: HiveConstants.userTokenBox,
          key: HiveConstants.userTokenKey,
        ) ??
        '';
    dp(msg: "user token", arg: userToken.toString());
    bool check = await InternetService.checkConnectivity();
    if (check) {
      try {
        var headers = {
          "Accept": "application/json",
          'Authorization': 'Bearer $userToken',
          // if (addAuthHeader) "Authorization": token
          //  "Bearer ${Provider.of<UserModelProvider>(RoutesUtils.cNavigatorState.currentState!.context, listen: false).userModel.token}"
        };
        log("Start ===========================");
        //log(headers.toString());
        log("${dio.options.baseUrl}$endPoint ");
        var response = await dio.post(endPoint,
            data: body, options: Options(headers: headers));
        log(response.toString());
        log("End ===========================");
        return response;
      } on SocketException catch (e) {
        log('Timeout');
        // showErrorSnackBarMessage(
        //   message: "No internet connection",
        // );
        // Utils.showToast('No internet connection');
        throw ('No internet');
      } on DioException catch (e) {
        bool noInternet = e.error is SocketException;
        log("No internet==>$noInternet");
        log(e.toString());
        if (!noInternet && e.response!.statusCode == 401) {
          log(e.toString());
          // GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context)
          //     .go(LoginScreen.route);

          throw ('User not authorised. Please login again');
        }
        if (noInternet) {
          log('Timeout');
          showErrorSnackBarMessage(message: "No Internet Connection");
          //throw ('No internet connection');
        }
        // if (e.response?.data != null) {
        //   log(e.response!.data.toString());
        //   throw (e.response!.data);
        // }
        return e.response!;
      }
    } else {
      if (isCheckConnectivity == true) {
        // AwesomeDialog(
        //   context: RoutesUtils.cNavigatorState.currentState!.context,
        //   dialogType: DialogType.warning,
        //   animType: AnimType.topSlide,
        //   title: 'No Internet Connection',
        //   desc: "Please connect to internet!",
        //   descTextStyle:
        //       Theme.of(RoutesUtils.cNavigatorState.currentState!.context)
        //           .textTheme
        //           .titleMedium!
        //           .copyWith(fontSize: 14),
        //
        //   // btnCancelOnPress: () {},
        //   btnOkColor: AppColors.lightBlue,
        //
        //   btnOkOnPress: () {
        //     // Navigator.pop(RoutesUtils.cNavigatorState.currentState!.context);
        //   },
        // )..show();
      }
    }
  }

  Future<Response?> get(String endPoint,
      {dynamic body,
      bool addAuthHeader = true,
      required bool isCheckConnectivity}) async {
    String userToken = await HiveLocalStorage.readHiveValue<String>(
          boxName: HiveConstants.userTokenBox,
          key: HiveConstants.userTokenKey,
        ) ??
        '';
    bool check = await InternetService.checkConnectivity();
    if (check) {
      try {
        var headers = {
          "Accept": "application/json",
          'Authorization': 'Bearer $userToken',
          // if (addAuthHeader) "Authorization": token
          //  "Bearer ${Provider.of<UserModelProvider>(RoutesUtils.cNavigatorState.currentState!.context, listen: false).userModel.token}"
        };
        log("Start ===========================");
        //log(headers.toString());
        log("${dio.options.baseUrl}$endPoint ");
        var response = await dio.get(endPoint,
            data: body, options: Options(headers: headers));
        log(response.toString());
        log("End ===========================");
        return response;
      } on SocketException catch (e) {
        log('Timeout');
        showErrorSnackBarMessage(
          message: "No internet connection",
        );
        // Utils.showToast('No internet connection');
        throw ('No internet');
      } on DioError catch (e) {
        bool noInternet = e.error is SocketException;
        log("No internet==>$noInternet");
        log(e.toString());
        if (!noInternet && e.response!.statusCode == 401) {
          log(e.toString());
          // GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context)
          //     .go(SelectAccountTypeScreen.route);

          //throw ('User not authorised. Please login again');
        }
        if (noInternet) {
          log('Timeout');
          throw ('No internet connection');
        }
        if (e.response?.data != null) {
          log(e.response!.data.toString());
          throw (e.response!.data);
        }
        return e.response!;
      }
    } else {
      if (isCheckConnectivity == true) {
        // AwesomeDialog(
        //   context: RoutesUtils.cNavigatorState.currentState!.context,
        //   dialogType: DialogType.warning,
        //   animType: AnimType.topSlide,
        //   title: 'No Internet Connection',
        //   desc: "Please connect to internet!",
        //   descTextStyle:
        //       Theme.of(RoutesUtils.cNavigatorState.currentState!.context)
        //           .textTheme
        //           .titleMedium!
        //           .copyWith(fontSize: 14),
        //
        //   // btnCancelOnPress: () {},
        //   btnOkColor: AppColors.lightBlue,
        //
        //   btnOkOnPress: () {
        //     // Navigator.pop(RoutesUtils.cNavigatorState.currentState!.context);
        //   },
        // )..show();
      }
    }
  }

  Future<Response?> getWithoutToken(String endPoint,
      {dynamic body,
      bool addAuthHeader = true,
      required bool isCheckConnectivity}) async {
    bool check = await InternetService.checkConnectivity();
    if (check) {
      try {
        var headers = {
          "Accept": "application/json",
          //'Authorization': 'Bearer $userToken',
          // if (addAuthHeader) "Authorization": token
          //  "Bearer ${Provider.of<UserModelProvider>(RoutesUtils.cNavigatorState.currentState!.context, listen: false).userModel.token}"
        };
        log("Start ===========================");
        //log(headers.toString());
        log("${dio.options.baseUrl}$endPoint ");
        var response = await dio.get(endPoint,
            data: body, options: Options(headers: headers));
        log(response.toString());
        log("End ===========================");
        return response;
      } on DioException catch (e) {
        return e.response!;
      }
    } else {
      if (isCheckConnectivity == true) {
        // AwesomeDialog(
        //   context: RoutesUtils.cNavigatorState.currentState!.context,
        //   dialogType: DialogType.warning,
        //   animType: AnimType.topSlide,
        //   title: 'No Internet Connection',
        //   desc: "Please connect to internet!",
        //   descTextStyle:
        //       Theme.of(RoutesUtils.cNavigatorState.currentState!.context)
        //           .textTheme
        //           .titleMedium!
        //           .copyWith(fontSize: 14),
        //
        //   // btnCancelOnPress: () {},
        //   btnOkColor: AppColors.lightBlue,
        //
        //   btnOkOnPress: () {
        //     // Navigator.pop(RoutesUtils.cNavigatorState.currentState!.context);
        //   },
        // )..show();
      }
    }
  }

  Future<Response?> delete(String endPoint,
      {dynamic body, bool addAuthHeader = true}) async {
    String userToken = await HiveLocalStorage.readHiveValue<String>(
          boxName: HiveConstants.userTokenBox,
          key: HiveConstants.userTokenKey,
        ) ??
        '';
    try {
      var headers = {
        "Accept": "application/json",
        'Authorization': 'Bearer $userToken',
        // if (addAuthHeader) "Authorization": token
        //  "Bearer ${Provider.of<UserModelProvider>(RoutesUtils.cNavigatorState.currentState!.context, listen: false).userModel.token}"
      };
      log("Start ===========================");
      //log(headers.toString());
      log("${dio.options.baseUrl}$endPoint ");
      var response = await dio.delete(endPoint,
          data: body, options: Options(headers: headers));
      log(response.toString());
      log("End ===========================");
      return response;
    } on SocketException catch (e) {
      log('Timeout');
      showErrorSnackBarMessage(
        message: "No internet connection",
      );
      // Utils.showToast('No internet connection');
      throw ('No internet');
    } on DioException catch (e) {
      return e.response;
    }
  }
}
