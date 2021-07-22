import 'package:get_it/get_it.dart';
import 'package:rovers/services/api_service/api_service.dart';
import 'package:rovers/services/auth_service/auth_service.dart';

GetIt locator = GetIt.instance;

setupLocator(){
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => ApiService());
}