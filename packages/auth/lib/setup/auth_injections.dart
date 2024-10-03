import 'package:auth/data/auth_repo.dart';
import 'package:auth/presentation/auth_controller.dart';
import 'package:commons_dependencies/commons_dependencies.dart';

void authInjections() {
  GetIt.I.registerFactory<AuthRepository>(() => AuthRepositoryImpl());
  GetIt.I.registerFactory<AuthController>(() => AuthController(GetIt.I.get()));
}
