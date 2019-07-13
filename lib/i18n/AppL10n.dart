import 'package:flutter/widgets.dart';
import 'package:randommet2/i18n/en.dart';
import 'package:randommet2/i18n/it.dart';

class AppL10n {
  final Locale locale;

  AppL10n(this.locale);

  static AppL10n of(BuildContext context) {
    return Localizations.of<AppL10n>(context, AppL10n);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    ...appEnValues,
    ...appItValues,
  };

  String get tabItem {
    return _localizedValues[locale.languageCode]['Tab.Item'];
  }

  String get tabOracle {
    return _localizedValues[locale.languageCode]['Tab.Oracle'];
  }

  String get tabColor {
    return _localizedValues[locale.languageCode]['Tab.Color'];
  }

  String get colorPageTitle {
    return _localizedValues[locale.languageCode]['ColorPage.title'];
  }

  String get choosePageTitle {
    return _localizedValues[locale.languageCode]['ChoosePage.title'];
  }

  String get itemListPageTitle {
    return _localizedValues[locale.languageCode]['ItemListPage.title'];
  }

  String get itemListPageAddTooltip {
    return _localizedValues[locale.languageCode]['ItemListPage.add.tooltip'];
  }

  String get itemListPageAddPlaceholder {
    return _localizedValues[locale.languageCode]['ItemListPage.add.placeholder'];
  }

  String get itemListPageChooseTooltip {
    return _localizedValues[locale.languageCode]['ItemListPage.choose.tooltip'];
  }

  String get itemListPageChooseEmptyTextError {
    return _localizedValues[locale.languageCode]['ItemListPage.choose.emptyTextError'];
  }

  String get oraclePageTitle {
    return _localizedValues[locale.languageCode]['OraclePage.title'];
  }

  String get oracleHelpText {
    return _localizedValues[locale.languageCode]['Oracle.helpText'];
  }

  String get chooseScreenChooseTooltip {
    return _localizedValues[locale.languageCode]['ChooseScreen.choose.tooltip'];
  }
}
