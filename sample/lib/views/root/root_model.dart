import 'package:flutter_package_sample/services/user_service.dart';
import 'package:swm_flutter_package/entities/user.dart';

class RootModel {
  final UserService userService;

  RootModel(this.userService);

  Stream<FPUser?> getUserStream() {
    return userService.getUserStream();
  }

  bool isSignedIn() {
    return userService.isSignedIn();
  }
}