import 'package:flutter/material.dart';
import 'package:flutter_package_sample/views/root/root_model.dart';
import 'package:swm_flutter_package/entities/user.dart';
import 'package:swm_flutter_package/services/auth_service.dart';

class RootViewModel extends ChangeNotifier {
  final RootModel _model;

  RootViewModel() : _model = RootModel(FPAuthService());

  Stream<FPUser?> getUserStream() {
    return _model.getUserStream();
  }

  bool isSignedIn() {
    return _model.isSignedIn();
  }
}