import 'package:compact_quran/app/data/core/enums/e_section_option.dart';
import 'package:compact_quran/app/data/core/styles/text_styles.dart';
import 'package:compact_quran/app/data/core/utils/asset_url.dart';
import 'package:compact_quran/app/data/core/utils/color_pallete.dart';
import 'package:compact_quran/app/modules/home/views/home_juz_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Compact Quran',
          style:
              TextStyles.headerStyle.copyWith(color: ColorPallete.QuranPurple),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assallamuallaikum',
                  style: TextStyles.headerStyle
                      .copyWith(color: ColorPallete.QuranRed),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  controller.getRandomMessage(),
                  style: TextStyles.titleStyle
                      .copyWith(color: ColorPallete.QuranPurple),
                ),
              ],
            ),
          ),
          _HomeHeader(),
          HomeSurahCard(),
        ],
      ),
    );
  }
}

class _HomeHeader extends GetView<HomeController> {
  const _HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.all(20),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
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
          Padding(
            padding: EdgeInsets.all(20),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terakhir dibaca',
                    style: TextStyles.titleStyle.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.lastSurahName.value ??
                        'Belum ada surat yang tandai',
                    style: TextStyles.headerStyle.copyWith(
                      color: ColorPallete.QuranRed,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ayah 1',
                    style: TextStyles.bodyStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeSectionFilter extends GetView<HomeController> {
  const _HomeSectionFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: ESectionOption.values
              .map(
                (e) => Flexible(
                  flex: controller.sameSection(e) ? 2 : 1,
                  child: GestureDetector(
                    onTap: () {
                      controller.changeSection(e);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: 50,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: controller.sameSection(e)
                                ? ColorPallete.QuranRed
                                : Colors.grey.shade300,
                            width: controller.sameSection(e) ? 5 : 2,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          e.name,
                          style: controller.sameSection(e)
                              ? TextStyles.headerStyle.copyWith(
                                  color: ColorPallete.QuranRed,
                                )
                              : TextStyles.bodyStyle.copyWith(
                                  color: Colors.grey,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
