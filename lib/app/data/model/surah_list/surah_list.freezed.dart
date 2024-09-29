// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'surah_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SurahModel _$SurahModelFromJson(Map<String, dynamic> json) {
  return _SurahModel.fromJson(json);
}

/// @nodoc
mixin _$SurahModel {
  int get nomor => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  String get namaLatin => throw _privateConstructorUsedError;
  int get jumlahAyat => throw _privateConstructorUsedError;
  String get tempatTurun => throw _privateConstructorUsedError;
  String get arti => throw _privateConstructorUsedError;
  List<AyatModel>? get ayat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurahModelCopyWith<SurahModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurahModelCopyWith<$Res> {
  factory $SurahModelCopyWith(
          SurahModel value, $Res Function(SurahModel) then) =
      _$SurahModelCopyWithImpl<$Res, SurahModel>;
  @useResult
  $Res call(
      {int nomor,
      String nama,
      String namaLatin,
      int jumlahAyat,
      String tempatTurun,
      String arti,
      List<AyatModel>? ayat});
}

/// @nodoc
class _$SurahModelCopyWithImpl<$Res, $Val extends SurahModel>
    implements $SurahModelCopyWith<$Res> {
  _$SurahModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomor = null,
    Object? nama = null,
    Object? namaLatin = null,
    Object? jumlahAyat = null,
    Object? tempatTurun = null,
    Object? arti = null,
    Object? ayat = freezed,
  }) {
    return _then(_value.copyWith(
      nomor: null == nomor
          ? _value.nomor
          : nomor // ignore: cast_nullable_to_non_nullable
              as int,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      namaLatin: null == namaLatin
          ? _value.namaLatin
          : namaLatin // ignore: cast_nullable_to_non_nullable
              as String,
      jumlahAyat: null == jumlahAyat
          ? _value.jumlahAyat
          : jumlahAyat // ignore: cast_nullable_to_non_nullable
              as int,
      tempatTurun: null == tempatTurun
          ? _value.tempatTurun
          : tempatTurun // ignore: cast_nullable_to_non_nullable
              as String,
      arti: null == arti
          ? _value.arti
          : arti // ignore: cast_nullable_to_non_nullable
              as String,
      ayat: freezed == ayat
          ? _value.ayat
          : ayat // ignore: cast_nullable_to_non_nullable
              as List<AyatModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SurahModelImplCopyWith<$Res>
    implements $SurahModelCopyWith<$Res> {
  factory _$$SurahModelImplCopyWith(
          _$SurahModelImpl value, $Res Function(_$SurahModelImpl) then) =
      __$$SurahModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int nomor,
      String nama,
      String namaLatin,
      int jumlahAyat,
      String tempatTurun,
      String arti,
      List<AyatModel>? ayat});
}

/// @nodoc
class __$$SurahModelImplCopyWithImpl<$Res>
    extends _$SurahModelCopyWithImpl<$Res, _$SurahModelImpl>
    implements _$$SurahModelImplCopyWith<$Res> {
  __$$SurahModelImplCopyWithImpl(
      _$SurahModelImpl _value, $Res Function(_$SurahModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomor = null,
    Object? nama = null,
    Object? namaLatin = null,
    Object? jumlahAyat = null,
    Object? tempatTurun = null,
    Object? arti = null,
    Object? ayat = freezed,
  }) {
    return _then(_$SurahModelImpl(
      nomor: null == nomor
          ? _value.nomor
          : nomor // ignore: cast_nullable_to_non_nullable
              as int,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      namaLatin: null == namaLatin
          ? _value.namaLatin
          : namaLatin // ignore: cast_nullable_to_non_nullable
              as String,
      jumlahAyat: null == jumlahAyat
          ? _value.jumlahAyat
          : jumlahAyat // ignore: cast_nullable_to_non_nullable
              as int,
      tempatTurun: null == tempatTurun
          ? _value.tempatTurun
          : tempatTurun // ignore: cast_nullable_to_non_nullable
              as String,
      arti: null == arti
          ? _value.arti
          : arti // ignore: cast_nullable_to_non_nullable
              as String,
      ayat: freezed == ayat
          ? _value._ayat
          : ayat // ignore: cast_nullable_to_non_nullable
              as List<AyatModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SurahModelImpl implements _SurahModel {
  const _$SurahModelImpl(
      {required this.nomor,
      required this.nama,
      required this.namaLatin,
      required this.jumlahAyat,
      required this.tempatTurun,
      required this.arti,
      final List<AyatModel>? ayat})
      : _ayat = ayat;

  factory _$SurahModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurahModelImplFromJson(json);

  @override
  final int nomor;
  @override
  final String nama;
  @override
  final String namaLatin;
  @override
  final int jumlahAyat;
  @override
  final String tempatTurun;
  @override
  final String arti;
  final List<AyatModel>? _ayat;
  @override
  List<AyatModel>? get ayat {
    final value = _ayat;
    if (value == null) return null;
    if (_ayat is EqualUnmodifiableListView) return _ayat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SurahModel(nomor: $nomor, nama: $nama, namaLatin: $namaLatin, jumlahAyat: $jumlahAyat, tempatTurun: $tempatTurun, arti: $arti, ayat: $ayat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurahModelImpl &&
            (identical(other.nomor, nomor) || other.nomor == nomor) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.namaLatin, namaLatin) ||
                other.namaLatin == namaLatin) &&
            (identical(other.jumlahAyat, jumlahAyat) ||
                other.jumlahAyat == jumlahAyat) &&
            (identical(other.tempatTurun, tempatTurun) ||
                other.tempatTurun == tempatTurun) &&
            (identical(other.arti, arti) || other.arti == arti) &&
            const DeepCollectionEquality().equals(other._ayat, _ayat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nomor,
      nama,
      namaLatin,
      jumlahAyat,
      tempatTurun,
      arti,
      const DeepCollectionEquality().hash(_ayat));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SurahModelImplCopyWith<_$SurahModelImpl> get copyWith =>
      __$$SurahModelImplCopyWithImpl<_$SurahModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurahModelImplToJson(
      this,
    );
  }
}

abstract class _SurahModel implements SurahModel {
  const factory _SurahModel(
      {required final int nomor,
      required final String nama,
      required final String namaLatin,
      required final int jumlahAyat,
      required final String tempatTurun,
      required final String arti,
      final List<AyatModel>? ayat}) = _$SurahModelImpl;

  factory _SurahModel.fromJson(Map<String, dynamic> json) =
      _$SurahModelImpl.fromJson;

  @override
  int get nomor;
  @override
  String get nama;
  @override
  String get namaLatin;
  @override
  int get jumlahAyat;
  @override
  String get tempatTurun;
  @override
  String get arti;
  @override
  List<AyatModel>? get ayat;
  @override
  @JsonKey(ignore: true)
  _$$SurahModelImplCopyWith<_$SurahModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AyatModel _$AyatModelFromJson(Map<String, dynamic> json) {
  return _AyatModel.fromJson(json);
}

/// @nodoc
mixin _$AyatModel {
  int get nomorAyat => throw _privateConstructorUsedError;
  String get teksArab => throw _privateConstructorUsedError;
  String get teksLatin => throw _privateConstructorUsedError;
  String get teksIndonesia => throw _privateConstructorUsedError;
  Map<String, String> get audio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AyatModelCopyWith<AyatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AyatModelCopyWith<$Res> {
  factory $AyatModelCopyWith(AyatModel value, $Res Function(AyatModel) then) =
      _$AyatModelCopyWithImpl<$Res, AyatModel>;
  @useResult
  $Res call(
      {int nomorAyat,
      String teksArab,
      String teksLatin,
      String teksIndonesia,
      Map<String, String> audio});
}

/// @nodoc
class _$AyatModelCopyWithImpl<$Res, $Val extends AyatModel>
    implements $AyatModelCopyWith<$Res> {
  _$AyatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomorAyat = null,
    Object? teksArab = null,
    Object? teksLatin = null,
    Object? teksIndonesia = null,
    Object? audio = null,
  }) {
    return _then(_value.copyWith(
      nomorAyat: null == nomorAyat
          ? _value.nomorAyat
          : nomorAyat // ignore: cast_nullable_to_non_nullable
              as int,
      teksArab: null == teksArab
          ? _value.teksArab
          : teksArab // ignore: cast_nullable_to_non_nullable
              as String,
      teksLatin: null == teksLatin
          ? _value.teksLatin
          : teksLatin // ignore: cast_nullable_to_non_nullable
              as String,
      teksIndonesia: null == teksIndonesia
          ? _value.teksIndonesia
          : teksIndonesia // ignore: cast_nullable_to_non_nullable
              as String,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AyatModelImplCopyWith<$Res>
    implements $AyatModelCopyWith<$Res> {
  factory _$$AyatModelImplCopyWith(
          _$AyatModelImpl value, $Res Function(_$AyatModelImpl) then) =
      __$$AyatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int nomorAyat,
      String teksArab,
      String teksLatin,
      String teksIndonesia,
      Map<String, String> audio});
}

/// @nodoc
class __$$AyatModelImplCopyWithImpl<$Res>
    extends _$AyatModelCopyWithImpl<$Res, _$AyatModelImpl>
    implements _$$AyatModelImplCopyWith<$Res> {
  __$$AyatModelImplCopyWithImpl(
      _$AyatModelImpl _value, $Res Function(_$AyatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomorAyat = null,
    Object? teksArab = null,
    Object? teksLatin = null,
    Object? teksIndonesia = null,
    Object? audio = null,
  }) {
    return _then(_$AyatModelImpl(
      nomorAyat: null == nomorAyat
          ? _value.nomorAyat
          : nomorAyat // ignore: cast_nullable_to_non_nullable
              as int,
      teksArab: null == teksArab
          ? _value.teksArab
          : teksArab // ignore: cast_nullable_to_non_nullable
              as String,
      teksLatin: null == teksLatin
          ? _value.teksLatin
          : teksLatin // ignore: cast_nullable_to_non_nullable
              as String,
      teksIndonesia: null == teksIndonesia
          ? _value.teksIndonesia
          : teksIndonesia // ignore: cast_nullable_to_non_nullable
              as String,
      audio: null == audio
          ? _value._audio
          : audio // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AyatModelImpl implements _AyatModel {
  const _$AyatModelImpl(
      {required this.nomorAyat,
      required this.teksArab,
      required this.teksLatin,
      required this.teksIndonesia,
      required final Map<String, String> audio})
      : _audio = audio;

  factory _$AyatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AyatModelImplFromJson(json);

  @override
  final int nomorAyat;
  @override
  final String teksArab;
  @override
  final String teksLatin;
  @override
  final String teksIndonesia;
  final Map<String, String> _audio;
  @override
  Map<String, String> get audio {
    if (_audio is EqualUnmodifiableMapView) return _audio;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_audio);
  }

  @override
  String toString() {
    return 'AyatModel(nomorAyat: $nomorAyat, teksArab: $teksArab, teksLatin: $teksLatin, teksIndonesia: $teksIndonesia, audio: $audio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AyatModelImpl &&
            (identical(other.nomorAyat, nomorAyat) ||
                other.nomorAyat == nomorAyat) &&
            (identical(other.teksArab, teksArab) ||
                other.teksArab == teksArab) &&
            (identical(other.teksLatin, teksLatin) ||
                other.teksLatin == teksLatin) &&
            (identical(other.teksIndonesia, teksIndonesia) ||
                other.teksIndonesia == teksIndonesia) &&
            const DeepCollectionEquality().equals(other._audio, _audio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nomorAyat, teksArab, teksLatin,
      teksIndonesia, const DeepCollectionEquality().hash(_audio));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AyatModelImplCopyWith<_$AyatModelImpl> get copyWith =>
      __$$AyatModelImplCopyWithImpl<_$AyatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AyatModelImplToJson(
      this,
    );
  }
}

abstract class _AyatModel implements AyatModel {
  const factory _AyatModel(
      {required final int nomorAyat,
      required final String teksArab,
      required final String teksLatin,
      required final String teksIndonesia,
      required final Map<String, String> audio}) = _$AyatModelImpl;

  factory _AyatModel.fromJson(Map<String, dynamic> json) =
      _$AyatModelImpl.fromJson;

  @override
  int get nomorAyat;
  @override
  String get teksArab;
  @override
  String get teksLatin;
  @override
  String get teksIndonesia;
  @override
  Map<String, String> get audio;
  @override
  @JsonKey(ignore: true)
  _$$AyatModelImplCopyWith<_$AyatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
