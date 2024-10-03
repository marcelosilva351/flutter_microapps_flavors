// ignore_for_file: use_build_context_synchronously

import 'package:auth/data/auth_repo.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  AuthController(this._authRepository);
  final AuthRepository _authRepository;

  var loadingCreateUser = false.obs;

  Future<void> createUser(
      BuildContext context, String email, String password) async {
    try {
      loadingCreateUser.value = true;
      await _authRepository.createUser(email, password);
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("User criado com sucesso!"),
            );
          });
      GoRouter.of(context).push('/home');
      loadingCreateUser.value = false;
    } catch (e) {
      loadingCreateUser.value = false;
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Erro ao criar user"),
            );
          });
    }
  }
}
