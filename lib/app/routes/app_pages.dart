import 'package:get/get.dart';

import '../modules/FlashRead/bindings/flash_read_binding.dart';
import '../modules/FlashRead/views/flash_read_view.dart';
import '../modules/Surat/bindings/surat_binding.dart';
import '../modules/Surat/views/surat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SURAT,
      page: () => const SuratView(),
      binding: SuratBinding(),
    ),
    GetPage(
      name: _Paths.FLASH_READ,
      page: () => const FlashReadView(),
      binding: FlashReadBinding(),
    ),
  ];
}
