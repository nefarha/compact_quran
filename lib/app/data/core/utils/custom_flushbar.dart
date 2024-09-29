import 'package:another_flushbar/flushbar.dart';
import 'package:compact_quran/app/data/core/utils/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFlushbar {
  CustomFlushbar({
    required this.message,
    this.eCustomFlushbarType = ECustomFlushbarType.error,
    this.textButton,
    this.position = FlushbarPosition.BOTTOM,
  });

  final String message;
  final ECustomFlushbarType eCustomFlushbarType;
  final TextButton? textButton;
  final FlushbarPosition position;

  Widget leadingIcon() {
    switch (eCustomFlushbarType) {
      case ECustomFlushbarType.success:
        return Icon(
          Icons.check_circle,
          color: Colors.green[300],
        );
      case ECustomFlushbarType.information:
        return Icon(
          Icons.info_outline,
          color: Colors.blue[300],
        );
      case ECustomFlushbarType.error:
        return Icon(
          Icons.warning,
          color: Colors.red[300],
        );
    }
  }

  void show() {
    Flushbar(
      flushbarPosition: position,
      backgroundColor: Colors.white,
      messageColor: ColorPallete.QuranPurple,
      borderColor: ColorPallete.QuranRed,
      message: message,
      icon: leadingIcon(),
      mainButton: textButton,
      borderRadius: BorderRadius.circular(15),
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 3),
    ).show(Get.context!);
  }
}

enum ECustomFlushbarType {
  success,
  information,
  error,
}
