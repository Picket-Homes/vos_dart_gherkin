import 'package:vos_gherkin/gherkin.dart';
import 'package:vos_gherkin/src/gherkin/languages/language_service.dart';

import 'en_dialect_mock.dart';

typedef OnStepFinished = void Function(StepFinishedMessage message);

class LanguageServiceMock extends LanguageService {
  String _defaultLangauge = 'en';
  @override
  String get defaultLanguage => _defaultLangauge;

  LanguageServiceMock() : super() {
    initialise();
  }

  @override
  void initialise([String defaultLanguage = 'en']) {
    _defaultLangauge = defaultLanguage;
    setDialect('en', EnDialectMock());
  }
}
