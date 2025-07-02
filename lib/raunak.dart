import 'dart:io';

import 'package:args/args.dart';
import 'package:raunak_cli/commands/init.dart';

void run (List<String> args) {
  final parser =ArgParser();

  parser.addCommand('init').addOption('dependencies', abbr: 'd', help: 'Comma-separated list of dependencies to add dio and go_router added by default', valueHelp: 'flutter_riverpod: any, flutter_secure_storage: any');
  parser.addCommand('generate:feature');
  parser.addCommand('generate:model');

  final argResults = parser.parse(args);

  switch(argResults.command?.name) {
    case 'init':
      final rest = argResults.command?.rest;

      if (rest == null && rest!.isEmpty) {
        print('❌ Please provide a project name.');
        exit(1);
      }

      final projectName = rest.first;
      final depsRaw = argResults.command?['dependencies'] as String?;
      final dependencies = depsRaw?.split(',').map((e) => e.trim()).toList() ?? [];

      init(projectName, dependencies);
      break;
    case 'generate:feature':
      print('Generating feature...');
      // Add your feature generation logic here
      break;
    case 'generate:model':
      print('Generating model...');
      // Add your model generation logic here
      break;
    default:
      _showHelp(parser);
  }
}

void _showHelp(ArgParser parser) {
  stdout.writeln('🧠 Usage:');
  stdout.writeln('dart run bin/raunak_cli_dart.dart <command>');
  stdout.writeln(parser.usage);
}
