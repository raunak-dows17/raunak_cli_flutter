String apiEntityTemplate() => '''
class ApiEntity<T> {
  bool status;
  String message;
  T? data;

  ApiEntity({required this.status, required this.message, this.data});
}
''';
