enum ESectionOption {
  juz,
  surah,
}

extension ESectionOptionExtension on ESectionOption {
  String get name => switch (this) {
        ESectionOption.juz => "Juz",
        ESectionOption.surah => "Surah"
      };
}
