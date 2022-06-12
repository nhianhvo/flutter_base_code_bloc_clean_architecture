import 'package:flutter/material.dart';

import 'package:flutter_test_bloc/feature/home/home.dart';
import 'package:flutter_test_bloc/feature/second/second_screen.dart';

// GoRouter router(BuildContext context, String? initialLocation) => GoRouter(
//       initialLocation: initialLocation ?? Routes.login,
//       debugLogDiagnostics: true,
//       routes: [
//         GoRoute(
//           path: Routes.home,
//           builder: (context, state) {
//             return const MyHomePage();
//           },
//         ),
//         GoRoute(
//           path: Routes.second,
//           builder: (context, state) {
//             return const SecondScreen();
//           },
//         ),
//       ],
//     );

// class Routes {
//   static const signup = '/signup';
//   static const login = '/login';
//   static const home = '/home';
//   static const second = '/second';
// }

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case Routes.second:
        return MaterialPageRoute(builder: (_) => const SecondScreen());

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(title: const Text('ERROR')),
      body: const Center(child: Text('Error')),
    );
  });
}

class Routes {
  static const home = '/home';
  static const second = '/second';
}
