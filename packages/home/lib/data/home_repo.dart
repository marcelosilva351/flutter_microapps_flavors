import 'dart:io';

import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:home/models/user_model.dart';

abstract class HomeRepo {
  Future<UserModel> getUser();
  Future<bool> postPhoto(XFile file);
}

class HomeRepoImpl implements HomeRepo {
  @override
  Future<UserModel> getUser() async {
    final email = FirebaseAuth.instance.currentUser!.email;

    try {
      final photo = await FirebaseStorage.instance
          .ref('users')
          .child('$email')
          .getDownloadURL();
      return UserModel(email: email!, photo: photo);
    } catch (e) {
      return UserModel(email: email!, photo: null);
    }
  }

  @override
  Future<bool> postPhoto(XFile file) async {
    final email = FirebaseAuth.instance.currentUser!.email;

    await FirebaseStorage.instance
        .ref('users')
        .child('$email')
        .putFile(File(file.path));
    return true;
  }
}
