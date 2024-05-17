class KFonts{
  static final KFonts _kFonts = KFonts._internal();

  factory KFonts() {
    return _kFonts;
  }

  KFonts._internal();

  final String _kMedium = "medium";

  String get kMedium => _kMedium;

  final String _kBold = "bold";

  String get kBold => _kBold;

  final String _kRegular = "regular";

  String get kRegular => _kRegular;

  final String _kInter = "inter";

  String get kInter => _kInter;

  final String _kText = "text";

  String get kText => _kText;
}