import 'package:flutter/material.dart';
import 'package:tsts/firebase_options_prod.dart';

import 'flavors.dart';

import 'main.dart' as runner;
import 'package:commons_dependencies/commons_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  F.appFlavor = Flavor.prod;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await runner.main();
}
