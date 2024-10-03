import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:home/data/home_repo.dart';
import 'package:home/presentaion/home_controller.dart';

void homeInjection() {
  GetIt.I.registerFactory<HomeRepo>(() => HomeRepoImpl());
  GetIt.I.registerFactory<HomeController>(() => HomeController(GetIt.I.get()));
}
