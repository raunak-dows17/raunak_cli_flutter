import 'package:raunak_cli/utils/string_utils.dart';

String testTemplate(String projectName) => '''
import 'package:flutter_test/flutter_test.dart';

import 'package:$projectName/main.dart';

void main() {
  testWidgets('${StringUtils.toPascalCase(projectName)} Project test', (WidgetTester tester) async {
    await tester.pumpWidget(const ${StringUtils.toPascalCase(projectName)}());
  });
}
''';
