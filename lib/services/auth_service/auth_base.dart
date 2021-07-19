import 'package:rovers/screens/login/model/user_model.dart';

abstract class AuthBase{
  UserModel? currentUser();
  Future<UserModel?> signInAnonymously();
  Future<bool> signOut();
  Future<UserModel?>? signInWithGoogle();
  Future<UserModel?>? signInWithFacebook();
}