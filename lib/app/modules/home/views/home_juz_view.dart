import 'package:compact_quran/app/data/core/styles/text_styles.dart';
import 'package:compact_quran/app/data/core/utils/color_pallete.dart';
import 'package:compact_quran/app/data/model/juz_model.dart';
import 'package:compact_quran/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeJuzView extends GetView<HomeController> {
  const HomeJuzView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: QuranJuz.juzList.length,
        itemBuilder: (context, index) {
          QuranJuz juz = QuranJuz.juzList[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Juz ${juz.number}',
                  style: TextStyles.headerStyle.copyWith(
                    color: ColorPallete.QuranRed,
                  ),
                ),
                Text(
                  juz.name,
                  style: TextStyles.bodyStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
