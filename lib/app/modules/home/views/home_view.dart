import 'package:compact_quran/app/data/core/utils/asset_url.dart';
import 'package:compact_quran/app/data/core/utils/color_pallete.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AssetUrl.bf),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorPallete.quran_teal.withOpacity(0.9),
            ),
          ),
          _HomeBody(),
        ],
      ),
    );
  }
}

class _HomeBody extends GetView<HomeController> {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeMenuButton(
            title: 'Baca Quran',
            description: 'Baca seluruh quran dalam 1 halaman',
          ),
          SizedBox(
            height: 20,
          ),
          HomeMenuButton(
            title: 'Baca Juz',
            description: 'Baca quran dari juz',
          ),
          SizedBox(
            height: 20,
          ),
          HomeMenuButton(
            title: 'Baca Surah',
            description: 'Baca quran dari surah',
          ),
        ],
      ),
    );
  }
}

class HomeMenuButton extends StatelessWidget {
  const HomeMenuButton({
    super.key,
    this.onTap,
    required this.description,
    required this.title,
  });

  final void Function()? onTap;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
