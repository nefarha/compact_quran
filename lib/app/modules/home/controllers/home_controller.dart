import 'dart:math';

import 'package:compact_quran/app/data/core/enums/e_section_option.dart';
import 'package:compact_quran/app/data/core/network_failures/network_failures.dart';
import 'package:compact_quran/app/data/core/utils/custom_flushbar.dart';
import 'package:compact_quran/app/data/model/surah_list/surah_list.dart';
import 'package:compact_quran/app/data/repository/quran_repository.dart';
import 'package:compact_quran/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final selectedType = Rx(ESectionOption.juz);
  final _quranRepository = QuranRepository();
  final _box = GetStorage();

  List<String> welcomeMessages = [
    "Semoga bacaanmu hari ini membawa ketenangan jiwa.",
    "Semoga setiap huruf yang dibaca menjadi amal kebaikan.",
    "Yuk, lanjutkan bacaan dengan penuh semangat!",
    "Semoga hari ini penuh berkah dengan membaca ayat-ayat suci.",
    "Setiap ayat adalah jalan menuju kedamaian, yuk lanjutkan!",
    "Semoga setiap ayat memberikan ketenangan dan kebahagiaan.",
    "Nikmati setiap detik dalam membaca firman-Nya.",
    "Semoga bacaan hari ini menambah pahala dan keberkahan.",
    "Setiap huruf yang kamu baca akan selalu bermakna.",
    "Semoga hati selalu tenang dengan bacaan Al-Quran.",
    "Yuk, temukan cahaya kebaikan di setiap ayat.",
    "Semoga bacaan hari ini membuat hatimu lebih damai.",
    "Semoga setiap ayat menjadi penyemangat dalam hidupmu.",
    "Lanjutkan membaca dan temukan hikmah di dalamnya.",
    "Semoga Allah memberkahi waktu yang kamu luangkan untuk membaca.",
    "Nikmati indahnya setiap ayat yang kamu baca hari ini.",
    "Semoga bacaan ini membawa kebaikan untukmu dan orang-orang terdekatmu.",
    "Setiap bacaan adalah langkah menuju kebaikan, teruskan!",
    "Semoga ayat-ayat yang kamu baca menjadi sumber inspirasi.",
    "Yuk, isi harimu dengan kebaikan dari membaca Al-Quran.",
    "Bacaan hari ini semoga membawa kedamaian dalam hidupmu.",
    "Setiap ayat adalah doa yang membawa kebaikan.",
    "Semoga Al-Quran menjadi cahaya dalam hidupmu.",
    "Nikmati keindahan setiap firman yang kamu baca.",
    "Semoga setiap bacaan menjadi berkah bagi kita semua.",
    "Yuk, lanjutkan dengan hati yang ikhlas.",
    "Semoga bacaan ini menjadi penenang hati dan pikiran.",
    "Setiap huruf yang dibaca bernilai pahala, teruskan!",
    "Semoga ayat-ayat suci ini menerangi harimu.",
    "Baca dan resapi setiap kata dengan penuh cinta.",
    "Semoga Al-Quran selalu menjadi petunjuk dalam hidupmu.",
    "Lanjutkan dengan keyakinan dan keikhlasan.",
    "Semoga ayat-ayat ini memberi kekuatan dalam menghadapi hari ini.",
    "Teruskan bacaan dan biarkan kedamaian mengisi hatimu.",
    "Setiap ayat yang dibaca adalah bentuk cinta kepada-Nya.",
    "Semoga setiap bacaan membawa ketenangan batin.",
    "Resapi setiap ayat dengan hati yang tenang.",
    "Semoga ayat yang kamu baca hari ini penuh berkah.",
    "Yuk, lanjutkan dengan hati yang bersih dan tulus.",
    "Semoga firman Allah selalu menjadi pelita hidupmu.",
    "Teruskan bacaanmu, setiap ayat adalah anugerah.",
    "Semoga setiap huruf yang dibaca menjadi doa kebaikan.",
    "Mari lanjutkan dan temukan kedamaian dalam ayat-ayat ini.",
    "Baca dengan penuh cinta, resapi dengan hati yang tenang.",
    "Semoga bacaan ini membawa kedamaian dalam hidupmu.",
    "Nikmati setiap detik dalam membaca firman-Nya.",
    "Setiap ayat adalah petunjuk yang penuh makna.",
    "Semoga hati kita selalu dikuatkan dengan firman Allah.",
    "Teruskan membaca, setiap ayat adalah berkah.",
    "Semoga Al-Quran selalu menjadi petunjuk dalam setiap langkahmu.",
    "Baca dengan tenang, resapi dengan ikhlas.",
    "Setiap bacaan mendekatkan kita pada-Nya, teruskan!",
    "Semoga ayat-ayat yang dibaca memberi ketenangan jiwa.",
    "Mari temukan kedamaian dalam setiap firman-Nya.",
    "Setiap huruf adalah doa, setiap ayat adalah berkah.",
    "Semoga setiap bacaan membawa pahala dan kebaikan.",
    "Yuk, lanjutkan perjalanan spiritualmu bersama Quran.",
    "Semoga hati selalu dipenuhi dengan cahaya-Nya.",
    "Bacalah dengan khusyuk, semoga membawa kebaikan.",
    "Setiap ayat adalah pelajaran yang membawa kebaikan.",
    "Semoga setiap bacaan menjadi penyejuk hati.",
    "Resapi maknanya, biarkan firman Allah meresap di hatimu.",
    "Bacaan ini adalah bentuk cinta dan ketaatan pada-Nya.",
    "Semoga setiap ayat yang kamu baca menjadi pelita hidup.",
    "Teruskan membaca, semoga membawa berkah di setiap langkahmu.",
    "Semoga Allah memberkahi setiap huruf yang dibaca hari ini.",
    "Baca dengan hati yang tenang, resapi dengan ikhlas.",
    "Semoga setiap firman-Nya menjadi petunjuk dalam hidupmu.",
    "Yuk, temukan kedamaian dalam setiap kata Al-Quran.",
    "Setiap ayat adalah anugerah yang penuh berkah.",
    "Semoga bacaan hari ini membawa kebaikan yang melimpah.",
    "Baca dengan cinta, resapi dengan hati yang bersih.",
    "Setiap ayat adalah doa, setiap bacaan adalah kebaikan.",
    "Semoga hari ini dipenuhi dengan cahaya Al-Quran.",
    "Setiap firman Allah adalah petunjuk hidup yang penuh makna.",
    "Mari teruskan bacaan dan biarkan kedamaian merasuk di hati.",
    "Semoga bacaanmu hari ini menambah pahala dan keberkahan.",
    "Setiap ayat yang dibaca akan selalu membawa kebaikan.",
    "Yuk, temukan makna mendalam di setiap bacaan.",
    "Semoga setiap ayat yang dibaca membawa keberkahan.",
    "Bacalah dengan hati yang ikhlas dan penuh cinta.",
    "Semoga setiap bacaan mendekatkan kita kepada Allah.",
    "Lanjutkan membaca, semoga membawa ketenangan dalam hidupmu.",
    "Setiap firman-Nya adalah sumber kekuatan, lanjutkan!",
    "Baca dengan penuh penghayatan, resapi setiap maknanya.",
    "Semoga setiap ayat yang dibaca menjadi penenang jiwa.",
    "Teruskan membaca, setiap bacaan adalah pahala.",
    "Semoga bacaan ini membawa kebaikan bagi hidupmu.",
    "Nikmati setiap firman Allah dengan sepenuh hati.",
    "Setiap huruf yang kamu baca bernilai kebaikan, teruskan!",
    "Semoga hati selalu dikuatkan dengan firman Allah.",
    "Setiap bacaan adalah bentuk cinta pada-Nya, resapi!",
    "Teruskan membaca, semoga setiap ayat membawa ketenangan.",
    "Semoga bacaan hari ini membawa kebahagiaan dan kedamaian.",
    "Setiap ayat adalah jalan menuju kebaikan, teruskan!",
    "Yuk, lanjutkan membaca dengan hati yang ikhlas.",
    "Semoga bacaan hari ini memberi kekuatan dalam menghadapi hari esok.",
    "Baca dengan hati yang penuh syukur, resapi maknanya.",
    "Setiap huruf yang dibaca adalah amal kebaikan, lanjutkan!",
    "Semoga hati selalu dipenuhi cahaya Al-Quran.",
    "Lanjutkan membaca, setiap bacaan adalah anugerah.",
    "Baca dengan penuh cinta, semoga membawa kedamaian.",
    "Setiap ayat yang dibaca adalah doa kebaikan, teruskan!",
    "Semoga firman Allah selalu menjadi penuntun dalam hidupmu.",
    "Lanjutkan dengan ikhlas, setiap bacaan membawa berkah.",
    "Semoga bacaan ini menambah cahaya dalam hatimu.",
    "Yuk, lanjutkan dengan hati yang tenang dan damai.",
    "Semoga setiap ayat membawa ketenangan jiwa dan raga.",
    "Teruskan bacaan, semoga setiap huruf menjadi amal kebaikan.",
    "Baca dengan cinta dan keikhlasan, resapi maknanya.",
    "Semoga bacaan hari ini membawa kebahagiaan dan ketenangan.",
    "Setiap firman Allah adalah pelita bagi jiwa, lanjutkan!",
    "Teruskan membaca, semoga setiap ayat membawa berkah.",
    "Semoga hati selalu tenang dengan bacaan Al-Quran.",
    "Setiap ayat yang dibaca adalah jalan menuju kebaikan.",
    "Lanjutkan bacaan dengan penuh cinta dan penghayatan.",
    "Semoga setiap huruf yang dibaca menjadi doa kebaikan.",
    "Yuk, temukan kedamaian dalam setiap ayat suci Al-Quran.",
    "Semoga bacaan hari ini menambah kekuatan iman.",
    "Setiap ayat adalah pelajaran, resapi setiap maknanya.",
    "Baca dengan hati yang ikhlas, semoga membawa berkah.",
    "Setiap firman-Nya adalah petunjuk yang penuh makna.",
    "Teruskan membaca, semoga setiap ayat membawa ketenangan.",
    "Semoga setiap bacaan menambah cahaya dalam hatimu.",
    "Lanjutkan bacaan dengan hati yang tenang dan damai.",
    "Setiap ayat adalah pelita hidup, semoga membawa berkah.",
    "Yuk, resapi setiap firman Allah dengan hati yang ikhlas.",
    "Semoga bacaan hari ini menambah kebahagiaan dan kedamaian.",
    "Setiap huruf yang dibaca adalah anugerah, teruskan!",
    "Baca dengan penuh cinta, semoga membawa ketenangan.",
    "Semoga setiap ayat yang dibaca membawa pahala dan kebaikan.",
    "Setiap bacaan adalah langkah menuju kebaikan, lanjutkan!",
    "Semoga hati selalu dipenuhi cahaya firman-Nya.",
    "Lanjutkan bacaan dengan hati yang penuh syukur.",
    "Semoga setiap huruf yang dibaca menjadi amal kebaikan.",
    "Setiap ayat adalah doa, semoga membawa berkah.",
    "Baca dengan hati yang ikhlas, resapi setiap maknanya.",
    "Yuk, lanjutkan membaca dengan penuh cinta dan penghayatan.",
    "Semoga setiap firman-Nya menjadi pelita dalam hidupmu.",
    "Lanjutkan bacaan dengan ikhlas, semoga membawa kebaikan.",
    "Semoga bacaan hari ini menambah cahaya dalam hidupmu.",
    "Setiap ayat yang dibaca adalah sumber ketenangan.",
    "Yuk, lanjutkan membaca dengan hati yang penuh syukur.",
    "Semoga setiap huruf yang dibaca menjadi amal kebaikan.",
    "Baca dengan cinta, resapi maknanya dengan hati yang tenang.",
    "Semoga setiap ayat yang dibaca membawa keberkahan.",
    "Setiap firman-Nya adalah petunjuk hidup, lanjutkan!",
    "Bacaan hari ini semoga membawa ketenangan jiwa.",
    "Semoga hati selalu dipenuhi cahaya Al-Quran.",
    "Setiap ayat adalah doa, semoga membawa kebaikan.",
    "Lanjutkan bacaan, semoga setiap huruf membawa pahala."
  ];

  RxnString lastSurahName = RxnString();
  RxnInt lastSurahayat = RxnInt();

  final isFlashReadLoading = false.obs;

  getLastSurat() {
    var last = _box.read('last_read');
    if (last == null) {
      lastSurahName.value = null;
      lastSurahayat.value = null;
      return;
    }

    lastSurahName.value = last["name"];
    lastSurahayat.value = last["nomor_ayat"];
  }

  listenLastSurat() {
    _box.listenKey('last_read', (value) {
      lastSurahName.value = value['name'];
      lastSurahayat.value = value['nomor_ayat'];
      debugPrint('assda $value');
    });
  }

  final optionOrSurahList =
      Rx<Option<Either<NetworkFailures, List<SurahModel>>>>(none());

  final surahList = RxList<SurahModel>.empty();

  // Function to generate random message
  String getRandomMessage() {
    final random = Random();
    int randomIndex = random.nextInt(welcomeMessages.length);
    return welcomeMessages[randomIndex];
  }

  changeSection(ESectionOption value) {
    selectedType.value = value;
  }

  bool sameSection(ESectionOption value) {
    return selectedType.value == value;
  }

  Future getSurahList() async {
    final result = await _quranRepository.getSurahs();

    result.match(
      (l) => CustomFlushbar(
        message: l.when(
          serverError: (message) => message,
          noInternet: (message) => message,
        ),
      ).show(),
      (r) => surahList.value = r,
    );

    optionOrSurahList.value = optionOf(result);
  }

  Future getRandomRead() async {
    isFlashReadLoading.value = true;
    var selectedNumber = Random().nextInt(114);
    if (selectedNumber == 0) {
      selectedNumber = 1;
    }
    if (selectedNumber > 114) {
      selectedNumber = 114;
    }
    var surahResult =
        await _quranRepository.getSurat(nomorSurat: selectedNumber);

    surahResult.match(
      (l) => CustomFlushbar(
        message: l.when(
          serverError: (message) => message,
          noInternet: (message) => message,
        ),
      ).show(),
      (r) {
        var selectedAyat = Random().nextInt(r.ayat!.length);
        if (selectedAyat == 0) {
          selectedAyat = 1;
        }
        if (selectedAyat > r.ayat!.length) {
          selectedAyat = r.ayat!.length;
        }

        var ayat = r.ayat![selectedAyat - 1];

        Get.toNamed(Routes.FLASH_READ, arguments: ayat);
      },
    );
    isFlashReadLoading.value = false;
  }

  @override
  void onInit() {
    listenLastSurat();
    getLastSurat();
    getSurahList();
    super.onInit();
  }
}
