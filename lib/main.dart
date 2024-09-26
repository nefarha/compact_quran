import 'package:compact_quran/app/data/core/utils/color_pallete.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    CompactQuran(),
  );
}

class CompactQuran extends StatelessWidget {
  const CompactQuran({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Compact Quran",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: compactTextTheme(),
    );
  }
}

ThemeData compactTextTheme() {
  return ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: ColorPallete.quran_teal,
    textTheme: GoogleFonts.kanitTextTheme(),
    colorScheme: ColorScheme.fromSeed(seedColor: ColorPallete.quran_teal),
  );
}
