import 'package:swm_flutter_package/entities/user.dart';
import 'package:swm_flutter_package/services/auth_service.dart';

class SignInModel {
  final FPAuthService authService;

  SignInModel(this.authService);

  FPUser? currentUser() {
    return authService.getCurrentUser();
  }

  void signInWithKakao() async {
    await authService.signInWithKakao(appScheme: "flutter-package-sample://");
  }

  void signInAnonymously() async {
    await authService.signInAnonymously();
  }
}