import 'package:compact_quran/app/data/core/styles/text_styles.dart';
import 'package:compact_quran/app/data/core/utils/asset_url.dart';
import 'package:compact_quran/app/data/core/utils/color_pallete.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glass/glass.dart';

import '../controllers/flash_read_controller.dart';

class FlashReadView extends GetView<FlashReadController> {
  const FlashReadView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text(
          'Flash Read',
          style: TextStyles.headerStyle.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          Align(
            child: Container(
              decoration: BoxDecoration(
                // color: ColorPallete.QuranPurple,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AssetUrl.mosque,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorPallete.QuranPurple.withOpacity(0.7),
                  ColorPallete.QuranRed.withOpacity(0.9),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        controller.ayat.teksArab,
                        textAlign: TextAlign.right,
                        style: TextStyles.headerStyle.copyWith(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.ayat.teksLatin,
                        style: TextStyles.headerStyle.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.ayat.teksIndonesia,
                        style: TextStyles.bodyStyle.copyWith(),
                      ),
                    ),
                  ],
                ),
              ).asGlass(
                blurX: 15,
                blurY: 15,
                tintColor: ColorPallete.QuranBlue,
                clipBorderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
