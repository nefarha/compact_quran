import 'package:compact_quran/app/data/core/network_failures/network_failures.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart' as getx;

class NetworkService extends getx.GetxController {
  late Dio _dio;
  final _connectivity = getx.Rx(ConnectivityResult.none);

  Future<Either<NetworkFailures, Response>> getHttp(
      {required String url}) async {
    try {
      if (_connectivity.value == ConnectivityResult.none) {
        return left(NetworkFailures.noInternet('No internet connection'));
      }

      final result = await _dio.get(url);
      return right(result);
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

  _getConnectivity() async {
    _connectivity.value = await _connectivity.value;
  }

  @override
  void onInit() async {
    _setDioClient();
    await _getConnectivity();
    super.onInit();
  }
}
