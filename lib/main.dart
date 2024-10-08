import 'package:compact_quran/app/data/core/network_service/network_service.dart';
import 'package:compact_quran/app/data/core/utils/color_pallete.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    CompactQuran(),
  );
}

class CompactQuran extends StatelessWidget {
  const CompactQuran({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NetworkService());
    return GetMaterialApp(
      title: "Compact Quran",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: compactTextTheme(),
    );
  }
}

ThemeData compactTextTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
    ),
    textTheme: GoogleFonts.notoSansTextTheme(),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      surfaceTint: Colors.transparent,
      surface: Colors.transparent,
    ),
  );
}
