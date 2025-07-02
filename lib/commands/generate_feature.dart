import 'dart:io';

Future<void> generateFeature(String name) async {
  final base = Directory('lib/feature$name');
  
  final folders = [
    'data/datasources',
    'data/models',
    'data/repository',
    'domain/entities',
    'domain/usecases',
    'domain/repository',
    'application/pages',
    'application/widgets',
    'application/providers',
  ];
  
  for (final path in folders) {
    final dir = Directory('${base.path}/$path');
    await dir.create(recursive: true);
  }
  
  print('✅ Feature "$name" generated!');
}
