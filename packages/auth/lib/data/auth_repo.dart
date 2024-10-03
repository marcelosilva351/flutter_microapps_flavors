import 'package:commons_dependencies/commons_dependencies.dart';

abstract class AuthRepository {
  Future<void> createUser(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> createUser(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
