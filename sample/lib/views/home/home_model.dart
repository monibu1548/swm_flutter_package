import 'package:swm_flutter_package/entities/user.dart';
import '../../services/user_service.dart';

class HomeModel {
  final UserService userService;

  HomeModel(this.userService);

  Future<void> signOut() async {
    return await userService.signOut();
  }

  FPUser? user() {
    return userService.getCurrentUser();
  }
}