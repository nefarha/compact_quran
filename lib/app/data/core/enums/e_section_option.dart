enum ESectionOption {
  juz,
  surah,
  ayah,
}

extension ESectionOptionExtension on ESectionOption {
  String get name {
    switch (this) {
      case ESectionOption.juz:
        return "Juz";
      case ESectionOption.surah:
        return "Surah";
      case ESectionOption.ayah:
        return "Ayah\'s";
    }
  }
}
