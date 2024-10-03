import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:home/presentaion/home_page.dart';

List<RouteBase> homeRoutes() {
  return [
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, GoRouterState state) {
        return const HomePage();
      },
    ),
  ];
}
