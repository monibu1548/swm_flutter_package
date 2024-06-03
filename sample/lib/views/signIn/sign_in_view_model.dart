import 'package:flutter/material.dart';
import 'package:flutter_package_sample/views/signIn/sign_in_model.dart';
import 'package:swm_flutter_package/entities/user.dart';
import 'package:swm_flutter_package/services/auth_service.dart';

class SignInViewModel extends ChangeNotifier {
  final SignInModel _model;

  SignInViewModel() : _model = SignInModel(FPAuthService());

  FPUser? currentUser() {
    return _model.currentUser();
  }

  void signInWithKakao() {
    return _model.signInWithKakao();
  }

  void signInAnonymously() {
    return _model.signInAnonymously();
  }
}