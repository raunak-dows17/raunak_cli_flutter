String appRoutesTemplate() => '''
import 'package:go_router/go_router.dart';

class AppRoutes {
  static String get home => 'home';

  static GoRouter routes = GoRouter(routes: [
    GoRoute(path: "/", name: home,
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('Welcome to {{projectName}} 🚀'),
        ),
      ),
    ),);
  ]);
}

''';
