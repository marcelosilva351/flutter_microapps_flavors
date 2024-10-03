import 'package:auth/presentation/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:commons_dependencies/commons_dependencies.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late AuthController authController;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    authController = GetIt.I.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AUTH PACKAGE"),
      ),
      body: SizedBox.expand(
        child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(label: Text("Email")),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(label: Text("Senha")),
                ),
                Obx(() {
                  if (authController.loadingCreateUser.value) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                      onPressed: () {
                        authController.createUser(context, emailController.text,
                            passwordController.text);
                      },
                      child: const Text("Criar user"));
                })
              ],
            )),
      ),
    );
  }
}
