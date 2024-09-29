import 'package:compact_quran/app/data/core/network_failures/network_failures.dart';
import 'package:compact_quran/app/data/core/network_service/network_service.dart';
import 'package:compact_quran/app/data/core/urls.dart';
import 'package:compact_quran/app/data/interfaces/i_quran_repository.dart';
import 'package:compact_quran/app/data/model/surah_list/surah_list.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

class QuranRepository implements IQuranRepository {
  final _networkService = NetworkService.instance;

  @override
  Future<Either<NetworkFailures, List<SurahModel>>> getSurahs() async {
    final result = await _networkService.getHttp(url: Urls.surahList);

    return result.match(
      (l) => left(
        l.when(
          serverError: (message) => NetworkFailures.serverError(message),
          noInternet: (message) => NetworkFailures.noInternet(message),
        ),
      ),
      (r) {
        try {
          final data = r.data as List;

          List<SurahModel> surahs = data
              .map((e) => SurahModel.fromJson(e as Map<String, dynamic>))
              .toList();

          return right(surahs);
        } catch (e) {
          return left(NetworkFailures.serverError(e.toString()));
        }
      },
    );
  }

  @override
  Future<Either<NetworkFailures, SurahModel>> getSurat({
    required int nomorSurat,
  }) async {
    final result = await _networkService.getHttp(
        url: Urls.surahDetail(nomorSurat: nomorSurat));

    return result.match(
      (l) => left(
        l.when(
          serverError: (message) => NetworkFailures.serverError(message),
          noInternet: (message) => NetworkFailures.noInternet(message),
        ),
      ),
      (r) {
        try {
          final surah = SurahModel.fromJson(r.data as Map<String, dynamic>);

          return right(surah);
        } catch (e) {
          return left(NetworkFailures.serverError(e.toString()));
        }
      },
    );
  }
}
