import 'package:vos_gherkin/src/gherkin/runnables/debug_information.dart';
import 'package:vos_gherkin/src/gherkin/runnables/tags.dart';
import 'package:vos_gherkin/src/gherkin/syntax/tag_syntax.dart';
import 'package:test/test.dart';

import '../../mocks/en_dialect_mock.dart';

void main() {
  group('isMatch', () {
    test('matches correctly', () {
      final syntax = TagSyntax();
      expect(
          syntax.isMatch(
            '@tagone @tagtow @tag_three',
            EnDialectMock(),
          ),
          true);
      expect(
          syntax.isMatch(
            '@tag',
            EnDialectMock(),
          ),
          true);
      expect(
          syntax.isMatch(
            '@tag one',
            EnDialectMock(),
          ),
          true);
    });

    test('does not match', () {
      final syntax = TagSyntax();
      expect(
          syntax.isMatch(
            'not a tag',
            EnDialectMock(),
          ),
          false);
      expect(
          syntax.isMatch(
            '#@tag @tag2',
            EnDialectMock(),
          ),
          false);
    });
  });

  group('toRunnable', () {
    test('creates TextLineRunnable', () {
      final syntax = TagSyntax();
      final runnable = syntax.toRunnable(
        '@tag1 @tag2   @tag3@tag_4',
        RunnableDebugInformation.EMPTY(),
        EnDialectMock(),
      );
      expect(runnable, isNotNull);
      expect(runnable, predicate((x) => x is TagsRunnable));
      expect(runnable.tags, equals(['@tag1', '@tag2', '@tag3', '@tag_4']));
    });
  });
}
