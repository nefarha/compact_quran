import 'package:compact_quran/app/data/core/network_failures/network_failures.dart';
import 'package:compact_quran/app/data/model/base_model/base_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart' as getx;

class NetworkService extends getx.GetxController {
  static NetworkService get instance => getx.Get.find();
  late Dio _dio;
  Future<Either<NetworkFailures, BaseModel>> getHttp(
      {required String url}) async {
    try {
      final result = await _dio.get(url);

      return right(
        BaseModel.fromJson(
          result.data,
        ),
      );
    } catch (e) {
      return left(
        NetworkFailures.serverError(
          e.toString(),
        ),
      );
    }
  }

  _setDioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://equran.id/api/v2',
    ));
  }

  @override
  void onInit() async {
    _setDioClient();
    super.onInit();
  }
}
