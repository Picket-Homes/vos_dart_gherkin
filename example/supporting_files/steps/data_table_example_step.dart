import 'package:vos_gherkin/gherkin.dart';

/// This step expects a multi-line string proceeding it
///
/// For example:
///
/// `Given I add the users`
///  | Firstname | Surname | Age | Gender |
///  | Woody     | Johnson | 28  | Male   |
///  | Edith     | Summers | 23  | Female |
///  | Megan     | Hill    | 83  | Female |
StepDefinitionGeneric GivenIAddTheUsers() {
  return given1<GherkinTable, World>(
    'I add the users',
    (dataTable, _) async {
      for (var row in dataTable.rows) {
        // do something with row
        row.columns.forEach((columnValue) => print(columnValue));
      }

      // or get the table as a map (column values keyed by the header)
      final columns = dataTable.asMap();
      final personOne = columns.elementAt(0);
      final personOneName = personOne['Firstname'];
      print('Name of first person: `$personOneName`');
    },
  );
}
