import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:raunak_cli/templates/api_client_template.dart';
import 'package:raunak_cli/templates/api_endpoints_template.dart';
import 'package:raunak_cli/templates/api_entity_template.dart';
import 'package:raunak_cli/templates/api_response_template.dart';
import 'package:raunak_cli/templates/app_routes_template.dart';
import 'package:raunak_cli/templates/env_config_template.dart';
import 'package:raunak_cli/templates/env_template.dart';
import 'package:raunak_cli/templates/local_storage_template.dart';
import 'package:raunak_cli/templates/main_template.dart';
import 'package:raunak_cli/templates/navigate_template.dart';
import 'package:raunak_cli/templates/test_template.dart';
import 'package:raunak_cli/templates/theme_template.dart';
import 'package:raunak_cli/templates/token_storage_template.dart';
import 'package:raunak_cli/utils/string_utils.dart';

Future<void> init(String projectName, List<String> dependencies) async {
  print('🎉 Initializing project: $projectName');

  final createResult = await Process.run('flutter', ['create', projectName]);
  stdout.write(createResult.stdout);
  stderr.write(createResult.stderr);

  if(createResult.exitCode != 0) {
    print('❌ Failed to create project: $projectName');

    return;
  }

  final libPath = p.join(projectName, 'lib');
  final folders = [
    'config/routes',
    'config/theme',
    'config/env',
    'config/storage',
    'core/error',
    'core/datasources/local',
    'core/datasources/remote',
    'core/entities',
    'core/models',
    'core/utils/constants',
    'core/usecases',
    'features',
  ];

  for (final folder in folders) {
    final dir = Directory(p.join(libPath, folder));
    if(!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('📁 Created: ${dir.path}');
    }
  }

  final mainFile = File(p.join(libPath, 'main.dart'));
  mainFile.writeAsStringSync(mainTemplate(projectName));

  final testFile = File(p.join(projectName, 'test', 'widget_test.dart'));
  testFile.writeAsStringSync(testTemplate(projectName));

  print('✅ Updated main.dart with clean architecture entry');

  // AppTheme
  final themeFile = File(p.join(libPath, 'config/theme/app_theme.dart'));
  final primaryColor = StringUtils.prompt('🎨 Enter primary color hex (default: 0xFF2196F3):')?.trim();
  final colorValue = primaryColor?.isNotEmpty == true ? primaryColor : '0xFF2196F3';

  themeFile.writeAsStringSync(themeTemplate().replaceAll('{{primaryColor}}', colorValue!));
  print('🎨 Created app_theme.dart with primary color $colorValue');
  
  final appName = "{{projectName}}";
  
  // env file
  final envFile = File(p.join(projectName, '.env'));
  envFile.writeAsStringSync(envTemplate());

  // config/env/env.config.dart
  final envConfigFile = File(p.join(libPath, 'config/env/env.config.dart'));
  envConfigFile.writeAsStringSync(envConfigTemplate());

  // config/routes/app_routes.dart
  final routesFile = File(p.join(libPath, 'config/routes/app_routes.dart'));
  routesFile.writeAsStringSync(appRoutesTemplate());

  // config/storage/local_storage.dart
  final storageFile = File(p.join(libPath, 'config/storage/local_storage.dart'));
  storageFile.writeAsStringSync(localStorageTemplate());

  // config/routes/navigate.dart
  final navigateFile = File(p.join(libPath, 'config/routes/navigate.dart'));
  navigateFile.writeAsStringSync(navigateTempalate());

  // core/utils/constants/api_endpoints.dart
  final apiEndpointsFile = File(p.join(libPath, 'core/utils/constants/api_endpoints.dart'));
  apiEndpointsFile.writeAsStringSync(apiEndPointTemplate().replaceAll(appName, projectName));

  // core/datasources/remote/api_client.dart
  final apiClientFile = File(p.join(libPath, 'core/datasources/remote/api_client.dart'));
  apiClientFile.writeAsStringSync(apiClientTemplate().replaceAll(appName, projectName));

  // core/entities/api_entity.dart
  final apiEntityFile = File(p.join(libPath, 'core/entities/api_entity.dart'));
  apiEntityFile.writeAsStringSync(apiEntityTemplate());

  // core/models/api_model.dart
  final apiModelFile = File(p.join(libPath, 'core/models/api_model.dart'));
  apiModelFile.writeAsStringSync(apiResponseTemplate().replaceAll(appName, projectName));

  // core/datasources/local/user_token.dart
  final userTokenFile = File(p.join(libPath, 'core/datasources/local/user_token.dart'));
  userTokenFile.writeAsStringSync(tokenStorageTemplate().replaceAll(appName, projectName));

  // Dependencies
  final filteredDependencies = dependencies
      .where((dep) {
    final name = dep.split(':').first.trim();
    return name != 'dio' && name != 'go_router';
  })
      .toList();

  final pubspecFile = File(p.join(projectName, 'pubspec.yaml'));
  var pubspecContent = pubspecFile.readAsStringSync();

  const baseDeps = [
    'dio: any',
    'google_fonts: any',
    'flutter_dotenv: any',
    'flutter_secure_storage: any',
    'go_router: any'
  ];

  for (var dep in baseDeps) {
    if (!pubspecContent.contains(dep.split(':').first)) {
      pubspecContent = pubspecContent.replaceFirstMapped(
          RegExp(r'cupertino_icons:\s*\^?[\d.]+'),
              (match) => '${match.group(0)}\n  $dep'
      );
    }
  }

  if(filteredDependencies.isNotEmpty) {
  final updatedContent = pubspecContent.replaceFirst(
      'go_router: any',
      'go_router: any\n  ${dependencies.map((dep) => dep.replaceAll(":", ": ")).join('\n  ')}',
    );
  pubspecFile.writeAsStringSync(updatedContent);
  }


  final pubGetResult = await Process.run('flutter', ['pub', 'get'], workingDirectory: projectName);
  stdout.write(pubGetResult.stdout);
  stderr.write(pubGetResult.stderr);

  print('📦 Added dependencies: ${dependencies.join(', ')}');

  print('🎉 Project "$projectName" initialized successfully with Clean Architecture!');
  return;
}
