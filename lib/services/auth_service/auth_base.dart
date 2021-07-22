import 'package:rovers/screens/login/model/user_model.dart';

abstract class AuthBase{
  /// Returns the user currently logged into the app in Firebase of type UserModel
  UserModel? currentUser();
  /// User logs out
  Future<bool> signOut();
  /// A credential is created with the information from the Google user's account and the user is logged in with this credential
  Future<UserModel?>? signInWithGoogle();
  /// A credential is created with the information from the Facebook user's account and the user is logged in with this credential
  Future<UserModel?>? signInWithFacebook();
}