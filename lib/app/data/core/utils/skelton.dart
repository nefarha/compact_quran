import 'package:compact_quran/app/data/core/utils/color_pallete.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.height = 50,
    this.width = 50,
    this.borderRadius = 16.0,
    this.boxShape = BoxShape.rectangle,
  });

  final double height;
  final double width;
  final double borderRadius;
  final BoxShape boxShape;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorPallete.QuranPurple,
      highlightColor: ColorPallete.QuranRed,
      period: const Duration(milliseconds: 2000),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: boxShape,
          color: ColorPallete.QuranPurple.withOpacity(0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
