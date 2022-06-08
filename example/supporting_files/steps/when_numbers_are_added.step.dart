import 'package:vos_gherkin/gherkin.dart';
import '../worlds/custom_world.world.dart';

StepDefinitionGeneric WhenTheStoredNumbersAreAdded() {
  return given<CalculatorWorld>(
    'they are added',
    (context) async {
      context.world.calculator.add();
    },
  );
}
