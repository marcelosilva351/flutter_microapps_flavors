import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/presentaion/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController homeController;

  @override
  void initState() {
    homeController = GetIt.I.get();
    homeController.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(("HOME PACKAGE")),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            Obx(() {
              if (homeController.loadingUser.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (homeController.userModel.value.photo == null) {
                return GestureDetector(
                    onTap: () async {
                      ImagePicker()
                          .pickImage(source: ImageSource.gallery)
                          .then((value) {
                        if (value != null) {
                          homeController.postPhoto(value);
                        }
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 80,
                      ),
                    ));
              }
              return Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            NetworkImage(homeController.userModel.value.photo!),
                        fit: BoxFit.cover)),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: const TextStyle(fontSize: 20),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
