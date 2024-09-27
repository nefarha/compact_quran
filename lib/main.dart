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
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.ubuntuTextTheme(),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      surfaceTint: Colors.transparent,
      surface: Colors.transparent,
    ),
  );
}
