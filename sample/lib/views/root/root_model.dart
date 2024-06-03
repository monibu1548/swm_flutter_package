import 'package:swm_flutter_package/entities/user.dart';
import 'package:swm_flutter_package/services/auth_service.dart';

class RootModel {
  final FPAuthService authService;

  RootModel(this.authService);

  Stream<FPUser?> getUserStream() {
    return authService.getUserStream();
  }

  bool isSignedIn() {
    return authService.isSignedIn();
  }
}