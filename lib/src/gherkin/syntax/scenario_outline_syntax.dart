import 'package:vos_gherkin/src/gherkin/languages/dialect.dart';
import 'package:vos_gherkin/src/gherkin/syntax/tag_syntax.dart';

import '../runnables/scenario_outline.dart';
import '../runnables/debug_information.dart';
import './regex_matched_syntax.dart';
import './scenario_syntax.dart';
import './syntax_matcher.dart';

class ScenarioOutlineSyntax
    extends RegExMatchedGherkinSyntax<ScenarioOutlineRunnable> {
  @override
  RegExp pattern(GherkinDialect dialect) {
    final dialectPattern =
        RegExMatchedGherkinSyntax.getMultiDialectRegexPattern(
            dialect.scenarioOutline);
    return RegExp(
      '^\\s*(?:$dialectPattern):(?:\\s*(.+)\\s*)?\$',
      multiLine: false,
      caseSensitive: false,
    );
  }

  @override
  bool get isBlockSyntax => true;

  @override
  bool hasBlockEnded(SyntaxMatcher syntax) =>
      syntax is ScenarioOutlineSyntax ||
      syntax is ScenarioSyntax ||
      (syntax is TagSyntax && syntax.annotating != AnnotatingBlock.examples);

  @override
  ScenarioOutlineRunnable toRunnable(
    String line,
    RunnableDebugInformation debug,
    GherkinDialect dialect,
  ) {
    final name = pattern(dialect).firstMatch(line)!.group(1)!;
    return ScenarioOutlineRunnable(name.trim(), debug);
  }
}
