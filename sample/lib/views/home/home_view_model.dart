import 'package:flutter/material.dart';
import 'package:flutter_package_sample/services/user_service.dart';
import 'package:flutter_package_sample/views/home/home_model.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeModel _model;

  HomeViewModel() : _model = HomeModel(UserService());

  String userID() {
    return _model.user()?.id ?? '-';
  }

  Future<void> signOut() async {
    return await _model.signOut();
  }
}