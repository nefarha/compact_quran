import 'package:compact_quran/app/data/core/network_failures/network_failures.dart';
import 'package:compact_quran/app/data/model/surah_list/surah_list.dart';
import 'package:fpdart/fpdart.dart';

abstract class IQuranRepository {
  Future<Either<NetworkFailures, List<SurahModel>>> getSurahs();
  Future<Either<NetworkFailures, SurahModel>> getSurat({
    required int nomorSurat,
  });
}
