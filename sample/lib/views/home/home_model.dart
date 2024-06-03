import 'package:swm_flutter_package/entities/user.dart';
import 'package:swm_flutter_package/services/auth_service.dart';

class HomeModel {
  final FPAuthService authService;

  HomeModel(this.authService);

  Future<void> signOut() async {
    return await authService.signOut();
  }

  FPUser? user() {
    return authService.getCurrentUser();
  }
}