import 'package:auth/presentation/pages/auth_page.dart';
import 'package:commons_dependencies/commons_dependencies.dart';

List<RouteBase> authRoutes() {
  return [
    GoRoute(
      path: '/',
      builder: (context, GoRouterState state) {
        return const AuthPage();
      },
    ),
  ];
}
