import 'package:vos_gherkin/src/gherkin/languages/language_service.dart';
import 'package:test/test.dart';

void main() {
  group('service', () {
    test('can parse language json file', () async {
      final service = LanguageService();
      service.initialise();
    });

    test('can find default dialect', () async {
      final service = LanguageService();
      service.initialise();
      final dialect = service.getDialect();
      expect(dialect, isNotNull);
    });

    test('can find af dialect', () async {
      final service = LanguageService();
      service.initialise();
      final dialect = service.getDialect('af');
      expect(dialect, isNotNull);
    });

    test('can find en-au dialect', () async {
      final service = LanguageService();
      service.initialise();
      final dialect = service.getDialect('en-au');
      expect(dialect, isNotNull);
    });

    test('parses unicode correctly', () async {
      final service = LanguageService();
      service.initialise();
      final dialect = service.getDialect('zh-TW');
      expect(dialect, isNotNull);
      expect(dialect.nativeName, '繁體中文');
    });

    test('parses french correctly', () async {
      final service = LanguageService();
      service.initialise();
      final dialect = service.getDialect('fr');
      expect(dialect, isNotNull);
      expect(dialect.when.contains("Lorsqu'"), true);
    });
  });
}
