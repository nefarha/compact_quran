import 'package:compact_quran/app/data/core/styles/text_styles.dart';
import 'package:compact_quran/app/data/core/utils/color_pallete.dart';
import 'package:compact_quran/app/data/core/utils/skelton.dart';
import 'package:compact_quran/app/data/model/surah_list/surah_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../controllers/surat_controller.dart';

class SuratView extends GetView<SuratController> {
  const SuratView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surat'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            _SuratList(),
            SizedBox(
              height: 5,
            ),
            _SurahTitle(),
            SizedBox(
              height: 15,
            ),
            Text(
              'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ',
              style: TextStyles.headerStyle.copyWith(
                fontSize: 22,
                color: ColorPallete.QuranBlue,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _SurahBody(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _SuratList extends GetView<SuratController> {
  const _SuratList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ScrollablePositionedList.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.surahs.length,
        itemScrollController: controller.scrollController,
        itemBuilder: (context, index) {
          SurahModel model = controller.surahs[index];
          return Obx(
            () => GestureDetector(
              onTap: () {
                controller.pickSurat(model: model);
              },
              behavior: HitTestBehavior.translucent,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: controller.sameSurah(surah: model)
                      ? Border(
                          bottom: BorderSide(
                              color: ColorPallete.QuranBlue, width: 2),
                        )
                      : null,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  model.namaLatin,
                  style: TextStyles.titleStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SurahTitle extends GetView<SuratController> {
  const _SurahTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          controller.scrollToIndex();
        },
        child: Container(
          color: ColorPallete.QuranBlue,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.selectedSurah.value.nama,
                    style: TextStyles.headerStyle.copyWith(color: Colors.white),
                  ),
                  Text(
                    controller.selectedSurah.value.namaLatin,
                    style: TextStyles.titleStyle.copyWith(color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    '${controller.selectedSurah.value.jumlahAyat} ayat',
                    style: TextStyles.titleStyle.copyWith(color: Colors.white),
                  ),
                  Text(
                    controller.selectedSurah.value.tempatTurun,
                    style: TextStyles.titleStyle.copyWith(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SurahBody extends GetView<SuratController> {
  const _SurahBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: controller.optionOrSurah.value.match(
          () => ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Skelton(
                height: 150,
                width: double.infinity,
                shimmerColor: ColorPallete.QuranBlue,
              ),
            ),
          ),
          (t) => t.match(
            (l) => Center(
              child: Text(
                l.when(
                  serverError: (message) => message,
                  noInternet: (message) => message,
                ),
              ),
            ),
            (r) => ScrollablePositionedList.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemScrollController: controller.ayatController,
              itemCount: controller.ayatList.length,
              itemBuilder: (context, index) {
                AyatModel model = controller.ayatList[index];
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorPallete.QuranBlue,
                                radius: 10,
                                child: Text(
                                  model.nomorAyat.toString(),
                                  style: TextStyles.titleStyle.copyWith(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Text(
                                  model.teksArab,
                                  textAlign: TextAlign.right,
                                  style: TextStyles.headerStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              model.teksLatin,
                              style: TextStyles.headerStyle.copyWith(
                                color: ColorPallete.QuranBlue,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              model.teksIndonesia,
                              style: TextStyles.bodyStyle.copyWith(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(color: ColorPallete.QuranBlue),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Row(
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    controller.addLastSurat(
                                        nomorAyat: model.nomorAyat);
                                  },
                                  child: Icon(
                                    controller.sameAyat(ayat: model.nomorAyat)
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  controller.sameAyat(ayat: model.nomorAyat)
                                      ? 'bacaan tersimpan'
                                      : 'simpan bacaan terakhir',
                                  style: TextStyles.bodyStyle
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Icon(
                              Icons.play_arrow,
                              color: ColorPallete.QuranBlue,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
