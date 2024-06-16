import 'package:flutter/material.dart';
import 'package:flutter_package_sample/services/user_service.dart';
import 'package:flutter_package_sample/views/root/root_model.dart';
import 'package:swm_flutter_package/entities/user.dart';

class RootViewModel extends ChangeNotifier {
  final RootModel _model;

  RootViewModel() : _model = RootModel(UserService());

  Stream<FPUser?> getUserStream() {
    return _model.getUserStream();
  }

  bool isSignedIn() {
    return _model.isSignedIn();
  }
}