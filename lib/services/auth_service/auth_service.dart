import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rovers/screens/login/model/user_model.dart';
import 'package:rovers/services/auth_service/auth_base.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  UserModel? currentUser() {
    try {
      User? user = _firebaseAuth.currentUser;
      return _userFromFirebase(user);
    } catch (e) {
      print("User error: $e");
      return null;
    }
  }

  UserModel? _userFromFirebase(User? user) {
    if (user == null)
      return null;
    else
      return UserModel(userID: user.uid);
  }

  @override
  Future<UserModel?> signInAnonymously() async {
    try {
      UserCredential res = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(res.user);
    } catch (e) {
      print("Sign in anonymously error: $e");
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      if (_googleSignIn.currentUser != null) _googleSignIn.signOut();
      if(FacebookAuth.instance.accessToken != null) FacebookAuth.instance.logOut();
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("Sign out error: $e");
      return false;
    }
  }

  @override
  Future<UserModel?> signInWithGoogle() async {
    UserCredential? result;
    GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null)
        result = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));
    }
    return result != null ? UserModel(userID: result.user!.uid) : null;
  }

  @override
  Future<UserModel?>? signInWithFacebook() async {
    late OAuthCredential credential;
    late UserCredential userCredential;
    final _facebookRes = await FacebookAuth.instance.login(permissions: ["public_profile", "email"]);
    switch (_facebookRes.status) {
      case LoginStatus.success:
        try {
          if(_facebookRes.accessToken != null) {
            AccessToken? token = await FacebookAuth.instance.accessToken;
            credential = FacebookAuthProvider.credential(token!.token);
            if(token != null) userCredential = await _firebaseAuth.signInWithCredential(credential);
            return UserModel(userID: userCredential.user!.uid);
          }
        } catch (e) {
          print("signin with credential error: $e");
        }

        return null; //UserModel(userID: credential.user!.uid);
      case LoginStatus.cancelled:
        print("User cancelled Facebook login");
        return null;
      case LoginStatus.failed:
        print("Facebook login error: ${_facebookRes.message}");
        return null;
      default:
        print("Facebook login failed");
        return null;
    }
  }
}
