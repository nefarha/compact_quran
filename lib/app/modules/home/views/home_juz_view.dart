import 'package:compact_quran/app/data/core/styles/text_styles.dart';
import 'package:compact_quran/app/data/core/utils/color_pallete.dart';
import 'package:compact_quran/app/data/core/utils/skelton.dart';
import 'package:compact_quran/app/data/model/juz_model.dart';
import 'package:compact_quran/app/data/model/surah_list/surah_list.dart';
import 'package:compact_quran/app/modules/home/controllers/home_controller.dart';
import 'package:compact_quran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeSurahCard extends GetView<HomeController> {
  const HomeSurahCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => controller.optionOrSurahList.value.match(
          () => ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Skelton(
                height: 100,
                width: double.infinity,
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
            (r) => ListView.builder(
              itemCount: r.length,
              itemBuilder: (context, index) {
                SurahModel model = r[index];
                return Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      backgroundColor: ColorPallete.QuranRed,
                      child: Text(
                        model.nomor.toString(),
                        style:
                            TextStyles.titleStyle.copyWith(color: Colors.white),
                      ),
                    ),
                    Flexible(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Get.toNamed(
                            Routes.SURAT,
                            arguments: {
                              "selected_surat": model,
                              "surat_list": r
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                spreadRadius: 2,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        model.nama,
                                        style: TextStyles.headerStyle.copyWith(
                                          color: ColorPallete.QuranRed,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '(${model.namaLatin})',
                                        style: TextStyles.bodyStyle.copyWith(
                                          color: ColorPallete.QuranRed,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    model.arti,
                                    style: TextStyles.bodyStyle.copyWith(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${model.jumlahAyat} ayat',
                                    style: TextStyles.titleStyle.copyWith(
                                      color: ColorPallete.QuranRed,
                                    ),
                                  ),
                                  Text(
                                    model.tempatTurun,
                                    style: TextStyles.bodyStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
