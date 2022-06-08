import 'package:vos_gherkin/src/gherkin/languages/dialect.dart';
import 'package:vos_gherkin/src/gherkin/runnables/runnable.dart';
import 'package:vos_gherkin/src/gherkin/runnables/debug_information.dart';

import '../syntax/syntax_matcher.dart';

class FeatureFileSyntax extends SyntaxMatcher {
  @override
  bool get isBlockSyntax => true;

  @override
  bool hasBlockEnded(SyntaxMatcher syntax) => false;

  @override
  bool isMatch(String line, GherkinDialect dialect) {
    return false;
  }

  @override
  Runnable toRunnable(
    String line,
    RunnableDebugInformation debug,
    GherkinDialect dialect,
  ) {
    throw UnimplementedError();
  }
}
