import 'package:swm_flutter_package/entities/user.dart';
import 'package:swm_flutter_package/services/push_notification_service.dart';
import '../../services/user_service.dart';

class HomeModel {
  final UserService userService;
  final FPPushNotificationService pushNotificationService;

  HomeModel(this.userService, this.pushNotificationService);

  Future<void> signOut() async {
    return await userService.signOut();
  }

  FPUser? user() {
    return userService.getCurrentUser();
  }

  Future<void> requestPermission() async {
    return await pushNotificationService.requestPermission();
  }

  Future<bool?> hasPermission() async {
    return await pushNotificationService.hasPermission();
  }
}