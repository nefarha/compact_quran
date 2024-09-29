import 'package:freezed_annotation/freezed_annotation.dart';

part 'surah_list.freezed.dart';
part 'surah_list.g.dart';

@freezed
class SurahModel with _$SurahModel {
  const factory SurahModel({
    required int nomor,
    required String nama,
    required String namaLatin,
    required int jumlahAyat,
    required String tempatTurun,
    required String arti,
  }) = _SurahModel;

  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);
}
