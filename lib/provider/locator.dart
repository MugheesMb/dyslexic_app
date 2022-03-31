

import 'package:dyslexiaa/provider/authprovider.dart';
import 'package:dyslexiaa/provider/storageRepo.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:get_it/get_it.dart';


final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<authProvider>(authProvider());
  locator.registerSingleton<StorageRepo>(StorageRepo());
  locator.registerSingleton<UserController>(UserController());
}
