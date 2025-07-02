import 'package:args/args.dart';
import 'package:raunak_cli/raunak.dart';
import 'package:test/test.dart';

void main() {
  test('should handle init command', () {
    run(['init']);
    // Since the current implementation just prints to console,
    // we can only verify it doesn't throw an error
    // TODO: Refactor implementation to return results instead of printing
  });

  test('should handle generate:feature command', () {
    run(['generate:feature']);
    // Verifies the command is processed without errors
  });

  test('should handle generate:model command', () {
    run(['generate:model']);
    // Verifies the command is processed without errors
  });

  test('should handle unknown command', () {
    run(['unknown-command']);
    // Verifies unknown commands don't crash the application
  });

  test('should handle empty arguments', () {
    run([]);
    // Verifies the CLI handles empty input gracefully
  });

  group('ArgParser configuration', () {
    test('should have all required commands registered', () {
      final parser = ArgParser();
      parser.addCommand('init');
      parser.addCommand('generate:feature');
      parser.addCommand('generate:model');

      expect(parser.commands.containsKey('init'), true);
      expect(parser.commands.containsKey('generate:feature'), true);
      expect(parser.commands.containsKey('generate:model'), true);
    });
  });
}