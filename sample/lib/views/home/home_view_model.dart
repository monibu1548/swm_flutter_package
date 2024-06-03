import 'package:flutter/material.dart';
import 'package:flutter_package_sample/views/home/home_model.dart';
import 'package:swm_flutter_package/services/auth_service.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeModel _model;

  HomeViewModel() : _model = HomeModel(FPAuthService());

  String userID() {
    return _model.user()?.id ?? '-';
  }

  Future<void> signOut() async {
    return await _model.signOut();
  }
}