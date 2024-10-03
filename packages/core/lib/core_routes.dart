import 'package:auth/auth.dart';
import 'package:home/home.dart';
import 'package:commons_dependencies/commons_dependencies.dart';

List<RouteBase> coreRoutes() {
  return [...authRoutes(), ...homeRoutes()];
}
