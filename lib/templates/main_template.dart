import 'package:raunak_cli/utils/string_utils.dart';

String mainTemplate(String projectName) => '''
import 'package:flutter/material.dart';
import 'package:$projectName/config/theme/app_theme.dart';
import 'package:$projectName/config/routes/app_routes.dart';
import 'package:$projectName/config/routes/navigate.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
  
  Navigate.init(AppRoutes.routes);
  
  runApp(const ${StringUtils.toPascalCase(projectName)}());
}

class ${StringUtils.toPascalCase(projectName)} extends StatelessWidget {
  const ${StringUtils.toPascalCase(projectName)}({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '$projectName',
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),  
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.routes,
    );
  }
}
''';
