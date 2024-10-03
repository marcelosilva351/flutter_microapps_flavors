import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:home/data/home_repo.dart';
import 'package:home/models/user_model.dart';

class HomeController extends GetxController {
  HomeController(this._homeRepo);
  final HomeRepo _homeRepo;
  var loadingUser = false.obs;
  var userModel = UserModel(email: '', photo: '').obs;

  Future<void> getUser() async {
    loadingUser.value = true;
    userModel.value = await _homeRepo.getUser();
    loadingUser.value = false;
  }

  Future<void> postPhoto(XFile file) async {
    loadingUser.value = true;
    await _homeRepo.postPhoto(file);
    loadingUser.value = false;
    await getUser();
  }
}
