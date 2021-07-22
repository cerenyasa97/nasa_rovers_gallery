import 'package:flutter/cupertino.dart';
import 'package:rovers/screens/login/model/user_model.dart';
import 'package:rovers/services/auth_service/auth_base.dart';
import 'package:rovers/services/auth_service/auth_service.dart';
import 'package:rovers/services/get_it/get_it_service.dart';

enum LoginStatus { LOGGED_IN, LOGGED_OUT }
enum AppState { IDLE, BUSY}

class LoginViewModel extends ChangeNotifier implements AuthBase{
  final AuthBase authService = locator<FirebaseAuthService>();
  UserModel? _user;
  LoginStatus _loginStatus = LoginStatus.LOGGED_OUT;
  AppState _appState = AppState.IDLE;

  LoginViewModel() {
    getCurrentUser();
  }

  get user => _user;

  AppState get appState => _appState;

  set appState(value) {
    _appState = value;
    notifyListeners();
  }

  set loginStatus(value) {
    _loginStatus = value;
    notifyListeners();
  }

  get loginStatus => _loginStatus;

  void getCurrentUser() {
    try{
      _user = authService.currentUser();
      if (user != null) loginStatus = LoginStatus.LOGGED_IN;
    }catch(e){
      print("Current User error: $e");
    }
  }
  @override
  UserModel? currentUser() {
    return user;
  }

  @override
  Future<UserModel?>? signInWithGoogle() async {
    try{
      appState = AppState.BUSY;
      UserModel? user = await authService.signInWithGoogle();
      if(user != null) loginStatus = LoginStatus.LOGGED_IN;
      return user;
    }catch(e){
      return null;
    }finally{
      appState = AppState.IDLE;
    }
  }

  @override
  Future<bool> signOut() async{
    try{
      appState = AppState.BUSY;
      bool res = await authService.signOut();
      if (res){
        loginStatus = LoginStatus.LOGGED_OUT;
      }
      return res;
    }catch(e){
      print("Sign out error: $e");
      return false;
    }finally{
      appState = AppState.IDLE;
    }
  }

  @override
  Future<UserModel?>? signInWithFacebook() async {
    try{
      appState = AppState.BUSY;
      UserModel? user = await authService.signInWithFacebook();
      print(user == null ? "null" : user.userID);
      if(user != null) loginStatus = LoginStatus.LOGGED_IN;
      return user;
    }catch(e){
      return null;
    }finally{
      appState = AppState.IDLE;
    }
  }
}
