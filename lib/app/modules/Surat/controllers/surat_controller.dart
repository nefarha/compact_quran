import 'package:compact_quran/app/data/core/network_failures/network_failures.dart';
import 'package:compact_quran/app/data/core/utils/custom_flushbar.dart';
import 'package:compact_quran/app/data/model/surah_list/surah_list.dart';
import 'package:compact_quran/app/data/repository/quran_repository.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SuratController extends GetxController {
  final _quranRepository = QuranRepository();
  List<SurahModel> surahs = Get.arguments['surat_list'];

  final selectedSurah = Rx<SurahModel>(Get.arguments['selected_surat']);

  final scrollController = ItemScrollController();

  final optionOrSurah = Rx<Option<Either<NetworkFailures, SurahModel>>>(none());

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
        (r) => null);

    optionOrSurah.value = optionOf(result);
  }

  @override
  void onInit() {
    getSurah();
    super.onInit();
  }

  @override
  void onReady() {
    ever(selectedSurah, (callback) => getSurah());
    scrollToIndex();
    super.onReady();
  }
}
