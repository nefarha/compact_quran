import 'package:compact_quran/app/data/core/network_failures/network_failures.dart';
import 'package:compact_quran/app/data/core/utils/color_pallete.dart';
import 'package:compact_quran/app/data/core/utils/custom_flushbar.dart';
import 'package:compact_quran/app/data/model/surah_list/surah_list.dart';
import 'package:compact_quran/app/data/repository/quran_repository.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SuratController extends GetxController {
  final _quranRepository = QuranRepository();
  final _box = GetStorage();
  List<SurahModel> surahs = Get.arguments['surat_list'];

  final selectedSurah = Rx<SurahModel>(Get.arguments['selected_surat']);
  final surahFromStorage = Rxn<SurahModel>();

  final scrollController = ItemScrollController();
  final ayatController = ItemScrollController();

  final optionOrSurah = Rx<Option<Either<NetworkFailures, SurahModel>>>(none());
  final ayatList = RxList<AyatModel>.empty();

  final nomorAyat = RxnInt();

  bool sameAyat({required int ayat}) {
    if (surahFromStorage.value == selectedSurah.value &&
        nomorAyat.value == ayat) {
      return true;
    }
    return false;
  }

  addLastSurat({required int nomorAyat}) async {
    await _box.write(
      'last_read',
      {
        "name": selectedSurah.value.namaLatin,
        "nomor_surat": selectedSurah.value.nomor,
        "nomor_ayat": nomorAyat,
        "surat": selectedSurah.value
      },
    );

    Get.snackbar(
      'Surat ditambahkan',
      'Surat yang terakhir dibaca telah ditambahkan',
      backgroundColor: ColorPallete.QuranBlue.withOpacity(0.7),
      colorText: Colors.white,
    );
  }

  listenLastSurat() {
    _box.listenKey('last_read', (value) {
      nomorAyat.value = value['nomor_ayat'];
      surahFromStorage.value = value['surat'];
      debugPrint('assda $value');
    });
  }

  bool sameSurah({required SurahModel surah}) {
    return selectedSurah.value.nomor == surah.nomor;
  }

  pickSurat({required SurahModel model}) {
    selectedSurah.value = model;
  }

  scrollToIndex() {
    scrollController.scrollTo(
      index: selectedSurah.value.nomor - 1,
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  scrollAyatToIndex() {
    if (selectedSurah.value == surahFromStorage.value) {
      ayatController.scrollTo(
        index: nomorAyat.value == null ? 0 : nomorAyat.value! - 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  void getSurah() async {
    optionOrSurah.value = none();
    final result =
        await _quranRepository.getSurat(nomorSurat: selectedSurah.value.nomor);

    result.match(
        (l) => CustomFlushbar(
              message: l.when(
                serverError: (message) => message,
                noInternet: (message) => message,
              ),
            ).show(),
        (r) => ayatList.value = r.ayat!);

    optionOrSurah.value = optionOf(result);
  }

  getSurahStorage() {
    var surah = _box.read('last_read')['surat'] is SurahModel
        ? _box.read('last_read')['surat']
        : SurahModel.fromJson(_box.read('last_read')['surat']);
    nomorAyat.value = _box.read('last_read')['nomor_ayat'];
    surahFromStorage.value = surah;
  }

  @override
  void onInit() {
    getSurah();
    super.onInit();
  }

  @override
  void onReady() {
    once(
      ayatList,
      (callback) async {
        debugPrint('assda $callback');
        await Future.delayed(Duration(milliseconds: 500));
        scrollAyatToIndex();
      },
    );

    listenLastSurat();
    ever(selectedSurah, (callback) => getSurah());
    getSurahStorage();
    scrollToIndex();

    super.onReady();
  }
}
