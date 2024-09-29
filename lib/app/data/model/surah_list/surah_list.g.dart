// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurahModelImpl _$$SurahModelImplFromJson(Map<String, dynamic> json) =>
    _$SurahModelImpl(
      nomor: (json['nomor'] as num).toInt(),
      nama: json['nama'] as String,
      namaLatin: json['namaLatin'] as String,
      jumlahAyat: (json['jumlahAyat'] as num).toInt(),
      tempatTurun: json['tempatTurun'] as String,
      arti: json['arti'] as String,
      ayat: (json['ayat'] as List<dynamic>?)
          ?.map((e) => AyatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SurahModelImplToJson(_$SurahModelImpl instance) =>
    <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'namaLatin': instance.namaLatin,
      'jumlahAyat': instance.jumlahAyat,
      'tempatTurun': instance.tempatTurun,
      'arti': instance.arti,
      'ayat': instance.ayat?.map((e) => e.toJson()).toList(),
    };

_$AyatModelImpl _$$AyatModelImplFromJson(Map<String, dynamic> json) =>
    _$AyatModelImpl(
      nomorAyat: (json['nomorAyat'] as num).toInt(),
      teksArab: json['teksArab'] as String,
      teksLatin: json['teksLatin'] as String,
      teksIndonesia: json['teksIndonesia'] as String,
      audio: Map<String, String>.from(json['audio'] as Map),
    );

Map<String, dynamic> _$$AyatModelImplToJson(_$AyatModelImpl instance) =>
    <String, dynamic>{
      'nomorAyat': instance.nomorAyat,
      'teksArab': instance.teksArab,
      'teksLatin': instance.teksLatin,
      'teksIndonesia': instance.teksIndonesia,
      'audio': instance.audio,
    };
