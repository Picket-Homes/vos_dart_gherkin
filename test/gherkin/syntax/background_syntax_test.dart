import 'package:vos_gherkin/src/gherkin/runnables/background.dart';
import 'package:vos_gherkin/src/gherkin/runnables/debug_information.dart';
import 'package:vos_gherkin/src/gherkin/syntax/background_syntax.dart';
import 'package:test/test.dart';

import '../../mocks/en_dialect_mock.dart';

void main() {
  group('isMatch', () {
    test('matches correctly', () {
      final syntax = BackgroundSyntax();
      expect(syntax.isMatch('Background: ', EnDialectMock()), true);
      expect(syntax.isMatch('Background: ', EnDialectMock()), true);
      expect(syntax.isMatch('Background: something', EnDialectMock()), true);
      expect(syntax.isMatch(' Background:   something', EnDialectMock()), true);
    });

    test('does not match', () {
      final syntax = BackgroundSyntax();
      expect(syntax.isMatch('Background', EnDialectMock()), false);
      expect(syntax.isMatch('Background something', EnDialectMock()), false);
      expect(syntax.isMatch('#Background: something', EnDialectMock()), false);
    });
  });

  group('toRunnable', () {
    test('creates BackgroundRunnable', () {
      final syntax = BackgroundSyntax();
      final runnable = syntax.toRunnable(
        'Background: A background 123',
        RunnableDebugInformation.EMPTY(),
        EnDialectMock(),
      );
      expect(runnable, isNotNull);
      expect(runnable, predicate((x) => x is BackgroundRunnable));
      expect(runnable.name, equals('A background 123'));
    });

    test('creates BackgroundRunnable with empty name', () {
      final syntax = BackgroundSyntax();
      final runnable = syntax.toRunnable(
        'Background:   ',
        RunnableDebugInformation.EMPTY(),
        EnDialectMock(),
      );
      expect(runnable, isNotNull);
      expect(runnable, predicate((x) => x is BackgroundRunnable));
      expect(runnable.name, equals(''));
    });

    test('creates BackgroundRunnable with no name', () {
      final syntax = BackgroundSyntax();
      final runnable = syntax.toRunnable(
        'Background:',
        RunnableDebugInformation.EMPTY(),
        EnDialectMock(),
      );
      expect(runnable, isNotNull);
      expect(runnable, predicate((x) => x is BackgroundRunnable));
      expect(runnable.name, equals(''));
    });
  });
}
