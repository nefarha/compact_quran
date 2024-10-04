import 'package:compact_quran/app/data/core/enums/e_section_option.dart';
import 'package:compact_quran/app/data/core/styles/text_styles.dart';
import 'package:compact_quran/app/data/core/utils/asset_url.dart';
import 'package:compact_quran/app/data/core/utils/color_pallete.dart';
import 'package:compact_quran/app/data/model/surah_list/surah_list.dart';
import 'package:compact_quran/app/modules/home/views/home_juz_view.dart';
import 'package:compact_quran/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glass/glass.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _DrawerHome(),
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
    return GestureDetector(
      onTap: () {
        if (GetStorage().read('last_read') != null) {
          Get.toNamed(
            Routes.SURAT,
            arguments: {
              "selected_surat":
                  GetStorage().read('last_read')['surat'] is SurahModel
                      ? GetStorage().read('last_read')['surat']
                      : SurahModel.fromJson(
                          GetStorage().read('last_read')['surat']),
              "surat_list": controller.surahList
            },
          );
        }
      },
      child: Container(
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
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
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
                          Flexible(
                            child: Text(
                              controller.lastSurahName.value ??
                                  'Belum ada surat yang tandai',
                              style: TextStyles.headerStyle.copyWith(
                                color: ColorPallete.QuranRed,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Ayat ${controller.lastSurahayat.value ?? '-'}',
                            style: TextStyles.bodyStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (!controller.isFlashReadLoading.value) {
                          controller.getRandomRead();
                        }
                      },
                      child: Container(
                        height: 70,
                        width: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ColorPallete.QuranPurple.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Obx(
                          () => controller.isFlashReadLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Quick Read',
                                      style: TextStyles.bodyStyle
                                          .copyWith(color: Colors.white),
                                    )
                                  ],
                                ),
                        ),
                      ).asGlass(
                        blurX: 3,
                        blurY: 3,
                        tintColor: ColorPallete.quran_teal,
                        frosted: true,
                        tileMode: TileMode.decal,
                        clipBehaviour: Clip.antiAlias,
                        clipBorderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerHome extends StatelessWidget {
  const _DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Compact Quran',
                    style: TextStyles.headerStyle,
                  ),
                  Text(
                    'by islami anonymous',
                    style: TextStyles.bodyStyle,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Thanks to EQuran.id'),
          Text('for providing the data'),
          SizedBox(
            height: 20,
          ),
          Text('Developed by islami anonymous'),
          Text('with love and support'),
          SizedBox(
            height: 20,
          ),
          Text(
            'Copyright © 2024 islami anonymous',
            style: TextStyles.bodyStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'All Rights Reserved',
            style: TextStyles.bodyStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'if you want to contribute or add something, click button below to redirect to github',
              textAlign: TextAlign.center,
              style: TextStyles.bodyStyle,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(199, 0, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // Get.toNamed(AppRoutes.gh);
            },
            child: Text(
              'Github',
              style: TextStyles.bodyStyle.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
