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
    );

Map<String, dynamic> _$$SurahModelImplToJson(_$SurahModelImpl instance) =>
    <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'namaLatin': instance.namaLatin,
      'jumlahAyat': instance.jumlahAyat,
      'tempatTurun': instance.tempatTurun,
      'arti': instance.arti,
    };
